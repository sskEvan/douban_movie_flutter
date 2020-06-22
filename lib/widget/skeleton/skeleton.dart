import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  SkeletonBox(
      {@required this.width, @required this.height, this.isCircle: false});

  @override
  Widget build(BuildContext context) {
    Divider.createBorderSide(context, width: 0.7);
    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(isCircle: isCircle, context: context),
    );
  }
}

/// 骨架屏 元素背景 ->形状及颜色
class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({isCircle: false, BuildContext context})
      : super(
          color: Colors.grey[500],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}

/// 骨架屏 元素背景 ->形状及颜色
class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration()
      : super(border: Border(bottom: BorderSide(width: 0.3)));
}

/// 骨架屏
class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final IndexedWidgetBuilder builder;

  SkeletonList(
      {this.length: 6, //一般屏幕长度够用
      this.padding = const EdgeInsets.all(0),
      @required this.builder});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          baseColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.grey[350]),
          highlightColor: ThemeHelper.wrapColor(context,
              darkModeColor: Colors.grey[700], lightModeColor: Colors.grey[200]),
          child: Padding(
              padding: padding,
              child: Column(
                children:
                    List.generate(length, (index) => builder(context, index)),
              ))),
    );
  }
}

/// 骨架屏
class SkeletonGrid extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final int crossAxisCount;
  final double childAspectRatio;
  final IndexedWidgetBuilder builder;

  SkeletonGrid(
      {this.length: 6,
      this.padding = const EdgeInsets.all(0),
      @required this.builder,
      this.crossAxisCount = 3,
      this.childAspectRatio = 1});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          baseColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.grey[350]),
          highlightColor: ThemeHelper.wrapColor(context,
              darkModeColor: Colors.grey[700], lightModeColor: Colors.grey[200]),
          child: Padding(
            padding: padding,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, //横轴三个子widget
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  return builder(context, index);
                }),
          )),
    );
  }
}
