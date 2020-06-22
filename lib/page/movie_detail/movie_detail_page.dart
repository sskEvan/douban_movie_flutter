import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton/movie_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../widget/movie_detail_staff_list_widget.dart';
import '../../widget/movie_detail_popular_comment_widget.dart';
import '../../widget/movie_detail_header.dart';
import '../../widget/movie_detail_plot_widget.dart';
import '../../widget/movie_detail_rating_widget.dart';
import '../../widget/movie_detail_stills_widget.dart';
import '../../widget/movie_detail_tag_widget.dart';
import 'movie_reviews_list_page.dart';

/**
 * 电影详情页
 */
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
  Color _pageColor = Colors.white;
  MovieDetailVo _movieDetailVo;
  ScrollController _bodyScrollController;
  PaletteGenerator _paletteGenerator;

  MovieDetailState(this.movieId);

  @override
  void initState() {
    super.initState();
    offstageAutorInfo = true;
    offstageTitle = false;
    _bodyScrollController = ScrollController();
    _bodyScrollController.addListener(() {
      if (_bodyScrollController.offset > 150) {
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark) {
      _pageColor = Color(0xFF272727);
    }

    return Scaffold(
        appBar: AppBar(
          title: buildTitleBar(context),
          backgroundColor: _pageColor,
        ),
        backgroundColor: _pageColor,
        body: ViewStateWidget<MovieDetailVoProvider>(
          provider: MovieDetailVoProvider(context),
          onProviderReady: (provider) async {
            await provider.initData(arguments: movieId);
          },
          builder: (context, MovieDetailVoProvider provider, child) {
            if (provider.isBusy) {
              return MovieDetailSkeleton();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData());
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError, onPressed: provider.initData);
            }
            _movieDetailVo = provider.movieDetailVo;
            if(!isDark) {
              fetchPageColor(provider.movieDetailVo.images.small);
            }

            return BottomDrawerWidget(_movieDetailVo, _bodyScrollController);
          },
        ));
  }

  Widget buildTitleBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: offstageTitle,
          child: Text(
            DouBanLocalizations.of(context).movie,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Offstage(
          offstage: offstageAutorInfo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CacheImageWidget(
                      url: _movieDetailVo != null
                          ? _movieDetailVo.images.small
                          : '',
                      radius: 2,
                      width: 27,
                      height: 35),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${_movieDetailVo != null ? _movieDetailVo.title : ''}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      StaticRatingBar(
                        rate: _movieDetailVo != null
                            ? _movieDetailVo.rating.average / 2
                            : 0,
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
    if(_paletteGenerator == null) {
      _paletteGenerator =
      await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(url),
      );
    }

    if (_paletteGenerator.darkVibrantColor != null &&
        _pageColor != _paletteGenerator.darkVibrantColor.color) {
      _pageColor = _paletteGenerator.darkVibrantColor.color;
      setState(() {});
    } else if (_paletteGenerator.darkVibrantColor == null &&
        _pageColor !=
            ThemeHelper.wrapDarkBackgroundColor(context, Color(0xff35374c))) {
      _pageColor =
          ThemeHelper.wrapDarkBackgroundColor(context, Color(0xff35374c));
      setState(() {});
    }
  }
}

class BottomDrawerWidget extends StatefulWidget {
  MovieDetailVo movieDetailVo;
  ScrollController bodyScrollController;

  BottomDrawerWidget(this.movieDetailVo, this.bodyScrollController);

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerState();
  }
}

