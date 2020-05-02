import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';

import 'movie_detail_section.dart';

class MovieDetailStills extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;

  MovieDetailStills(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;
    return Column(
      children: <Widget>[
        MovieDetailSection(
            title: '剧照/预告片',
            actionText: '全部',
            onAction: () {
              Navigator.of(context).pushNamed(RouteName.movieStills, arguments: [movieDetailEntity.id, movieDetailEntity.photosCount]);
            }),
        SizedBox(height: 6),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              children: List.generate(
                  movieDetailEntity.photosCount >= 4
                      ? 4
                      : movieDetailEntity.photosCount, (index) {
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: itemWidth,
                      height: itemHeight,
                      child: CacheImageWidget(
                        url: movieDetailEntity.photos[index].cover,
                        radius: 5,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              }),
            ))
      ],
    );
  }
}
