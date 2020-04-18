
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'skeleton.dart';

class BillboardTop250SkeletonItemWidget extends StatelessWidget {
  final int index;
  var isDark;

  var contentWidth;
  var contentHeight;

  BillboardTop250SkeletonItemWidget({this.index: 0});

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

    isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildMoviePosterSkeleton(),
              SizedBox(height: 4),
              _buildMovieTitleSkeleton(),
              SizedBox(height: 4),
              _buildMovieScoreSkeleton(context)
            ],
          ),
        );
  }

  Widget _buildMoviePosterSkeleton() {
    return Container(
      width: contentWidth,
      height: contentHeight - 25,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildMovieTitleSkeleton() {
    return Container(
      width: 80,
      height: 8,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildMovieScoreSkeleton(BuildContext context) {
    return Container(
      width: 80,
      height: 8,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

}
