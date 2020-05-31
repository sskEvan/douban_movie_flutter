import 'package:douban_movie_flutter/model/cast_vo.dart';
import 'package:douban_movie_flutter/model/director_vo.dart';
import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/model/writer_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_detail_section_widget.dart';

/**
 * 电影详情页演员列表组件
 */
class MovieDetailStaffListWidget extends StatelessWidget {
  final MovieDetailVo movieDetailVo;
  List<DirectorVo> _directorList;
  List<WriterVo> _writerList;
  List<CastVo> _castList;

  MovieDetailStaffListWidget(this.movieDetailVo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _directorList = movieDetailVo.directors;
    _writerList = movieDetailVo.writers;
    _castList = movieDetailVo.casts;

    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          MovieDetailSectionWidget(title: '职员表'),
          SizedBox(height: 6),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    _directorList.length +
                        _writerList.length +
                        _castList.length, (index) {
                  if (_directorList.length > 0 &&
                      index < _directorList.length) {
                    return _buildStaffItem(
                        id: _directorList[index].id,
                        avatars: _directorList[index].avatars.small,
                        name: _directorList[index].nameEn,
                        post: '导演');
                  } else if (_writerList.length > 0 &&
                      index < _directorList.length + _writerList.length) {
                    return _buildStaffItem(
                        id: _writerList[index - _directorList.length].id,
                        avatars: _writerList[index - _directorList.length]
                            .avatars
                            .small,
                        name: _writerList[index - _directorList.length].nameEn,
                        post: '编剧');
                  } else {
                    return _buildStaffItem(
                        id: _castList[index -
                                _directorList.length -
                                _writerList.length]
                            .id,
                        avatars: _castList[index -
                                _directorList.length -
                                _writerList.length]
                            .avatars
                            .small,
                        name: _castList[index -
                                _directorList.length -
                                _writerList.length]
                            .nameEn);
                  }

                  return _buildStaffItem();
                }),
              ))
        ],
      ),
    );
  }

  Widget _buildStaffItem({String id, String avatars, String name, String post}) {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;

    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: itemWidth,
              height: itemHeight,
              child: CacheImageWidget(
                url: avatars,
                radius: 5,
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: itemWidth,
              child: Text(
                post == null ? name : '[$post]$name',
                style: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontSize: 12,
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
