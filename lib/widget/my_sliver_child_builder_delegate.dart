import 'package:flutter/cupertino.dart';

class MySliverChildBuilderDelegate extends SliverChildBuilderDelegate {

  final int childCount;
  final IndexedWidgetBuilder builder;

  MySliverChildBuilderDelegate(this.builder, {this.childCount}) : super(builder, childCount: childCount);

  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex, double leadingScrollOffset, double trailingScrollOffset) {
    debugPrint('firstIndex:${firstIndex},lastIndex:${lastIndex}'
        ',leadingScrollOffset:${leadingScrollOffset},trailingScrollOffset:${trailingScrollOffset}');
    return super.estimateMaxScrollOffset(firstIndex, lastIndex, leadingScrollOffset, trailingScrollOffset);
  }

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    //debugPrint('第一个Item是$firstIndex，最后一个Item是$lastIndex');
  }

}