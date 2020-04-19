import 'package:douban_movie_flutter/provider/view_state_provider.dart';
import 'package:flutter/cupertino.dart';

abstract class ViewStateCommonProvider<T> extends ViewStateProvider {
  /// 页面数据
  T data;
  Object arguments;

  ViewStateCommonProvider(BuildContext context) : super(context);

  /// 第一次进入页面loading skeleton
  initData(Object arguments) async {
    this.arguments = arguments;
    setBusy();
    await refresh();
  }

  // 下拉刷新
  refresh() async {
    try {
      T data = await loadData(arguments);
      if (data == null) {
        setEmpty();
      } else {
        onCompleted(data);
        setIdle();
      }
    } catch (e, s) {
      setError(e, s);
    }
  }

  // 加载数据
  Future<T> loadData(Object arguments);

  onCompleted(T data) {}
}
