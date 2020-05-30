import 'package:douban_movie_flutter/model/comment_vo.dart';

import 'movie_item_vo.dart';

class CommentListVo {
  int count;
  int start;
  int total;
  int nextStart;
  MovieItemVo movieItemVo;
  List<CommentVo> comments;

  CommentListVo({this.count, this.start, this.total, this.nextStart, this.movieItemVo, this.comments});

  CommentListVo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    nextStart = json['next_start'];
    movieItemVo =
    json['subject'] != null ? MovieItemVo.fromJson(json['subject']) : null;

    List<CommentVo> commentsData = [];
    for (var i = 0; i < json['comments'].length; i++) {
      commentsData.add(CommentVo.fromJson(json['comments'][i]));
    }
    comments = commentsData;
  }


}
