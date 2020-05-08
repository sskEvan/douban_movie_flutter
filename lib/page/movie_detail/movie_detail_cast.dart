import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';

import 'movie_detail_section.dart';

class MovieDetailCastWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailCastWidget(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          MovieDetailSection(title: '演员表'),
          SizedBox(height: 6),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: List.generate(
                    movieDetailEntity.casts.length >= 4
                        ? 4
                        : movieDetailEntity.casts.length, (index) {
                  return _buildCastImageItem(movieDetailEntity.casts[index]);
                }),
              ))
        ],
      ),
    );
  }

  Widget _buildCastImageItem(MovieDetailCast movieDetailCast) {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              width: itemWidth,
              height: itemHeight,
              child: CacheImageWidget(
                url: movieDetailCast.avatars.small,
                radius: 5,
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: itemWidth,
              child: Text(
                movieDetailCast.name,
                style: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}