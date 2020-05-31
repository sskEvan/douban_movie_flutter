import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_detail_section_widget.dart';

/**
 * 电影详情页面剧照组件
 */
class MovieDetailStillsWidget extends StatelessWidget {
  MovieDetailVo movieDetailVo;

  MovieDetailStillsWidget(this.movieDetailVo,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;
    var showTrailersItem = false;
    if (movieDetailVo.trailers != null &&
        movieDetailVo.trailers.length > 0) {
      showTrailersItem = true;
    }
    var maxTrailersItemsCount = movieDetailVo.trailers.length > 3
        ? 3
        : movieDetailVo.trailers.length;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        children: <Widget>[
          MovieDetailSectionWidget(
              title: '剧照/预告片',
              actionText: '全部',
              onAction: () {
                Navigator.of(context).pushNamed(RouteName.movieStills,
                    arguments: [
                      movieDetailVo.id,
                      movieDetailVo.photosCount
                    ]);
              }),
          SizedBox(height: 6),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    movieDetailVo.photosCount >= 10
                        ? 10
                        : movieDetailVo.photosCount, (index) {
                  if (showTrailersItem) {
                    if (index < maxTrailersItemsCount) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteName.movieTrailersPage,
                              arguments: movieDetailVo.trailers[index]);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: itemWidth * 2 + 10,
                                height: itemHeight,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    CacheImageWidget(
                                      url: movieDetailVo
                                          .trailers[index].medium,
                                      radius: 5,
                                    ),
                                    Icon(
                                      Icons.play_circle_outline,
                                      size: 40,
                                      color: Color(0xaafffffff),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      );
                    } else {
                      return Row(
                        children: <Widget>[
                          SizedBox(
                            width: itemWidth,
                            height: itemHeight,
                            child: CacheImageWidget(
                              url: movieDetailVo
                                  .photoes[index - maxTrailersItemsCount].cover,
                              radius: 5,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    }
                  } else {
                    return Row(
                      children: <Widget>[
                        SizedBox(
                          width: itemWidth,
                          height: itemHeight,
                          child: CacheImageWidget(
                            url: movieDetailVo.photoes[index].cover,
                            radius: 5,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  }
                }),
              ))
        ],
      ),
    );
  }
}
