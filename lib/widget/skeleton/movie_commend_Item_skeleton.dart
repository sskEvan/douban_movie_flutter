import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'skeleton.dart';

/**
 * 电影短评列表item组件
 */
class MovieCommendItemSkeleton extends StatelessWidget {
  MovieCommendItemSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 14,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30,
              height: 30,
              child: Container(
                decoration:
                    SkeletonDecoration(context: context, isCircle: true),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 10,
                  decoration: SkeletonDecoration(context: context),
                ),
                SizedBox(height: 2),
                Container(
                  width: 100,
                  height: 10,
                  decoration: SkeletonDecoration(context: context),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(context: context),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(context: context),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(context: context),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 10,
          decoration: SkeletonDecoration(context: context),
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0xdddddddd)),
      ],
    );
  }
}
