
import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/model/reviews_vo.dart';
import 'package:douban_movie_flutter/model/trailer_vo.dart';
import 'package:douban_movie_flutter/page/billboard_detail_page.dart';
import 'package:douban_movie_flutter/page/celebeity_works_page.dart';
import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_commend_list_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_review_detail_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_detail_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/photo_list_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/movie_trailer_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/staff_detail_page.dart';
import 'package:douban_movie_flutter/page/search_page.dart';
import 'package:douban_movie_flutter/page/splash_page.dart';
import 'package:douban_movie_flutter/page/movie_detail/photo_detail_page.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_us_box_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_movie_provider.dart';
import 'package:douban_movie_flutter/widget/page_route_anim.dart';
import 'package:flutter/cupertino.dart';

class RouteName {
  static const String splashPage = 'splashPage';
  static const String indexPage = '/';
  static const String billboardTop250Page = 'billboardTop250Page';
  static const String billboardNewMoviesPage = 'billboardNewMoviesPage';
  static const String billboardWeeklyPage = 'billboardWeeklyPage';
  static const String billboardUsBoxPage = 'billboardUsBoxPage';
  static const String movieDetailPage = 'movieDetailPage';
  static const String photoListPage = 'photoListPage';
  static const String photoDetailPage = 'photoDetailPage';
  static const String movieCommendPage = 'movieCommendPage';
  static const String movieReviewDetailPage = 'movieReviewDetailPage';
  static const String movieTrailersPage = 'movieTrailersPage';
  static const String staffDetailPage = 'staffDetailPage';
  static const String celebrityWorksPage = 'celebrityWorksPage';
  static const String searchPage = 'searchPage';


}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashPage:
        return NoAnimRouteBuilder(SplashPage());
      break;
      case RouteName.indexPage:
        return NoAnimRouteBuilder(IndexPage());
        break;
      case RouteName.billboardTop250Page:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardTop250Provider>(actionType: RouteName.billboardTop250Page));
        break;
      case RouteName.billboardNewMoviesPage:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardNewMoviesProvider>(actionType: RouteName.billboardNewMoviesPage));
        break;
      case RouteName.billboardWeeklyPage:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardWeeklyMovieProvider>(actionType: RouteName.billboardWeeklyPage));
        break;
      case RouteName.billboardUsBoxPage:
        return NoAnimRouteBuilder(BillboardDetailPage<BillboardUsBoxMovieProvider>(actionType: RouteName.billboardUsBoxPage));
        break;
      case RouteName.movieDetailPage:
        String id = settings.arguments;
        return NoAnimRouteBuilder(MovieDetailPage(id));
        break;
      case RouteName.photoListPage:
        List arguments = settings.arguments;
        String action = arguments[0];
        int totalPhotoCount = arguments[1];
        return VerticalSlideRouteBuilder(PhotoListPage(action, totalPhotoCount));
        break;
      case RouteName.photoDetailPage:
        List arguments = settings.arguments;
        List<PhotoDetailInfo> photoList = arguments[0];
        int currentIndex  = arguments[1];
        return FadeRouteBuilder(PhotoDetailPage(photoList, currentIndex));
        break;
      case RouteName.movieCommendPage:
        String movieId = settings.arguments;
        return VerticalSlideRouteBuilder(MovieCommendListPage(movieId));
        break;
      case RouteName.movieReviewDetailPage:
        ReviewsVo reviewsVo = settings.arguments;
        return VerticalSlideRouteBuilder(MovieReviewDetailPage(reviewsVo));
        break;
      case RouteName.movieTrailersPage:
        TrailerVo trailerVo = settings.arguments;
        return VerticalSlideRouteBuilder(MovieTrailerPage(trailerVo));
        break;
      case RouteName.staffDetailPage:
        String id = settings.arguments;
        return VerticalSlideRouteBuilder(StaffDetailPage(id));
        break;
      case RouteName.celebrityWorksPage:
        String id = settings.arguments;
        return VerticalSlideRouteBuilder(CelebrityWorksPage(id));
        break;
      case RouteName.searchPage:
        return NoAnimRouteBuilder(SearchPage());
        break;

    }
  }
}