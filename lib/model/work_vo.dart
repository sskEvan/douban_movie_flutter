import 'movie_item_vo.dart';

class WorkVo {
  List<String> roles;
  MovieItemVo movieItemVo;

  WorkVo({this.roles, this.movieItemVo});

  WorkVo.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    movieItemVo =
    json['subject'] != null ? new MovieItemVo.fromJson(json['subject']) : null;
  }
}