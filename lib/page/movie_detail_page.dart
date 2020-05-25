import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:palette_generator/palette_generator.dart';

import 'movie_detail/movie_detail_cast.dart';
import 'movie_detail/movie_detail_commend.dart';
import 'movie_detail/movie_detail_header.dart';
import 'movie_detail/movie_detail_plot.dart';
import 'movie_detail/movie_detail_rating.dart';
import 'movie_detail/movie_detail_stills.dart';
import 'movie_detail/movie_detail_tag.dart';
import 'movie_detail/movie_reviews.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState(movieId);
  }
}

bool offstageAutorInfo;
bool offstageTitle;

class MovieDetailState extends State<MovieDetailPage> {
  final String movieId;
  Color pageColor = Colors.white;
  MovieDetailEntity movieDetailEntity;
  ScrollController bodyScrollController;


  MovieDetailState(this.movieId);

  @override
  void initState() {
    super.initState();
    offstageAutorInfo = true;
    offstageTitle = false;
    bodyScrollController = ScrollController();
    bodyScrollController.addListener(() {

      if (bodyScrollController.offset > 150) {
        if (offstageAutorInfo) {
          offstageAutorInfo = false;
          offstageTitle = true;
          setState(() {});
        }
      } else {
        if (!offstageAutorInfo) {
          offstageAutorInfo = true;
          offstageTitle = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("!!!!!!!!!!!!!!!MovieDetailPage build done ");

    return Scaffold(
        appBar: AppBar(
          title: buildTitleBar(),
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

            return BottomDrawerWidget(movieDetailEntity, bodyScrollController);
          },
        ));
  }

  Widget buildTitleBar() {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: offstageTitle,
          child: Text(
            '电影',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Offstage(
          offstage: offstageAutorInfo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 27,
                    height: 35,
                    child: CacheImageWidget(
                      url: movieDetailEntity != null ? movieDetailEntity.images.small : '',
                      radius: 2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${movieDetailEntity != null ? movieDetailEntity.title : ''}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      StaticRatingBar(
                        rate: movieDetailEntity != null ? movieDetailEntity.rating.average / 2 : 0,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
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
  ScrollController bodyScrollController;

  BottomDrawerWidget(this.movieDetailEntity, this.bodyScrollController);

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerState(movieDetailEntity, bodyScrollController);
  }
}

class BottomDrawerState extends State<BottomDrawerWidget>
    with TickerProviderStateMixin {
  MovieDetailEntity movieDetailEntity;
  final GlobalKey bodyFooterKey = GlobalKey();
  double bodyFooterPositionYInScreen;
  double drawerOffset;
  double lastDrawerOffset;
  double initDrawerOffset;
  AnimationController offsetAnimalController;
  Animation<double> offsetAnimation;
  double bodyFooterVisibleThreshold = 0.0;
  double bodyScrollOffset = 0.0;
  double bodyScrollDy = 0.0;
  double drawerScrollOffset = 0.0;
  double drawerScrollDy = 0.0;
  double bodyFooterHeight;
  bool drawerObsorting = false;
  bool isDrawerMoving = false;
  double tempBodyScrollOffset;
  ScrollController bodyScrollController;

  BottomDrawerState(this.movieDetailEntity, this.bodyScrollController);

  @override
  void initState() {
    super.initState();
    offsetAnimalController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    initDrawerOffset = drawerOffset = lastDrawerOffset =
        ScreenUtil.height - ScreenUtil.navigationBarHeight - kToolbarHeight;
    bodyFooterVisibleThreshold = ScreenUtil.height - kToolbarHeight;
    bodyFooterHeight = initDrawerOffset + kToolbarHeight;
    bodyScrollController.addListener(() {
      bodyScrollDy = bodyScrollController.offset - bodyScrollOffset;
      if (bodyFooterKey.currentContext != null &&
          bodyFooterKey.currentContext.findRenderObject() != null) {
        bodyFooterPositionYInScreen = bodyFooterKey.currentContext
            .findRenderObject()
            .getTransformTo(null)
            .getTranslation()
            .y;

//        debugPrint(
//            "scrollDy:${bodyScrollDy},bodyScrollOffset=${bodyScrollController.offset}"
//                ",drawerOffset=${drawerOffset},initDrawerOffset=${initDrawerOffset}"
//                ",bodyFooterVisibleThreshold=${bodyFooterVisibleThreshold}"
//                ",bodyFooterPositionYInScreen=${bodyFooterPositionYInScreen}");

        if (bodyFooterVisibleThreshold - bodyFooterPositionYInScreen > 0 &&
            !isDrawerMoving) {
          bodyFooterPositionYInScreen -= bodyScrollDy;
          //container显示在屏幕
          updateDrawerOffset(
              bodyFooterPositionYInScreen - ScreenUtil.navigationBarHeight);
        } else {
          if (drawerOffset != initDrawerOffset && !isDrawerMoving) {
            updateDrawerOffset(initDrawerOffset);
          }
        }
        bodyScrollOffset = bodyScrollController.offset;
      }
    });
  }

  void updateDrawerOffset(double offset) {
    bool needRefreshUi = false;

    drawerOffset = offset;

    if (drawerOffset < 0) {
      drawerOffset = 0;
    }
    if (drawerOffset > initDrawerOffset) {
      drawerOffset = initDrawerOffset;
    }

    if (lastDrawerOffset != drawerOffset) {
      lastDrawerOffset = drawerOffset;
      needRefreshUi = true;
    }
    if (drawerOffset == 0) {
      if (drawerObsorting) {
        debugPrint("-------------------------恢复滑动");
        drawerObsorting = false;
        needRefreshUi = true;
      }
    } else {
      if (!drawerObsorting) {
        debugPrint("--------------------------拦截");
        drawerObsorting = true;
        needRefreshUi = true;
      }
    }

    if (needRefreshUi) {
      debugPrint("---------drawerOffset:${drawerOffset}");
      setState(() {});
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("!!!!!!!BottomDrawerState build done ");

    return Stack(children: <Widget>[
      _buildBody(),
      _buildDrawer(),
    ]);
  }

  @override
  void dispose() {
    bodyScrollController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return ListView(
      cacheExtent: 3000,
      controller: bodyScrollController,
      children: <Widget>[
        MovieDetailHeader(movieDetailEntity),
        MovieDetailRatingWidget(movieDetailEntity),
        MovieDetailTag(movieDetailEntity),
        MovieDetailPlot(movieDetailEntity),
        MovieDetailCastWidget(movieDetailEntity),
        MovieDetailStills(movieDetailEntity),
        MovieDetailCommend(movieDetailEntity),
        Container(
          key: bodyFooterKey,
          height: bodyFooterHeight,
        )
      ],
    );
  }

  Widget _buildDrawer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Listener(
        onPointerDown: (event) {
          tempBodyScrollOffset = bodyScrollController.offset;
        },
        onPointerMove: (event) {
          isDrawerMoving = true;
          if (event.delta.dy != 0 && drawerOffset <= initDrawerOffset) {
            double newDrawerOffset = drawerOffset + event.delta.dy;
            updateDrawerOffset(newDrawerOffset);

            if (bodyFooterVisibleThreshold - bodyFooterPositionYInScreen > 0) {
              tempBodyScrollOffset = tempBodyScrollOffset - event.delta.dy;
              bodyScrollController.jumpTo(tempBodyScrollOffset);
            }
          }
        },
        onPointerUp: (event) {
          isDrawerMoving = false;
          if (bodyFooterPositionYInScreen > bodyFooterVisibleThreshold) {
            double start = drawerOffset;
            double end = 0;
            if (drawerOffset >= initDrawerOffset / 2) {
              //drawer张开高度小于一半
              end = initDrawerOffset;
            }
            offsetAnimalController.reset();
            final CurvedAnimation curve = CurvedAnimation(
                parent: offsetAnimalController, curve: Curves.easeOut);
            //debugPrint('--------start:${start},end:${end}');
            offsetAnimation = Tween(begin: start, end: end).animate(curve)
              ..addListener(() {
//                drawerOffset = offsetAnimation.value;
//                //debugPrint('--------drawerOffset:${drawerOffset}');
//                setState(() {});
                updateDrawerOffset(offsetAnimation.value);
              });

            ///自己滚动
            offsetAnimalController.forward();
          }
        },
        child: Transform.translate(
          offset: Offset(0.0, drawerOffset),
          child: AbsorbPointer(
              absorbing: drawerObsorting,
              child: Column(
                children: <Widget>[
                  Container(
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
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16),
                            ),
                          ),
                          //Divider(height: 14, color: Color(0x66cccccc)),
                        ],
                      )),
                  Expanded(
                    child: MovieReviewsWidget(movieDetailEntity.id),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
