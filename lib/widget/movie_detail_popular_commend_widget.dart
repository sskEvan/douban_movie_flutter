import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/model/popular_comment_vo.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_detail_section_widget.dart';

/**
 * 电影详情页热门短评组件
 */
class MovieDetailPopularCommendWidget extends StatelessWidget {
  final MovieDetailVo movieDetailVo;

  MovieDetailPopularCommendWidget(this.movieDetailVo,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      margin: EdgeInsets.fromLTRB(15, 30, 15, 30 + kToolbarHeight),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Color(0x33FFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          MovieDetailSectionWidget(
              title: '短评',
              actionText: '全部${movieDetailVo.commentsCount}',
          onAction: () {
                Navigator.of(context).pushNamed(RouteName.movieCommend, arguments: movieDetailVo.id);
          },),
          SizedBox(height: 6),
          Column(
            children: List.generate(
                movieDetailVo.commentsCount >= 4
                    ? 4
                    : movieDetailVo.commentsCount, (index) {
              return _buildCommendItem(
                  movieDetailVo.popularComments[index]);
            }),
          )
        ],
      ),
    );
  }

  Widget _buildCommendItem(PopularCommentVo popularCommentVo) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 14,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30,
              height: 30,
              child: CacheImageWidget(
                url: popularCommentVo.author.avatar,
                radius: 15,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  popularCommentVo.author.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                StaticRatingBar(
                  rate: popularCommentVo.rating.value / 2,
                  size: 12,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ExpandableText(
          text: popularCommentVo.content,
          maxLines: 4,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: Color(0xAAFFFFFF),
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${popularCommentVo.usefulCount}',
              style: TextStyle(fontSize: 12, color: Color(0xAAFFFFFF)),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0x66FFFFFF)),
      ],
    );
  }
}