class BottomDrawerState extends State<BottomDrawerWidget>
    with TickerProviderStateMixin {
  double drawerOffset;
  double lastDrawerOffset;
  double initDrawerOffset;
  AnimationController offsetAnimalController;
  Animation<double> offsetAnimation;
  double bodyScrollOffset = 0.0;
  double drawerScrollOffset = 0.0;
  bool isDrawerMoving = false;
  bool isDownInDrawerHeader = false;

  BottomDrawerState();

  @override
  void initState() {
    super.initState();
    offsetAnimalController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    initDrawerOffset = drawerOffset = lastDrawerOffset =
        ScreenUtil.height - ScreenUtil.navigationBarHeight - kToolbarHeight;
    widget.bodyScrollController.addListener(() {});
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

    if (needRefreshUi) {
      //debugPrint("---------drawerOffset:${drawerOffset}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Stack(children: <Widget>[
        _buildBody(),
        _buildDrawer(),
      ]),
      onWillPop: () async {
        if (drawerOffset == 0) {
          _doDrawerOffsetAnim(0.0, initDrawerOffset);
          return false;
        }
        return true;
      },
    );
  }

  @override
  void dispose() {
    widget.bodyScrollController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return Listener(
        onPointerUp: (event) {
          if (!isDrawerMoving && drawerOffset < initDrawerOffset) {
            double start = drawerOffset;
            double end = 0.0;
            if (drawerOffset >= initDrawerOffset / 2) {
              //drawer张开高度小于一半
              end = initDrawerOffset;
            }
            _doDrawerOffsetAnim(start, end);
          }
        },
        child: NotificationListener<OverscrollNotification>(
            onNotification: (OverscrollNotification notification) {
              //body到达边界,并且向上滑动
              if (notification.dragDetails != null) {
                debugPrint(
                    "------------notification.dragDetails:${notification.dragDetails.delta.dy}");
                if (notification.dragDetails.delta.dy < 0) {
                  double newDrawerOffset =
                      drawerOffset + notification.dragDetails.delta.dy;
                  updateDrawerOffset(newDrawerOffset);
                }
              }
              return false;
            },
            child: ListView(
              controller: widget.bodyScrollController,
              children: <Widget>[
                MovieDetailHeader(widget.movieDetailVo),
                MovieDetailRatingWidget(widget.movieDetailVo),
                MovieDetailTag(widget.movieDetailVo),
                MovieDetailPlotWidget(widget.movieDetailVo),
                MovieDetailStaffListWidget(widget.movieDetailVo),
                MovieDetailStillsWidget(widget.movieDetailVo),
                MovieDetailPopularCommentWidget(widget.movieDetailVo),
              ],
            )));
  }

  void _doDrawerOffsetAnim(double start, double end) {
    offsetAnimalController.reset();
    final CurvedAnimation curve =
        CurvedAnimation(parent: offsetAnimalController, curve: Curves.easeOut);
    offsetAnimation = Tween(begin: start, end: end).animate(curve)
      ..addListener(() {
        updateDrawerOffset(offsetAnimation.value);
      });

    ///自己滚动
    offsetAnimalController.forward();
  }

  Widget _buildDrawer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Listener(
        onPointerDown: (event) {
          isDownInDrawerHeader =
              event.localPosition.dy <= (drawerOffset + kToolbarHeight);
          debugPrint(
              "onPointerDown isDownInDrawerHeader:${isDownInDrawerHeader},localPosition.dy:${event.localPosition.dy},drawerOffset=${drawerOffset}");
        },
        onPointerMove: (event) {
          isDrawerMoving = true;
          if (isDownInDrawerHeader ||
              (drawerScrollOffset == 0 &&
                  event.delta.dy != 0 &&
                  drawerOffset <= initDrawerOffset)) {
            double newDrawerOffset = drawerOffset + event.delta.dy;
            updateDrawerOffset(newDrawerOffset);
          }
        },
        onPointerUp: (event) {
          debugPrint("onPointerUp...dy=${event.delta.dy}");
          isDrawerMoving = false;
          isDownInDrawerHeader = false;
          double start = drawerOffset;
          double end = 0;
          if (drawerOffset >= initDrawerOffset / 2) {
            //drawer张开高度小于一半
            end = initDrawerOffset;
          }
          _doDrawerOffsetAnim(start, end);
        },
        child: Transform.translate(
            offset: Offset(0.0, drawerOffset),
            child: Column(
              children: <Widget>[
                Container(
                    width: ScreenUtil.width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeHelper.wrapColor(context, lightModeColor: Color(0xFFFAFAFA), darkModeColor: Color(0xFF444444)),
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
                            color: ThemeHelper.wrapDarkColor(context, Colors.black26),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Text(
                            DouBanLocalizations.of(context).reviews,
                            style:
                                TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black45), fontSize: 16),
                          ),
                        ),
                        //Divider(height: 14, color: Color(0x66cccccc)),
                      ],
                    )),
                Expanded(
                  child:
                      MovieReviewsListPage(widget.movieDetailVo.id, (offset) {
                    debugPrint('drawerScrollOffset=${drawerScrollOffset}');
                    drawerScrollOffset = offset;
                  }),
                )
              ],
            )),
      ),
    );
  }
}
