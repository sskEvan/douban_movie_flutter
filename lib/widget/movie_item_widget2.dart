import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/material.dart';

/**
 * 豆瓣热门250item组件
 */
class MovieItemWidget2 extends StatelessWidget {
  final MovieItemVo movieItemVo;

  var contentWidth;
  var contentHeight;

  MovieItemWidget2({this.movieItemVo}) : super(key: ValueKey(movieItemVo.id));

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteName.movieDetailPage,
              arguments: movieItemVo.id);
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildMoviePoster(),
              _buildMovieTitle(context),
              _buildMovieScore(context)
            ],
          ),
        ));
  }

  Widget _buildMoviePoster() {
    return CacheImageWidget(
      url: movieItemVo.images.small,
      radius: 5,
      width: contentWidth,
      height: contentHeight - 25,
    );
  }

  Widget _buildMovieTitle(BuildContext context) {
    return SizedBox(
        width: contentWidth,
        child: Text(
          movieItemVo.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ThemeHelper.wrapDarkColor(context, Colors.black), fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }

  Widget _buildMovieScore(BuildContext context) {
    if (movieItemVo.rating.average > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StaticRatingBar(
            rate: movieItemVo.rating.average / 2,
            size: 13,
          ),
          SizedBox(width: 5),
          Text('${movieItemVo.rating.average}',
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black45), fontSize: 13))
        ],
      );
    } else {
      return Text(DouBanLocalizations.of(context).no_scare,
          style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black45), fontSize: 13));
    }
  }
}
