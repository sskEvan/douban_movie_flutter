import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/utils/string_util.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailRatingWidget extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;
  var totalRatingCount;

  MovieDetailRatingWidget(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    totalRatingCount = movieDetailEntity.rating.details.i1 +
        movieDetailEntity.rating.details.i2 +
        movieDetailEntity.rating.details.i3 +
        movieDetailEntity.rating.details.i4 +
        movieDetailEntity.rating.details.i5;

    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: ScreenUtil.width,
        height: 132,
        decoration: BoxDecoration(
          color: Color(0x33FFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil.width,
              child: Text(
                '豆瓣评分',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '${movieDetailEntity.rating.average}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    StaticRatingBar(
                      rate: movieDetailEntity.rating.average / 2,
                      size: 15,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i5 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i4 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i3 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i2 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i1 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
            Divider(height: 1, color: Color(0x66FFFFFF)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${StringUtil.friendlyCount(movieDetailEntity.wishCount)}想看',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  '${StringUtil.friendlyCount(movieDetailEntity.collectCount)}收藏',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            )
          ],
        ));
  }
}