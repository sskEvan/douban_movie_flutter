import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewStateWidget<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T provider;
  final Widget child;
  final Function(T provider) onProviderReady;
  final bool autoDispose;

  ViewStateWidget(
      {Key key,
      @required this.builder,
      @required this.provider,
      this.child,
      this.onProviderReady,
      this.autoDispose})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewStateWidgetState<T>();
}

class _ViewStateWidgetState<T extends ChangeNotifier>
    extends State<ViewStateWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.provider;
    widget.onProviderReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}

class ViewStateWidget2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends StatefulWidget {
  final Widget Function(BuildContext context, A model1, B model2, Widget child)
      builder;
  final A provider1;
  final B provider2;
  final Widget child;
  final Function(A model1, B model2) onProviderReady;
  final bool autoDispose;

  ViewStateWidget2({
    Key key,
    @required this.builder,
    @required this.provider1,
    @required this.provider2,
    this.child,
    this.onProviderReady,
    this.autoDispose,
  }) : super(key: key);

  _ViewStateWidgetState2<A, B> createState() => _ViewStateWidgetState2<A, B>();
}

class _ViewStateWidgetState2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends State<ViewStateWidget2<A, B>> {
  A model1;
  B model2;

  @override
  void initState() {
    model1 = widget.provider1;
    model2 = widget.provider2;
    widget.onProviderReady?.call(model1, model2);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) {
      model1.dispose();
      model2.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<A>.value(value: model1),
          ChangeNotifierProvider<B>.value(value: model2),
        ],
        child: Consumer2<A, B>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}

/// 加载中
class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
