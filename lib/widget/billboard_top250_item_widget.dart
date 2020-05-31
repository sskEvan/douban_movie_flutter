import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/material.dart';

/**
 * 豆瓣热门250item组件
 */
class BillboardTop250ItemWidget extends StatelessWidget {
  final MovieItemVo movieItemVo;

  var contentWidth;
  var contentHeight;

  BillboardTop250ItemWidget({this.movieItemVo})
      : super(key: ValueKey(movieItemVo.id));

  @override
  Widget build(BuildContext context) {
    contentWidth = (ScreenUtil.width - 20) / 3 - 10;
    contentHeight = contentWidth / 0.65 - 10;

    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteName.movieDetail, arguments: movieItemVo.id);
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
        url: movieItemVo.images.small,
        radius: 5,
      ),
    );
  }

  Widget _buildMovieTitle() {
    return Text(
      movieItemVo.title,
      style: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
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
              style: TextStyle(color: Colors.black45, fontSize: 13))
        ],
      );
    } else {
      return Text(DouBanLocalizations.of(context).no_scare,
          style: TextStyle(color: Colors.black45, fontSize: 13));
    }
  }

}
