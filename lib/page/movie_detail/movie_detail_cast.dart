import 'package:douban_movie_flutter/model/cast_vo.dart';
import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';

import 'movie_detail_section.dart';

class MovieDetailCastWidget extends StatelessWidget {
  final MovieDetailVo movieDetailVo;

  MovieDetailCastWidget(this.movieDetailVo);

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
                    movieDetailVo.casts.length >= 4
                        ? 4
                        : movieDetailVo.casts.length, (index) {
                  return _buildCastImageItem(movieDetailVo.casts[index]);
                }),
              ))
        ],
      ),
    );
  }

  Widget _buildCastImageItem(CastVo castVo) {
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
                url: castVo.avatars.small,
                radius: 5,
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: itemWidth,
              child: Text(
                castVo.name,
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