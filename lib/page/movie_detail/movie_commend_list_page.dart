import 'package:douban_movie_flutter/provider/movie_commend_list_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/movie_commend_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton/movie_commend_Item_skeleton.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 电影短评列表页
 */
class MovieCommendListPage extends StatefulWidget {
  final String movieId;

  MovieCommendListPage(this.movieId,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieCommendState();
  }
}

class _MovieCommendState extends State<MovieCommendListPage> {

  _MovieCommendState();

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
        body: ViewStateWidget<MovieCommendListProvider>(
            provider: MovieCommendListProvider(context),
            onProviderReady: (provider) async {
              await provider.initData(arguments: widget.movieId);
            },
            builder: (context, MovieCommendListProvider provider, child) {
              if (provider.isBusy) {
                return SkeletonList(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  builder: (context, index) => MovieCommendItemSkeleton(),
                );
              } else if (provider.isEmpty) {
                return CommonEmptyWidget(
                    onPressed: provider.initData(arguments: widget.movieId));
              } else if (provider.isError) {
                return CommonErrorWidget(
                    error: provider.viewStateError,
                    onPressed: provider.initData(arguments: widget.movieId));
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
