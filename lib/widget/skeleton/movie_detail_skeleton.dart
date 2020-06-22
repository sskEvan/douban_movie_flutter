import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/**
 * 电影详情页骨架组件
 */
class MovieDetailSkeleton extends StatelessWidget {

  MovieDetailSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      period: Duration(milliseconds: 1200),
      baseColor: ThemeHelper.wrapColor(context, darkModeColor: Color(0xFF373737), lightModeColor:Colors.grey[350]),
      highlightColor: ThemeHelper.wrapColor(context,
          darkModeColor: Colors.grey[700], lightModeColor: Colors.grey[200]),
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildMovieHeaderSkeleton(context),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 132,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: 100,
                  height: 14,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
                Container(
                  width: ScreenUtil.width,
                  height: 10,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 15),
              ])),
    );
  }

  Widget _buildMovieHeaderSkeleton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100,
          height: 130,
          decoration: SkeletonDecoration(context: context),
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
              decoration: SkeletonDecoration(context: context),
            ),
            SizedBox(height: 5),
            Container(
              width: 100,
              height: 12,
              decoration: SkeletonDecoration(context: context),
            ),
            SizedBox(height: 8),
            Container(
              width: 250,
              height: 10,
              decoration: SkeletonDecoration(context: context),
            ),
            SizedBox(height: 5),
            Container(
              width: 250,
              height: 10,
              decoration: SkeletonDecoration(context: context),
            ),
          ],
        )
      ],
    );
  }
}
