import 'package:flutter/material.dart';

import 'skeleton.dart';

/**
 * 电梯列表骨架组件
 */
class MovieItemSkeleton extends StatelessWidget {
  var isDark;
  final bool showIndexNumber;

  MovieItemSkeleton({this.showIndexNumber,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildIndexNumberSkeleton(),
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

  Widget _buildIndexNumberSkeleton() {
    return Offstage(
      offstage: showIndexNumber == false,
      child: Container(
        margin: EdgeInsets.fromLTRB(14, 10, 0, 0),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: 30,
          height: 16,
        ),
      ),
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
