

import 'package:douban_movie_flutter/page/billboard_detail_page.dart';
import 'package:douban_movie_flutter/page/billboard_page.dart';
import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/page/mine_page.dart';
import 'package:douban_movie_flutter/page/projection_page.dart';
import 'package:douban_movie_flutter/page/splash.dart';
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
    }
  }
}