import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/**
 * 首页榜单页面组件
 */
class BillboardSkeleton extends StatelessWidget {
  var banners;

  BillboardSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    banners = <Widget>[
      BillboardBannerSkeleton(),
      BillboardBannerSkeleton(),
      BillboardBannerSkeleton(),
    ];
    return Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.grey[350]),
        highlightColor: ThemeHelper.wrapColor(context,
            darkModeColor: Colors.grey[700], lightModeColor: Colors.grey[200]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionSkeleton(context),
              _buildTop25OGridSkeleton(context),
              _buildSectionSkeleton(context),
              _buildOtherBillboardSkeleton()
            ]));
  }

  Widget _buildSectionSkeleton(BuildContext context) {
    return Container(
      height: 20,
      width: 100,
      margin: EdgeInsets.fromLTRB(15, 8, 5, 8),
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildTop25OGridSkeleton(BuildContext context) {
    return SkeletonGrid(
      padding: EdgeInsets.symmetric(horizontal: 10),
      childAspectRatio: 0.65,
      builder: (context, index) =>
          BillboardTop250SkeletonItemWidget(index),
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
  var contentWidth;
  var contentHeight;

  BillboardTop250SkeletonItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMoviePosterSkeleton(context),
          SizedBox(height: 4),
          _buildMovieTitleSkeleton(context),
          SizedBox(height: 4),
          _buildMovieScoreSkeleton(context)
        ],
      ),
    );
  }

  Widget _buildMoviePosterSkeleton(BuildContext context) {
    return Container(
      width: contentWidth,
      height: contentHeight - 25,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildMovieTitleSkeleton(BuildContext context) {
    return Container(
      width: 80,
      height: 8,
      decoration: SkeletonDecoration(context: context),
    );
  }

  Widget _buildMovieScoreSkeleton(BuildContext context) {
    return Container(
      width: 80,
      height: 8,
      decoration: SkeletonDecoration(context: context),
    );
  }
}

class BillboardBannerSkeleton extends StatelessWidget {
  BillboardBannerSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              width: ScreenUtil.width,
              height: 190,
              decoration: BoxDecoration(
                color: ThemeHelper.wrapDarkBackgroundColor(
                    context, Colors.grey[500]),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
