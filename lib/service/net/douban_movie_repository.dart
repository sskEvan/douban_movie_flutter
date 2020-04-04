
import 'dart:convert';

import 'package:douban_movie_flutter/model/showing_movie.dart';
import 'package:douban_movie_flutter/service/net/result_data.dart';

import 'http_manager.dart';

class DouBanMovieRepository {
  static Future getShowingMovies({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance().get('in_theaters', queryParameters: {"start":start, 'count':count});
    String jsonData = resultData.data.toString();
    print("---------resultData=" + jsonData);
    Map userMap = json.decode(resultData.data.toString());
    var movie = new ShowingMovie().fromJson(userMap);
    List<MovieSubject> movieSubjects = movie.subjects;
    print(resultData);
    return movie.subjects;
  }

  static Future getUpcomingMovies({int start, int count}) async {
    ResultData resultData = await HttpManager.getInstance().get('coming_soon', queryParameters: {"start":start, 'count':count});
    String jsonData = resultData.data.toString();
    print("---------resultData=" + jsonData);
    Map userMap = json.decode(resultData.data.toString());
    var movie = new ShowingMovie().fromJson(userMap);
    List<MovieSubject> movieSubjects = movie.subjects;
    print(resultData);
    return movie.subjects;
  }
}
