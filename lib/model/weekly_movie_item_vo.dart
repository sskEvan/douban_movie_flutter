import 'movie_item_vo.dart';

class WeeklyMovieItemVo {
  int rank;
  int delta;
  MovieItemVo movieItemVo;

  WeeklyMovieItemVo(this.rank, this.delta);

  WeeklyMovieItemVo.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    delta = json['delta'];
    movieItemVo = MovieItemVo.fromJson(json['subject']);
  }

}