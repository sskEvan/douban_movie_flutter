import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BillboardSkeleton extends StatelessWidget {
  var isDark;
  var banners;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    banners = <Widget>[
      BillboardBannerSkeleton(isDark),
      BillboardBannerSkeleton(isDark),
      BillboardBannerSkeleton(isDark),
    ];
    return Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: isDark ? Colors.grey[700] : Colors.grey[350],
        highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionSkeleton(),
              _buildTop25OGridSkeleton(isDark),
              _buildSectionSkeleton(),
              _buildOtherBillboardSkeleton()
            ]));
  }

  Widget _buildSectionSkeleton() {
    return Container(
      height: 20,
      width: 100,
      margin: EdgeInsets.fromLTRB(15, 8, 5, 8),
      decoration: SkeletonDecoration(isDark: isDark),
    );
  }

  Widget _buildTop25OGridSkeleton(bool isDark) {
    return SkeletonGrid(
      padding: EdgeInsets.symmetric(horizontal: 10),
      childAspectRatio: 0.65,
      builder: (context, index) =>
          BillboardTop250SkeletonItemWidget(index, isDark),
    );
  }

  Widget _buildOtherBillboardSkeleton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: ScreenUtil.width,
        height: 200,
        child: CarouselSlider(
          aspectRatio: 15 / 9,
          items: banners,
        ));
  }
}

class BillboardTop250SkeletonItemWidget extends StatelessWidget {
  final int index;
  var isDark;

  var contentWidth;
  var contentHeight;

  BillboardTop250SkeletonItemWidget(this.index, this.isDark);

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

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

class BillboardBannerSkeleton extends StatelessWidget {
  var isDark;

  BillboardBannerSkeleton(this.isDark);

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              width: ScreenUtil.width,
              height: 190,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : Colors.grey[350],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
