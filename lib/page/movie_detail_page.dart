import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drag_widget.dart';
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

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState(movieId);
  }
}

class MovieDetailState extends State<MovieDetailPage> {
  final String movieId;
  Color pageColor = Colors.white;
  MovieDetailEntity movieDetailEntity;
  ScrollController scrollController;
  GlobalKey<DragContainerState> dragContainerKey = GlobalKey();

  MovieDetailState(this.movieId);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if(scrollController.offset == scrollController.position.maxScrollExtent) {
        dragContainerKey.currentState.openDrawer();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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

            return BottomDragWidget(
              body: CustomScrollView(
                controller: scrollController,
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text('电影'),
                    centerTitle: true,
                    pinned: true,
                    backgroundColor: pageColor,
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailHeader(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailRatingWidget(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailTag(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailPlot(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailCastWidget(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailStills(movieDetailEntity),
                  ),
                  SliverToBoxAdapter(
                    child: MovieDetailCommend(movieDetailEntity),
                  ),
                ],
              ),
              dragContainer: DragContainer(
                  key: dragContainerKey,
                  drawer: Container(
                    child: OverscrollNotificationWidget(
                      child: MovieReviewsWidget(movieDetailEntity.id),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                  ),
                  defaultShowHeight: kToolbarHeight,
                  height: ScreenUtil.height - ScreenUtil.navigationBarHeight),
            );
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
