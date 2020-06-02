import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_us_box_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_movie_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/skeleton/billboard_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 榜单详情页
 */
class BillboardDetailPage<T extends ViewStateRefreshListProvider>
    extends StatefulWidget {
  final actionType;

  BillboardDetailPage({this.actionType, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BillboardDetailState<T>();
  }
}

class _BillboardDetailState<T extends ViewStateRefreshListProvider>
    extends State<BillboardDetailPage> with AutomaticKeepAliveClientMixin {
  var _title;
  var _provider;
  var _sliverAppBarColor;

  _BillboardDetailState();

  @override
  void initState() {
    super.initState();

    switch (widget.actionType) {
      case RouteName.billboardTop250Page:
        _provider = BillboardTop250Provider(context);
        _title = '豆瓣电影TOP250';
        break;
      case RouteName.billboardWeeklyPage:
        _provider = BillboardWeeklyMovieProvider(context);
        _title = '豆瓣电影本周口碑榜';
        break;
      case RouteName.billboardNewMoviesPage:
        _provider = BillboardNewMoviesProvider(context);
        _title = '豆瓣电影新片榜';
        break;
      case RouteName.billboardUsBoxPage:
        _provider = BillboardUsBoxMovieProvider(context);
        _title = '豆瓣电影北美票房榜';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BillboardDetailState---build done');
    return new Scaffold(
        body: ViewStateWidget<T>(
            provider: _provider,
            onProviderReady: (provider) async {
              await provider.initData();
            },
            builder: (context, T provider, child) {
              if (provider.isBusy) {
                return BillboardDetailSkeleton();
              } else if (provider.isEmpty) {
                return CommonEmptyWidget(onPressed: provider.initData);
              } else if (provider.isError) {
                return CommonErrorWidget(
                    error: provider.viewStateError,
                    onPressed: provider.initData);
              }

              _fetchPageColor(context, provider.list[0].images.small);

              return SmartRefresher(
                  controller: provider.refreshController,
                  header: WaterDropHeader(),
                  footer: ClassicFooter(),
                  onRefresh: provider.refresh,
                  onLoading: provider.loadMore,
                  enablePullUp: true,
                  enablePullDown: false,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      new SliverAppBar(
                        centerTitle: false,
                        flexibleSpace: new FlexibleSpaceBar(
                          title: new Text(
                            _title,
                          ),
                          centerTitle: true,
                          collapseMode: CollapseMode.pin,
                          background: CacheImageWidget(
                              url: (provider.list[0] as MovieItemVo)
                                  .images
                                  .large),
                        ),
                        expandedHeight: 180.0,
                        floating: false,
                        pinned: true,
                        snap: false,
                        actions: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.more_horiz, color: Colors.white),
                          )
                        ],
                        backgroundColor: _sliverAppBarColor,
                      ),
                      new SliverList(
                        delegate: new SliverChildBuilderDelegate(
                          (context, index) => MovieItemWidget(
                              isShowing: false,
                              showIndexNumber: true,
                              index: index,
                              movieItemVo: provider.list[index]),
                          childCount: provider.list.length,
                        ),
                      ),
                    ],
                  ));
            }));
  }

  void _fetchPageColor(context, url) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(url),
    );

    if (paletteGenerator.darkVibrantColor != null && _sliverAppBarColor != paletteGenerator.darkVibrantColor.color) {
      setState(() {
        _sliverAppBarColor = paletteGenerator.darkVibrantColor.color;
      });
    } else if(paletteGenerator.darkVibrantColor == null && _sliverAppBarColor != Theme.of(context).primaryColor) {
      setState(() {
        _sliverAppBarColor = Theme.of(context).primaryColor;
      });
    }

  }

  @override
  bool get wantKeepAlive => true;

}
