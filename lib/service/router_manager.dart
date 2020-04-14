

import 'package:douban_movie_flutter/page/billboard_detail_page.dart';
import 'package:douban_movie_flutter/page/billboard_page.dart';
import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/page/mine_page.dart';
import 'package:douban_movie_flutter/page/projection_page.dart';
import 'package:douban_movie_flutter/page/splash.dart';
import 'package:douban_movie_flutter/widget/page_route_anim.dart';
import 'package:flutter/cupertino.dart';

class RouteName {
  static const String splash = 'splash';
  static const String index = '/';
  static const String billboardDetail = 'billboardDetail';
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
      case RouteName.billboardDetail:
        return NoAnimRouteBuilder(BillboardDetailPage());
        break;
    }
  }
}