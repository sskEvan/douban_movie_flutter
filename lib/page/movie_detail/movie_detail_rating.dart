import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/utils/string_util.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailRatingWidget extends StatelessWidget {
  MovieDetailVo movieDetailVo;
  var totalRatingCount;

  MovieDetailRatingWidget(this.movieDetailVo);

  @override
  Widget build(BuildContext context) {
    totalRatingCount = movieDetailVo.rating.details.i1 +
        movieDetailVo.rating.details.i2 +
        movieDetailVo.rating.details.i3 +
        movieDetailVo.rating.details.i4 +
        movieDetailVo.rating.details.i5;

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
                      '${movieDetailVo.rating.average}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    StaticRatingBar(
                      rate: movieDetailVo.rating.average / 2,
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
                              value: totalRatingCount > 0 ? movieDetailVo.rating.details.i5 / totalRatingCount : 0,
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
                              value: totalRatingCount > 0 ? movieDetailVo.rating.details.i4 / totalRatingCount : 0,
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
                              value: totalRatingCount > 0 ? movieDetailVo.rating.details.i3 / totalRatingCount : 0,
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
                              value: totalRatingCount > 0 ? movieDetailVo.rating.details.i2 / totalRatingCount : 0,
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
                              value: totalRatingCount > 0 ? movieDetailVo.rating.details.i1 / totalRatingCount : 0,
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
                  '${StringUtil.friendlyCount(movieDetailVo.wishCount)}想看',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  '${StringUtil.friendlyCount(movieDetailVo.collectCount)}收藏',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            )
          ],
        ));
  }
}