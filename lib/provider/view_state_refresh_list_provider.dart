import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewStateRefreshListProvider<T> extends ViewStateListProvider<T> {
  /// 分页第一页页码
  static const int pageNumFirst = 0;

  /// 当前页码
  int _currentPageNum = pageNumFirst;

  /// 分页条目数量
  static const int pageSize = 20;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ViewStateRefreshListProvider(BuildContext context) : super(context);

  RefreshController get refreshController => _refreshController;

  Future<List<T>> refresh({bool init = false}) async {
    try {
      _currentPageNum = pageNumFirst;
      var data = await loadData(pageSize: pageSize, pageNum: pageNumFirst);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();
        // 小于分页的数量,禁止上拉加载更多
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          //防止上次上拉加载更多失败,需要重置状态
          refreshController.loadComplete();
        }
        setIdle();
        return data;
      }
    } catch (e, s) {
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      return null;
    }
  }


  /// 上拉加载更多
  Future<List<T>> loadMore() async {
    try {
      var data = await loadData(pageSize: pageSize, pageNum: ++_currentPageNum);
      if (data.isEmpty) {
        _currentPageNum--;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _currentPageNum--;
      refreshController.loadFailed();
      debugPrint('error--->\n' + e.toString());
      debugPrint('statck--->\n' + s.toString());
      return null;
    }
  }

  Future<List<T>> loadData({@required int pageSize, @required int pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
