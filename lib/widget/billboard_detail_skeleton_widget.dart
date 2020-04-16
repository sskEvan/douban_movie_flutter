import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'movie_skeleton_item_widget.dart';
import 'skeleton.dart';

class BillboardDetailSkeletonWidget extends StatelessWidget {
  var isDark;

  BillboardDetailSkeletonWidget();

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Shimmer.fromColors(
            period: Duration(milliseconds: 1200),
            baseColor: isDark ? Colors.grey[700] : Colors.grey[350],
            highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  width: ScreenUtil.width,
                  height: 180,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: ScreenUtil.width * 0.6,
                    height: 20,
                    decoration: SkeletonDecoration(isDark: isDark),
                  ),
                ),

                Column(
                  children:  List.generate(6, (index) {
                    return Container(
                      child: MovieSkeletonItemWidget(showIndexNumber: true),
                    );
                  }),
                ),

              ],
            )));
  }
}
