import 'package:douban_movie_flutter/provider/view_state_provider.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class ViewStateListProvider<T> extends ViewStateProvider {
  /// 页面数据
  List<T> list = [];
  Object arguments;

  ViewStateListProvider(BuildContext context) : super(context);

  /// 第一次进入页面loading skeleton
  initData({Object arguments}) async {
    this.arguments = arguments;
    setBusy();
    await refresh(init: true);
  }

  // 下拉刷新
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData(arguments: arguments);
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  // 加载数据
  Future<List<T>> loadData({Object arguments});

  onCompleted(List<T> data) {}
}
