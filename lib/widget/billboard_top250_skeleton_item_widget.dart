
import 'package:flutter/material.dart';
import 'skeleton.dart';

class BillboardTop250SkeletonItemWidget extends StatelessWidget {
  final int index;
  var isDark;

  BillboardTop250SkeletonItemWidget({this.index: 0});

  @override
  Widget build(BuildContext context) {
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
      width: 110,
      height: 146,
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
