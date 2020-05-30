import 'package:douban_movie_flutter/model/reviews_vo.dart';

import 'movie_item_vo.dart';

class ReviewsListVo {
  int count;
  int start;
  int total;
  int nextStart;
  MovieItemVo movieItemVo;
  List<ReviewsVo> reviews;

  ReviewsListVo(
      {this.count, this.start, this.total, this.nextStart, this.movieItemVo, this.reviews});

  ReviewsListVo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    nextStart = json['next_start'];
    movieItemVo =
    json['subject'] != null ? MovieItemVo.fromJson(json['subject']) : null;

    List<ReviewsVo> reviewsData = [];
    for (var i = 0; i < json['reviews'].length; i++) {
      reviewsData.add(ReviewsVo.fromJson(json['reviews'][i]));
    }
    reviews = reviewsData;

  }

}

