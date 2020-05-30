import 'package:douban_movie_flutter/model/usbox_movie_item_vo.dart';

import 'movie_item_vo.dart';

class UsBoxMovieVo {
  String title;
  String date;
  List<UsBoxMovieItemVo> usboxMovieItems;


  UsBoxMovieVo(this.title, this.usboxMovieItems);

  UsBoxMovieVo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    List<UsBoxMovieItemVo> usboxMovieItemData = [];
    for (var i = 0; i < json['subjects'].length; i++) {
      usboxMovieItemData.add(UsBoxMovieItemVo.fromJson(json['subjects'][i]));
    }
    usboxMovieItems = usboxMovieItemData;
  }

}