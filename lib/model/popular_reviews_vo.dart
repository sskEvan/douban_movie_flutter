import 'package:douban_movie_flutter/model/popular_comment_vo.dart';
import 'package:douban_movie_flutter/model/rating_vo.dart';

import 'author_vo.dart';

class PopularReviewsVo {
  Rating rating;
  String title;
  String subjectId;
  Author author;
  String summary;
  String alt;
  String id;

  PopularReviewsVo(
      {this.rating,
        this.title,
        this.subjectId,
        this.author,
        this.summary,
        this.alt,
        this.id});

  PopularReviewsVo.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    title = json['title'];
    subjectId = json['subject_id'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    summary = json['summary'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['title'] = this.title;
    data['subject_id'] = this.subjectId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['summary'] = this.summary;
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}


