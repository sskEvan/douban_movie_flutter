import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:palette_generator/palette_generator.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState(movieId);
  }
}

class MovieDetailState extends State<MovieDetailPage> {
  final String movieId;
  Color pageColor = Colors.white;
  MovieDetailEntity movieDetailEntity;

  MovieDetailState(this.movieId);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: pageColor,
          title: Text('电影'),
        ),
        body: ViewStateWidget<MovieDetailProvider>(
          provider: MovieDetailProvider(context),
          onProviderReady: (provider) async {
            await provider.initData(movieId);
          },
          builder: (context, MovieDetailProvider provider, child) {
            if (provider.isBusy) {
              return CommonLoadingWidget();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData(movieId));
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError,
                  onPressed: provider.initData(movieId));
            }

            movieDetailEntity = provider.movieDetailEntity;
            fetchPageColor(provider.movieDetailEntity.images.small);

            return Container(
              padding: EdgeInsets.all(15),
              color: pageColor,
              child: Column(
                children: <Widget>[
                  MovieDetailHeader(movieDetailEntity),
                  MovieDetailRating(movieDetailEntity)
                ],
              )
            );
          },
        ));
  }

  void fetchPageColor(url) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(url),
    );

    setState(() {
      if (paletteGenerator.darkVibrantColor != null) {
        pageColor = paletteGenerator.darkVibrantColor.color;
      } else {
        pageColor = Color(0xff35374c);
      }
    });
  }
}

class MovieDetailHeader extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;

  MovieDetailHeader(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildHanderPoster(),
        SizedBox(width: 10),
        _buildHeaderInfo(context),
      ],
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
            movieDetailEntity.title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            movieDetailEntity.originalTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 5),
          Text(
            '${movieDetailEntity.year} / ${_genres2String(movieDetailEntity.genres)} /${_durings2String(movieDetailEntity.durations)} '
            '/${_directors2String(movieDetailEntity.directors)} /${_cases2String(movieDetailEntity.casts)}',
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
    ;
  }

  Widget _buildHanderPoster() {
    return SizedBox(
      width: 100,
      height: 130,
      child: CacheImageWidget(
        url: movieDetailEntity.images.small,
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

  String _cases2String(List<MovieDetailCast> casts) {
    StringBuffer sb = new StringBuffer();
    casts.forEach((it) {
      sb.write(' ${it.name} ');
    });
    return sb.toString();
  }

  String _directors2String(List<MovieDetailDirector> directors) {
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

class MovieDetailRating extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;
  var totalRatingCount;

  MovieDetailRating(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    totalRatingCount = movieDetailEntity.rating.details.i1 +
        movieDetailEntity.rating.details.i2 +
        movieDetailEntity.rating.details.i3 +
        movieDetailEntity.rating.details.i4 +
        movieDetailEntity.rating.details.i5;

    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: ScreenUtil.width,
        height: 132,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil.width,
              child: Text(
                '豆瓣评分',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),

            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '${movieDetailEntity.rating.average}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    StaticRatingBar(
                      rate: movieDetailEntity.rating.average / 2,
                      size: 15,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i5 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i4 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i3 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i2 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('star_grey.png'),
                            width: 8, height: 8),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            width: 150,
                            height: 8,
                            child: LinearProgressIndicator(
                              value: movieDetailEntity.rating.details.i1 /
                                  totalRatingCount,
                              backgroundColor: Color(0xAAFFFFFF),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFD7B018)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
            Divider(height: 1,),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 Text(
                  '${movieDetailEntity.wishCount}想看',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  '${movieDetailEntity.collectCount}收藏',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            )
          ],
        ));
  }
}
