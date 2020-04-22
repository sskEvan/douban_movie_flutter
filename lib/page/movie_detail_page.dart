import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/utils/string_util.dart';
import 'package:douban_movie_flutter/widget/billboard_skeleton.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:douban_movie_flutter/widget/movie_detail_skeleton.dart';
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
              return MovieDetailSkeleton();
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
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              color: pageColor,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        MovieDetailHeader(movieDetailEntity),
                        MovieDetailRating(movieDetailEntity),
                        MovieDetailTag(movieDetailEntity),
                        MovieDetailPlot(movieDetailEntity),
                        MovieDetailCastWidget(movieDetailEntity),
                        MovieDetailStills(movieDetailEntity),
                        MovieDetailCommend(movieDetailEntity)
                      ],
                    ),
                  )
                ],
              ),
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
          color: Color(0x33FFFFFF),
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
            Divider(height: 1, color: Color(0x66FFFFFF)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${StringUtil.friendlyCount(movieDetailEntity.wishCount)}想看',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  '${StringUtil.friendlyCount(movieDetailEntity.collectCount)}收藏',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            )
          ],
        ));
  }
}

class MovieDetailTag extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;

  MovieDetailTag(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: List.generate(movieDetailEntity.tags.length, (index) {
                return _buildTagWidget(context, movieDetailEntity.tags[index]);
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
            showToast("点击频道${tag}", context: context);
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

class MovieDetailPlot extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailPlot(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '简介',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        ExpandableText(
          text: movieDetailEntity.summary,
          maxLines: 3,
          style: TextStyle(color: Colors.white, fontSize: 14),
          expand: false,
        ),
      ],
    );
  }
}

class MovieDetailCastWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailCastWidget(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          MovieDetailSection(
              title: '演员表', actionText: '全部${movieDetailEntity.casts.length}'),
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

class MovieDetailSection extends StatelessWidget {
  String actionText;
  String title;

  MovieDetailSection({this.actionText, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              actionText,
              style: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xAAFFFFFF),
              size: 14,
            )
          ],
        ))
      ],
    );
  }
}

class MovieDetailStills extends StatelessWidget {
  MovieDetailEntity movieDetailEntity;

  MovieDetailStills(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;
    return Column(
      children: <Widget>[
        MovieDetailSection(
            title: '剧照/预告片', actionText: '全部${movieDetailEntity.photosCount}'),
        SizedBox(height: 6),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              children: List.generate(
                  movieDetailEntity.photosCount >= 4
                      ? 4
                      : movieDetailEntity.photosCount, (index) {
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: itemWidth,
                      height: itemHeight,
                      child: CacheImageWidget(
                        url: movieDetailEntity.photos[index].cover,
                        radius: 5,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              }),
            ))
      ],
    );
  }
}

class MovieDetailCommend extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailCommend(this.movieDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Color(0x33FFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          MovieDetailSection(
              title: '短评', actionText: '全部${movieDetailEntity.commentsCount}'),
          SizedBox(height: 6),
          Column(
            children: List.generate(
                movieDetailEntity.commentsCount >= 4
                    ? 4
                    : movieDetailEntity.commentsCount, (index) {
              return _buildCommendItem(
                  movieDetailEntity.popularComments[index]);
            }),
          )
        ],
      ),
    );
  }

  Widget _buildCommendItem(MovieDetailPopularCommants popularCommant) {
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
                url: popularCommant.author.avatar,
                radius: 15,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  popularCommant.author.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                StaticRatingBar(
                  rate: movieDetailEntity.rating.average / 2,
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
          text: popularCommant.content,
          maxLines: 4,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: Color(0xAAFFFFFF),
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${popularCommant.usefulCount}',
              style: TextStyle(fontSize: 12, color: Color(0xAAFFFFFF)),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0x66FFFFFF)),
      ],
    );
  }
}
