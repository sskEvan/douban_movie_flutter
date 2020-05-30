import 'package:douban_movie_flutter/model/comment_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cache_image_widget.dart';
import 'expandable_text.dart';

class MovieCommendItemWidget extends StatelessWidget {
  final CommentVo commentVo;

  MovieCommendItemWidget(this.commentVo);

  @override
  Widget build(BuildContext context) {
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
                url: commentVo.author.avatar,
                radius: 15,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  commentVo.author.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                StaticRatingBar(
                  rate: commentVo.rating.value / 2,
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
          text: commentVo.content,
          maxLines: 4,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: Colors.black26,
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${commentVo.usefulCount}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black26,
              ),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0xdddddddd)),
      ],
    );
  }
}

class MovieCommendItemSkeleton extends StatelessWidget {

  var isDark;

  @override
  Widget build(BuildContext context) {
    isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 14,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30,
              height: 30,
              child: Container(
                decoration: SkeletonDecoration(isDark: isDark, isCircle: true),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 10,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
                SizedBox(height: 2),
                Container(
                  width: 100,
                  height: 10,
                  decoration: SkeletonDecoration(isDark: isDark),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(isDark: isDark),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(isDark: isDark),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: ScreenUtil.width,
          height: 10,
          decoration: SkeletonDecoration(isDark: isDark),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 10,
          decoration: SkeletonDecoration(isDark: isDark),
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0xdddddddd)),
      ],
    );
  }

}