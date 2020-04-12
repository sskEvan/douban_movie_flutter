import 'dart:convert';

import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/service/net/result_data.dart';

import 'http_manager.dart';

class DouBanMovieRepository {
  static Future getShowingMovies({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('in_theaters', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getUpcomingMovies({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('coming_soon', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getTop250({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('top250', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getWeekly({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('weekly', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new WeeklyMovieEntity().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getUsBox({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('us_box', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new UsboxMovieEntity().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getNewMovies({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('new_movies', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new NewMovieEntity().fromJson(movieMap);
    return movie.subjects;
  }
}
