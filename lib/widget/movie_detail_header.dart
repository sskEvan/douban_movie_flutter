import 'package:douban_movie_flutter/model/cast_vo.dart';
import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/model/director_vo.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/**
 * 电影详情页头部组件
 */
class MovieDetailHeader extends StatelessWidget {
  MovieDetailVo movieDetailVo;

  MovieDetailHeader(this.movieDetailVo,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHanderPoster(),
          SizedBox(width: 10),
          _buildHeaderInfo(context),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo(context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            movieDetailVo.title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            movieDetailVo.originalTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 5),
          Text(
            '${movieDetailVo.year} / ${_genres2String(movieDetailVo.genres)} /${_durings2String(movieDetailVo.durations)} '
                '/${_directors2String(movieDetailVo.directors)} /${_cases2String(movieDetailVo.casts)}',
            style: TextStyle(color: Colors.white, fontSize: 13),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton.icon(
                    color: Colors.white,
                    icon: Image.asset(
                      ImageHelper.wrapAssets("want_to_see.png"),
                      width: 20,
                      height: 20,
                    ),
                    label: Text(
                      "想看",
                    ),
                    onPressed: () {
                      showToast("想看", context: context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(width: 15),
              Expanded(
                child: RaisedButton.icon(
                  color: Colors.white,
                  icon: Image.asset(
                    ImageHelper.wrapAssets("star.png"),
                    width: 20,
                    height: 20,
                  ),
                  label: Text(
                    "看过",
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    showToast("看过", context: context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHanderPoster() {
    return SizedBox(
      width: 100,
      height: 130,
      child: CacheImageWidget(
        url: movieDetailVo.images.small,
        radius: 5,
      ),
    );
  }

  String _genres2String(List genres) {
    StringBuffer sb = new StringBuffer();
    genres.forEach((it) {
      sb.write(' $it ');
    });
    return sb.toString();
  }

  String _cases2String(List<CastVo> casts) {
    StringBuffer sb = new StringBuffer();
    casts.forEach((it) {
      sb.write(' ${it.name} ');
    });
    return sb.toString();
  }

  String _directors2String(List<DirectorVo> directors) {
    StringBuffer sb = new StringBuffer();
    directors.forEach((it) {
      sb.write(' ${it.name} ');
    });
    return sb.toString();
  }

  String _durings2String(List durings) {
    StringBuffer sb = new StringBuffer();
    durings.forEach((it) {
      sb.write(' $it ');
    });
    return sb.toString();
  }
}
