
import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/model/reviews_vo.dart';
import 'package:douban_movie_flutter/model/trailer_vo.dart';
import 'package:douban_movie_flutter/page/billboard_detail_page.dart';
import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_commend_list_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_review_detail_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_detail_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_stills_list_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_trailer_page.dart';
import 'package:douban_movie_flutter/page/splash_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_stills_detail_page.dart';
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
  static const String movieTrailersPage = 'movieTrailersPage';

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
        return VerticalSlideRouteBuilder(MovieStillsListPage(id, totalPhotoCount));
        break;
      case RouteName.movieStillsDetail:
        List arguments = settings.arguments;
        List<PhotoDetailInfo> photoList = arguments[0];
        int currentIndex  = arguments[1];
        int totalPhotoCount = arguments[2];
        return FadeRouteBuilder(MovieStillsDetailPage(photoList, currentIndex, totalPhotoCount));
        break;
      case RouteName.movieCommend:
        String movieId = settings.arguments;
        return VerticalSlideRouteBuilder(MovieCommendListPage(movieId));
        break;
      case RouteName.movieReviewDetail:
        ReviewsVo reviewsVo = settings.arguments;
        return VerticalSlideRouteBuilder(MovieReviewDetailPage(reviewsVo));
        break;
      case RouteName.movieTrailersPage:
        TrailerVo trailerVo = settings.arguments;
        return VerticalSlideRouteBuilder(MovieTrailerPage(trailerVo));
        break;
    }
  }
}