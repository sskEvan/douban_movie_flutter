import 'package:douban_movie_flutter/provider/movie_list_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton/movie_item_skeleton.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 电影列表页面
 */
class MovieListPage extends StatefulWidget {
  final bool isShowing;

  MovieListPage({this.isShowing, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieListPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ViewStateWidget<MovieItemListProvider>(
        provider: MovieItemListProvider(context, isShowing: widget.isShowing),
        onProviderReady: (provider) async {
          await provider.initData();
        },
        builder: (context, MovieItemListProvider provider, child) {
          if (provider.isBusy) {
            return SkeletonList(
              builder: (context, index) => MovieItemSkeleton(
                showIndexNumber: false,
              ),
            );
          } else if (provider.isEmpty) {
            return CommonEmptyWidget(onPressed: provider.initData);
          } else if (provider.isError) {
            return CommonErrorWidget(
                error: provider.viewStateError, onPressed: provider.initData);
          }
          return SmartRefresher(
            controller: provider.refreshController,
            header: WaterDropHeader(),
            footer: ClassicFooter(),
            onRefresh: provider.refresh,
            onLoading: provider.loadMore,
            enablePullUp: true,
            child: ListView.builder(
                itemCount: provider.list.length,
                itemBuilder: (context, index) {
                  return MovieItemWidget(
                      isShowing: widget.isShowing,
                      showIndexNumber: false,
                      index: index,
                      movieItemVo: provider.list[index]);
                }),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
