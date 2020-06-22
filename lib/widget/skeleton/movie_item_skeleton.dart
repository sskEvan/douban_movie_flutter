import 'package:flutter/material.dart';

import 'skeleton.dart';

/**
 * 电梯列表骨架组件
 */
class MovieItemSkeleton extends StatelessWidget {
  final bool showIndexNumber;

  MovieItemSkeleton({this.showIndexNumber, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              _buildMoviePosterSkeleton(context),
              SizedBox(width: 10),
              _buildMovieInfoSkeleton(context),
              SizedBox(width: 10),
              SizedBox(width: 10),
              _buildTicketPurchaseSkeleton(context)
            ],
          ),
        ),
        Divider(height: 1, color: Colors.black)
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

  Widget _buildMoviePosterSkeleton(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildMovieInfoSkeleton(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildMovieTitleSkeleton(context),
          SizedBox(height: 5),
          _buildMovieScoreSkeleton(context),
          SizedBox(height: 5),
          _buildMovieTagSkeleton(context)
        ],
      ),
    );
  }

  Widget _buildMovieTitleSkeleton(BuildContext context) {
    return Container(
      width: 50,
      height: 8,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildMovieScoreSkeleton(BuildContext context) {
    return Container(
      width: 50,
      height: 8,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildMovieTagSkeleton(BuildContext context) {
    return Container(
      width: 100,
      height: 16,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildTicketPurchaseSkeleton(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 16,
            decoration: SkeletonDecoration(context: context),
          ),
          SizedBox(height: 8),
          Container(
            width: 60,
            height: 8,
            decoration: SkeletonDecoration(context: context),
          ),
        ],
      ),
    );
  }
}
