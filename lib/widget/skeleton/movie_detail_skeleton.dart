import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/**
 * 电影详情页骨架组件
 */
class MovieDetailSkeleton extends StatelessWidget {
  var isDark;


  MovieDetailSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      period: Duration(milliseconds: 1200),
      baseColor: isDark ? Colors.grey[700] : Colors.grey[350],
      highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildMovieHeaderSkeleton(),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 132,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 15),
              ])),
    );
  }

  Widget _buildMovieHeaderSkeleton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100,
          height: 130,
          decoration: SkeletonDecoration(isDark: isDark),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 14,
              decoration: SkeletonDecoration(isDark: isDark),
            ),
            SizedBox(height: 5),
            Container(
              width: 100,
              height: 12,
              decoration: SkeletonDecoration(isDark: isDark),
            ),
            SizedBox(height: 8),
            Container(
              width: 250,
              height: 10,
              decoration: SkeletonDecoration(isDark: isDark),
            ),
            SizedBox(height: 5),
            Container(
              width: 250,
              height: 10,
              decoration: SkeletonDecoration(isDark: isDark),
            ),
          ],
        )
      ],
    );
  }
}
