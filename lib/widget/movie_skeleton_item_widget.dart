import 'package:flutter/material.dart';

import 'skeleton.dart';

class MovieSkeletonItemWidget extends StatelessWidget {
  final int index;
  var isDark;

  MovieSkeletonItemWidget({this.index: 0});

  @override
  Widget build(BuildContext context) {
    isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(14),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildMoviePosterSkeleton(),
              SizedBox(width: 10),
              _buildMovieInfoSkeleton(),
              SizedBox(width: 10),
              SizedBox(width: 10),
              _buildTicketPurchaseSkeleton()
            ],
          ),
        ),
        Divider(
            height: 1,
          color: Colors.black)
      ],
    );
  }

  Widget _buildMoviePosterSkeleton() {
    return Container(
      width: 90,
      height: 120,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildMovieInfoSkeleton() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildMovieTitleSkeleton(),
          SizedBox(height: 5),
          _buildMovieScoreSkeleton(),
          SizedBox(height: 5),
          _buildMovieTagSkeleton()
        ],
      ),
    );
  }

  Widget _buildMovieTitleSkeleton() {
    return Container(
      width: 50,
      height: 8,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildMovieScoreSkeleton() {
    return Container(
      width: 50,
      height: 8,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildMovieTagSkeleton() {
    return Container(
      width: 100,
      height: 16,
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildTicketPurchaseSkeleton() {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 16,
            decoration: SkeletonDecoration(isDark: isDark),
          ),
          SizedBox(height: 8),
          Container(
            width: 60,
            height: 8,
            decoration: SkeletonDecoration(isDark: isDark),
          ),
        ],
      ),
    );
  }

}
