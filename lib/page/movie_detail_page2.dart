import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'movie_detail/movie_detail_cast.dart';
import 'movie_detail/movie_detail_commend.dart';
import 'movie_detail/movie_detail_header.dart';
import 'movie_detail/movie_detail_plot.dart';
import 'movie_detail/movie_detail_rating.dart';
import 'movie_detail/movie_detail_stills.dart';
import 'movie_detail/movie_detail_tag.dart';
import 'movie_detail/movie_reviews.dart';
import 'movie_detail/movie_reviews2.dart';

class MovieDetailPage2 extends StatefulWidget {
  final String movieId;

  MovieDetailPage2(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState2(movieId);
  }
}

class MovieDetailState2 extends State<MovieDetailPage2> {
  final String movieId;
  Color pageColor = Colors.white;
  MovieDetailEntity movieDetailEntity;

  MovieDetailState2(this.movieId);

  @override
  Widget build(BuildContext context) {
    //debugPrint("!!!!!!!!!!!!!!!MovieDetailPage build done ");

    return Scaffold(
        appBar: AppBar(
          title: Text('电影'),
          centerTitle: true,
          backgroundColor: pageColor,
        ),
        backgroundColor: pageColor,
        body: ViewStateWidget<MovieDetailProvider>(
          provider: MovieDetailProvider(context),
          onProviderReady: (provider) async {
            await provider.initData(movieId);
          },
          builder: (context, MovieDetailProvider provider, child) {
            if (provider.isBusy) {
              return MovieDetailSkeleton();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData(movieId));
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError,
                  onPressed: provider.initData(movieId));
            }
            movieDetailEntity = provider.movieDetailEntity;
            fetchPageColor(provider.movieDetailEntity.images.small);

            return BottomDrawerWidget(movieDetailEntity);
          },
        ));
  }

  void fetchPageColor(url) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(url),
    );

    if (paletteGenerator.darkVibrantColor != null &&
        pageColor != paletteGenerator.darkVibrantColor.color) {
      setState(() {
        pageColor = paletteGenerator.darkVibrantColor.color;
      });
    } else if (paletteGenerator.darkVibrantColor == null &&
        pageColor != Color(0xff35374c)) {
      setState(() {
        pageColor = Color(0xff35374c);
      });
    }
    ;
  }
}

class BottomDrawerWidget extends StatefulWidget {
  MovieDetailEntity movieDetailEntity;

  BottomDrawerWidget(this.movieDetailEntity);

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerState(movieDetailEntity);
  }
}

class BottomDrawerState extends State<BottomDrawerWidget>
    with TickerProviderStateMixin {
  MovieDetailEntity movieDetailEntity;
  ScrollController bodyScrollController;
  final GlobalKey reviewsHeaderKey = GlobalKey();
  bool offstageBottomReviewsHeader = false;
  bool offstageTopReviewsHeader = true;

  BottomDrawerState(this.movieDetailEntity);

  @override
  void initState() {
    super.initState();

    bodyScrollController = ScrollController();
    bodyScrollController.addListener(() {
      if (reviewsHeaderKey.currentContext != null &&
          reviewsHeaderKey.currentContext.findRenderObject() != null) {
        double listViewGlobalPositionY = reviewsHeaderKey.currentContext
            .findRenderObject()
            .getTransformTo(null)
            .getTranslation()
            .y;

        if (listViewGlobalPositionY <= ScreenUtil.navigationBarHeight + 50) {
          if (offstageTopReviewsHeader != false) {
            debugPrint("显示顶部标题");
            offstageTopReviewsHeader = false;
            setState(() {});
          }
        } else if (offstageTopReviewsHeader != true) {
          debugPrint("隐藏顶部标题");
          offstageTopReviewsHeader = true;
          setState(() {});
        }

        if (listViewGlobalPositionY <= ScreenUtil.height - 50) {
          //影评列表滑动已经现在在界面上,并且标题已经全部显示出来
          //隐藏底部标题
          if (offstageBottomReviewsHeader != true) {
            debugPrint("隐藏底部标题");
            offstageBottomReviewsHeader = true;
            setState(() {});
          }
        } else {
          //显示底部标题
          if (offstageBottomReviewsHeader == true) {
            debugPrint("显示底部标题");
            offstageBottomReviewsHeader = false;
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("!!!!!!!BottomDrawerState build done ");
    return Stack(children: <Widget>[
      _buildBody(),
      Offstage(
        offstage: offstageTopReviewsHeader,
        child: Align(
          alignment: Alignment.topCenter,
          child: _buildReviewsHeader(),
        ),
      ),
      Offstage(
        offstage: offstageBottomReviewsHeader,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: _buildReviewsHeader(),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    bodyScrollController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return ListView(
      controller: bodyScrollController,
      children: <Widget>[
        MovieDetailHeader(movieDetailEntity),
        MovieDetailRatingWidget(movieDetailEntity),
        MovieDetailTag(movieDetailEntity),
        MovieDetailPlot(movieDetailEntity),
        MovieDetailCastWidget(movieDetailEntity),
        MovieDetailStills(movieDetailEntity),
        MovieDetailCommend(movieDetailEntity),
        _buildReviewsHeader(key: reviewsHeaderKey),
        MovieReviewsWidget2(movieDetailEntity.id, bodyScrollController)
      ],

    );
//    return SingleChildScrollView(
//      controller: bodyScrollController,
//      child: Column(children: <Widget>[
//
//
////        Container(
////          color: Colors.red,
////          child: ListView.builder(
////              shrinkWrap: true,
////              itemCount: 30,
////              itemExtent: 50,
////              controller: bodyScrollController,
////              itemBuilder: (context, index) {
////                return Container(
////                  color: Color(0xffeeeeee),
////                  padding: EdgeInsets.all(15),
////                  alignment: Alignment.centerLeft,
////                  width: ScreenUtil.width,
////                  child: Text('   影评item -- $index'),
////                );
////              }),
////        )
//      ]),
//    );
  }

  Widget _buildReviewsHeader({Key key}) {
    return Container(
        key: key,
        width: ScreenUtil.width,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        height: kToolbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 50,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Text(
                '影评',
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
            //Divider(height: 14, color: Color(0x66cccccc)),
          ],
        ));
  }
}
