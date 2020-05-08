import 'dart:convert';

import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/model/movie_commend_entity.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/model/movie_reviews_entity.dart';
import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/service/net/result_data.dart';

import 'http_manager.dart';

class DouBanMovieRepository {
  static Future getShowingMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('in_theaters', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getUpcomingMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('coming_soon', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getTop250MovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('top250', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new Movie().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getWeeklyMovieEntity({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('weekly', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new WeeklyMovieEntity().fromJson(movieMap);
//    return movie.subjects;
    return movie;
  }

  static Future getUsBoxMovieEntity({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('us_box', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new UsboxMovieEntity().fromJson(movieMap);
    return movie;
  }

  static Future getNewMovieEntity({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('new_movies', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new NewMovieEntity().fromJson(movieMap);
    return movie;
  }

  static Future getWeeklyMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('weekly', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var weeklyMovieEntity = new WeeklyMovieEntity().fromJson(movieMap);
    var weeklyMovieSubjects = <MovieSubject>[];
    weeklyMovieEntity.subjects.forEach((it) {
      weeklyMovieSubjects.add(it.subject);
    });
    return weeklyMovieSubjects;
  }

  static Future getUsBoxMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('us_box', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var usboxMovieEntity = new UsboxMovieEntity().fromJson(movieMap);
    var usboxMovieSubjects = <MovieSubject>[];
    usboxMovieEntity.subjects.forEach((it) {
      usboxMovieSubjects.add(it.subject);
    });
    return usboxMovieSubjects;
  }

  static Future getNewMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('new_movies', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new NewMovieEntity().fromJson(movieMap);
    return movie.subjects;
  }

  static Future getMovieDetailEntity({String movieId}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}', queryParameters: null);
    String tempResultData = resultData.data.toString().replaceAll('\"1\"', '\"i1\"')
        .replaceAll('\"2\"', '\"i2\"')
        .replaceAll('\"3\"', '\"i3\"')
        .replaceAll('\"4\"', '\"i4\"')
        .replaceAll('\"5\"', '\"i5\"');
    Map movieMap = json.decode(tempResultData.toString());
    var movieDetailEntity = new MovieDetailEntity().fromJson(movieMap);
    return movieDetailEntity;
  }

  static Future getMovieStillsList({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/photos', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = new MovieStillsEntity().fromJson(movieMap);
    return movie;
  }

  static Future getMovieCommendList({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/comments', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movieCommendEntity = new MovieCommendEntity().fromJson(movieMap);
    return movieCommendEntity.comments;
  }


  static Future getMovieReviewList({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/reviews', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movieReviewsEntity = new MovieReviewsEntity().fromJson(movieMap);
    return movieReviewsEntity.reviews;
  }
}
