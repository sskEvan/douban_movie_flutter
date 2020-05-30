import 'package:douban_movie_flutter/model/rating_vo.dart';
import 'package:flutter/cupertino.dart';

import 'author_vo.dart';

class PopularCommentVo {
  Rating rating;
  int usefulCount;
  Author author;
  String subjectId;
  String content;
  String createdAt;
  String id;

  PopularCommentVo(
      {this.rating,
        this.usefulCount,
        this.author,
        this.subjectId,
        this.content,
        this.createdAt,
        this.id});

  PopularCommentVo.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    usefulCount = json['useful_count'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    subjectId = json['subject_id'];
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['useful_count'] = this.usefulCount;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['subject_id'] = this.subjectId;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
