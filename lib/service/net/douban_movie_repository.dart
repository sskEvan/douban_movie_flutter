import 'dart:convert';

import 'package:douban_movie_flutter/model/comment_list_vo.dart';
import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/model/new_movie_vo.dart';
import 'package:douban_movie_flutter/model/reviews_list_vo.dart';
import 'package:douban_movie_flutter/model/showing_movie_list_vo.dart';
import 'package:douban_movie_flutter/model/top250_movie_list_vo.dart';
import 'package:douban_movie_flutter/model/upcoming_movie_list_vo.dart';
import 'package:douban_movie_flutter/model/usbox_movie_list_vo.dart';
import 'package:douban_movie_flutter/model/weekly_movie_item_vo.dart';
import 'package:douban_movie_flutter/model/weekly_movie_list_vo.dart';
import 'package:douban_movie_flutter/service/net/result_data.dart';

import 'http_manager.dart';

class DouBanMovieRepository {
  static Future getShowingMovieItemList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('in_theaters', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var showingMovieVo = ShowingMovieListVo.fromJson(movieMap);
    return showingMovieVo.movieItems;
  }

  static Future getUpcomingMovieItemList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('coming_soon', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var upcomingMovieVo = UpcomingMovieListVo.fromJson(movieMap);
    return upcomingMovieVo.movieItems;
  }

  static Future getTop250MovieItemList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('top250', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var top250MovieVo = Top250MovieListVo.fromJson(movieMap);
    return top250MovieVo.movieItems;
  }

  static Future getWeeklyMovieVo({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('weekly', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    return WeeklyMovieListVo.fromJson(movieMap);
  }

  static Future getUsBoxMovieVo({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('us_box', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    return UsBoxMovieListVo.fromJson(movieMap);
  }

  static Future getNewMovieVo({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('new_movies', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    return NewMovieVo.fromJson(movieMap);
  }

  static Future getWeeklyMovieItemList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('weekly', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var weeklyMovieVo = WeeklyMovieListVo.fromJson(movieMap);
    var weeklyMovieItemVos = <MovieItemVo>[];
    weeklyMovieVo.weeklyMovieItems.forEach((it) {
      weeklyMovieItemVos.add(it.movieItemVo);
    });
    return weeklyMovieItemVos;
  }

  static Future getUsBoxMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('us_box', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var usboxMovieVo = UsBoxMovieListVo.fromJson(movieMap);
    var usboxMovieItemVos = <MovieItemVo>[];
    usboxMovieVo.usboxMovieItems.forEach((it) {
      usboxMovieItemVos.add(it.movieItemVo);
    });
    return usboxMovieItemVos;
  }

  static Future getNewMovieList({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('new_movies', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = NewMovieVo.fromJson(movieMap);
    return movie.movieItems;
  }

  static Future getMovieDetailVo({String movieId}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}', queryParameters: null);
    Map movieMap = json.decode(resultData.data.toString());
    var movieDetailVo = MovieDetailVo.fromJson(movieMap);
    return movieDetailVo;
  }

  static Future getMoviePhotoDetailListVo({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/photos', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movie = PhotoDetailListVo.fromJson(movieMap);
    return movie;
  }

  static Future getMovieCommendListVo({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/comments', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movieCommendVo = CommentListVo.fromJson(movieMap);
    return movieCommendVo.comments;
  }


  static Future getMovieReviewsListVo({String movieId, int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance()
        .get('subject/${movieId}/reviews', queryParameters: {"start": start, 'count': count});
    Map movieMap = json.decode(resultData.data.toString());
    var movieReviewsVo = ReviewsListVo.fromJson(movieMap);
    return movieReviewsVo.reviews;
  }
}
