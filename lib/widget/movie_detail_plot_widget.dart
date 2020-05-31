import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 电影详情页剧情简介组件
 */
class MovieDetailPlotWidget extends StatelessWidget {
  final MovieDetailVo movieDetailVo;

  MovieDetailPlotWidget(this.movieDetailVo,
      {Key key})
      : super(key: key);

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
            text: movieDetailVo.summary,
            maxLines: 3,
            style: TextStyle(color: Colors.white, fontSize: 14),
            expand: false,
          ),
        ],
      ) ,
    );
  }
}
