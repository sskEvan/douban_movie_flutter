import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'dotted_line_widget.dart';
import 'skeleton.dart';

class BillboardTop250ItemWidget extends StatelessWidget {
  final MovieSubject movieSubject;

  var contentWidth;
  var contentHeight;

  BillboardTop250ItemWidget({this.movieSubject})
      : super(key: ValueKey(movieSubject.id));

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

    return InkWell(
        onTap: () {
          print('----------item click');
        },
        child:  Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildMoviePoster(),
              _buildMovieTitle(),
              _buildMovieScore(context)
            ],
          ),
        ));
  }

  Widget _buildMoviePoster() {
    return SizedBox(
      width: contentWidth,
      height: contentHeight - 25,
      child: CacheImageWidget(
        url: movieSubject.images.small,
        radius: 5,
      ),
    );
  }

  Widget _buildMovieTitle() {
    return Text(
      movieSubject.title,
      style: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildMovieScore(BuildContext context) {
    if (movieSubject.rating.average > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StaticRatingBar(
            rate: movieSubject.rating.average / 2,
            size: 13,
          ),
          SizedBox(width: 5),
          Text('${movieSubject.rating.average}',
              style: TextStyle(color: Colors.black45, fontSize: 13))
        ],
      );
    } else {
      return Text(DouBanLocalizations.of(context).no_scare,
          style: TextStyle(color: Colors.black45, fontSize: 13));
    }
  }

}
