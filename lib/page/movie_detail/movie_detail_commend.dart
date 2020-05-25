import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_detail_section.dart';

class MovieDetailCommend extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailCommend(this.movieDetailEntity);

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
          MovieDetailSection(
              title: '短评',
              actionText: '全部${movieDetailEntity.commentsCount}',
          onAction: () {
                Navigator.of(context).pushNamed(RouteName.movieCommend, arguments: movieDetailEntity.id);
          },),
          SizedBox(height: 6),
          Column(
            children: List.generate(
                movieDetailEntity.commentsCount >= 4
                    ? 4
                    : movieDetailEntity.commentsCount, (index) {
              return _buildCommendItem(
                  movieDetailEntity.popularComments[index]);
            }),
          )
        ],
      ),
    );
  }

  Widget _buildCommendItem(MovieDetailPopularCommants popularCommant) {
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
                url: popularCommant.author.avatar,
                radius: 15,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  popularCommant.author.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                StaticRatingBar(
                  rate: popularCommant.rating.value / 2,
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
          text: popularCommant.content,
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
              '${popularCommant.usefulCount}',
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