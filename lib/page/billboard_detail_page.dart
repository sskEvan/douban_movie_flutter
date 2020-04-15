import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_us_box_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_movie_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget.dart';
import 'package:douban_movie_flutter/widget/movie_skeleton_item_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BillboardDetailPage<T extends ViewStateRefreshListProvider>
    extends StatefulWidget {

  final actionType;

  BillboardDetailPage({this.actionType});

  @override
  State<StatefulWidget> createState() {
    return BillboardDetailState<T>(actionType);
  }
}

class BillboardDetailState<T extends ViewStateRefreshListProvider>
    extends State<BillboardDetailPage> with AutomaticKeepAliveClientMixin {

  final actionType;
  var provider;

  BillboardDetailState(this.actionType);

  @override
  Widget build(BuildContext context) {

    switch(actionType) {
      case RouteName.billboardTop250:
        provider = BillboardTop250Provider(context);
        break;
      case RouteName.billboardWeekly:
        provider = BillboardWeeklyMovieProvider(context);
        break;
      case RouteName.billboardNewMovies:
        provider = BillboardNewMoviesProvider(context);
        break;
      case RouteName.billboardUsBox:
        provider = BillboardUsBoxMovieProvider(context);
        break;
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text(actionType),
        ),
        body: ViewStateWidget<T>(
            provider: provider,
            onProviderReady: (provider) async {
              await provider.initData();
            },
            builder: (context, T provider, child) {
              if (provider.isBusy) {
                return SkeletonList(
                  builder: (context, index) =>
                      MovieSkeletonItemWidget(showIndexNumber: true),
                );
              } else if (provider.isEmpty) {
                return CommonEmptyWidget(onPressed: provider.initData);
              } else if (provider.isError) {
                return CommonErrorWidget(
                    error: provider.viewStateError,
                    onPressed: provider.initData);
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
                      MovieSubject item = provider.list[index];
                      return MovieItemWidget(
                          isShowing: false,
                          showIndexNumber: true,
                          index: index,
                          movieSubject: item);
                    }),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
