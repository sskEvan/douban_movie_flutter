import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/**
 * 电影详情标签组件
 */
class MovieDetailTag extends StatelessWidget {
  MovieDetailVo movieDetailVo;

  MovieDetailTag(this.movieDetailVo,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Text(
              '所属频道',
              style: TextStyle(color: Color(0xAAFFFFFF), fontSize: 14),
            ),
            SizedBox(width: 10),
            Row(
              children: List.generate(movieDetailVo.tags.length, (index) {
                return _buildTagWidget(context, movieDetailVo.tags[index]);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTagWidget(BuildContext context, String tag) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            showToast("点击频道$tag", context: context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  tag,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xAAFFFFFF),
                  size: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
