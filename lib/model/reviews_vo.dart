import 'package:douban_movie_flutter/model/rating_vo.dart';

import 'author_vo.dart';

class ReviewsVo {
  Rating rating;
  int usefulCount;
  Author author;
  String createdAt;
  String title;
  String updatedAt;
  String shareUrl;
  String summary;
  String content;
  int uselessCount;
  int commentsCount;
  String alt;
  String id;
  String subjectId;

  ReviewsVo(
      {this.rating,
        this.usefulCount,
        this.author,
        this.createdAt,
        this.title,
        this.updatedAt,
        this.shareUrl,
        this.summary,
        this.content,
        this.uselessCount,
        this.commentsCount,
        this.alt,
        this.id,
        this.subjectId});

  ReviewsVo.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    usefulCount = json['useful_count'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    createdAt = json['created_at'];
    title = json['title'];
    updatedAt = json['updated_at'];
    shareUrl = json['share_url'];
    summary = json['summary'];
    content = json['content'];
    uselessCount = json['useless_count'];
    commentsCount = json['comments_count'];
    alt = json['alt'];
    id = json['id'];
    subjectId = json['subject_id'];
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
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    data['share_url'] = this.shareUrl;
    data['summary'] = this.summary;
    data['content'] = this.content;
    data['useless_count'] = this.uselessCount;
    data['comments_count'] = this.commentsCount;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    return data;
  }
}
