import 'package:douban_movie_flutter/model/movie_item_vo.dart';

class UsBoxMovieItemVo {
  int box;
  bool newMovie;
  int rank;
  MovieItemVo movieItemVo;

  UsBoxMovieItemVo({this.box, this.newMovie, this.rank, this.movieItemVo});

  UsBoxMovieItemVo.fromJson(Map<String, dynamic> json) {
    box = json['box'];
    newMovie = json['new'];
    rank = json['rank'];
    movieItemVo = MovieItemVo.fromJson(json['subject']);
  }
}
