import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailPlot extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailPlot(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '简介',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          ExpandableText(
            text: movieDetailEntity.summary,
            maxLines: 3,
            style: TextStyle(color: Colors.white, fontSize: 14),
            expand: false,
          ),
        ],
      ) ,
    );
  }
}
