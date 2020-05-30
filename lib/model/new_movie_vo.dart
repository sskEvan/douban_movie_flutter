import 'movie_item_vo.dart';

class NewMovieVo {
  String title;
  List<MovieItemVo> movieItems;


  NewMovieVo(this.title, this.movieItems);

  NewMovieVo.fromJson(Map<String, dynamic> json) {
    title = json['title'];

    List<MovieItemVo> movieItemData = [];
    for (var i = 0; i < json['subjects'].length; i++) {
      movieItemData.add(MovieItemVo.fromJson(json['subjects'][i]));
    }
    movieItems = movieItemData;
  }

}