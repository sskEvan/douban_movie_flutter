import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/movie_detail_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'movie_detail/movie_detail_cast.dart';
import 'movie_detail/movie_detail_commend.dart';
import 'movie_detail/movie_detail_header.dart';
import 'movie_detail/movie_detail_plot.dart';
import 'movie_detail/movie_detail_rating.dart';
import 'movie_detail/movie_detail_stills.dart';
import 'movie_detail/movie_detail_tag.dart';

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
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        MovieDetailHeader(movieDetailEntity),
                        MovieDetailRatingWidget(movieDetailEntity),
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

    if (paletteGenerator.darkVibrantColor != null &&
        pageColor != paletteGenerator.darkVibrantColor.color) {
      setState(() {
        pageColor = paletteGenerator.darkVibrantColor.color;
      });
    } else if (paletteGenerator.darkVibrantColor == null &&
        pageColor != Color(0xff35374c)) {
      setState(() {
        pageColor = Color(0xff35374c);
      });
    }
    ;
  }
}
