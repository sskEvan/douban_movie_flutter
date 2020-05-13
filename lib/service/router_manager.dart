

import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/model/movie_reviews_entity.dart';
import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/page/billboard_detail_page.dart';
import 'package:douban_movie_flutter/page/billboard_page.dart';
import 'package:douban_movie_flutter/page/bottom_drawer_demo_page.dart';
import 'package:douban_movie_flutter/page/bottom_drawer_demo_page2.dart';
import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/page/mine_page.dart';
import 'package:douban_movie_flutter/page/movie_commend_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_review_detail.dart';
import 'package:douban_movie_flutter/page/movie_detail_page.dart';
import 'package:douban_movie_flutter/page/movie_still_page.dart';
import 'package:douban_movie_flutter/page/projection_page.dart';
import 'package:douban_movie_flutter/page/splash.dart';
import 'package:douban_movie_flutter/page/stills_detail_page.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_us_box_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_movie_provider.dart';
import 'package:douban_movie_flutter/widget/page_route_anim.dart';
import 'package:flutter/cupertino.dart';

class RouteName {
  static const String splash = 'splash';
  static const String index = '/';
  static const String billboardTop250 = 'billboardTop250';
  static const String billboardNewMovies = 'billboardNewMovies';
  static const String billboardWeekly = 'billboardWeekly';
  static const String billboardUsBox = 'billboardUsBox';
  static const String movieDetail = 'movieDetail';
  static const String movieStills = 'movieStills';
  static const String movieStillsDetail = 'movieStillsDetail';
  static const String movieCommend = 'movieCommend';
  static const String movieReviewDetail = 'movieReviewDetail';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      break;
      case RouteName.index:
        return NoAnimRouteBuilder(IndexPage());
        break;
      case RouteName.billboardTop250:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardTop250Provider>(actionType: RouteName.billboardTop250));
        break;
      case RouteName.billboardNewMovies:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardNewMoviesProvider>(actionType: RouteName.billboardNewMovies));
        break;
      case RouteName.billboardWeekly:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardWeeklyMovieProvider>(actionType: RouteName.billboardWeekly));
        break;
      case RouteName.billboardUsBox:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardUsBoxMovieProvider>(actionType: RouteName.billboardUsBox));
        break;
      case RouteName.movieDetail:
        String id = settings.arguments;
        return NoAnimRouteBuilder(MovieDetailPage(id));
        //return NoAnimRouteBuilder(BottomDrawerDemoPage());
        break;
      case RouteName.movieStills:
        List arguments = settings.arguments;
        String id = arguments[0];
        int totalPhotoCount = arguments[1];
        return VerticalSlideRouteBuilder(MovieStillPage(id, totalPhotoCount));
        break;
      case RouteName.movieStillsDetail:
        List arguments = settings.arguments;
        List<MovieStillsPhoto> movieStillsPhotoList = arguments[0];
        int currentIndex  = arguments[1];
        int totalPhotoCount = arguments[2];
        return FadeRouteBuilder(StillsDetailPage(movieStillsPhotoList, currentIndex, totalPhotoCount));
        break;
      case RouteName.movieCommend:
        String movieId = settings.arguments;
        return VerticalSlideRouteBuilder(MovieCommendPage(movieId));
        break;
      case RouteName.movieReviewDetail:
        MovieReviewsReview movieReviewsReview = settings.arguments;
        return VerticalSlideRouteBuilder(MovieReviewDetailPage(movieReviewsReview));
        break;
    }
  }
}