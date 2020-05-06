import 'package:douban_movie_flutter/provider/movie_commend_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/movie_commend_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieCommendPage extends StatefulWidget {
  final String movieId;

  MovieCommendPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieCommendState(movieId);
  }
}

class MovieCommendState extends State<MovieCommendPage> {
  final String movieId;

  MovieCommendState(this.movieId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            '短评',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: ViewStateWidget<MovieCommendProvider>(
            provider: MovieCommendProvider(context),
            onProviderReady: (provider) async {
              await provider.initData(arguments: movieId);
            },
            builder: (context, MovieCommendProvider provider, child) {
              if (provider.isBusy) {
                return SkeletonList(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  builder: (context, index) => MovieCommendItemSkeleton(),
                );
              } else if (provider.isEmpty) {
                return CommonEmptyWidget(
                    onPressed: provider.initData(arguments: movieId));
              } else if (provider.isError) {
                return CommonErrorWidget(
                    error: provider.viewStateError,
                    onPressed: provider.initData(arguments: movieId));
              }
              return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SmartRefresher(
                    controller: provider.refreshController,
                    header: WaterDropHeader(),
                    footer: ClassicFooter(),
                    onRefresh: provider.refresh,
                    onLoading: provider.loadMore,
                    enablePullUp: true,
                    child: ListView.builder(
                        itemCount: provider.list.length,
                        itemBuilder: (context, index) {
                          return MovieCommendItemWidget(provider.list[index]);
                        }),
                  ));
            }));
  }
}
