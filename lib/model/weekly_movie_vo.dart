import 'package:douban_movie_flutter/model/weekly_movie_item_vo.dart';

import 'movie_item_vo.dart';

class WeeklyMovieVo {
  String title;
  List<WeeklyMovieItemVo> weeklyMovieItems;


  WeeklyMovieVo(this.title, this.weeklyMovieItems);

  WeeklyMovieVo.fromJson(Map<String, dynamic> json) {
    title = json['title'];

    List<WeeklyMovieItemVo> weeklyMovieItemData = [];
    for (var i = 0; i < json['subjects'].length; i++) {
      weeklyMovieItemData.add(WeeklyMovieItemVo.fromJson(json['subjects'][i]));
    }
    weeklyMovieItems = weeklyMovieItemData;
  }

}