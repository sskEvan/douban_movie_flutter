import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/provider/celebrity_works_provider.dart';
import 'package:douban_movie_flutter/provider/movie_list_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton/movie_item_skeleton.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 电影列表页面
 */
class CelebrityWorksPage extends StatefulWidget {
  String id;

  CelebrityWorksPage(this.id, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CelebrityWorksState();
  }
}

class _CelebrityWorksState extends State<CelebrityWorksPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            DouBanLocalizations.of(context).all_movie,
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black87),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ViewStateWidget<CelebrityWorksProvider>(
            provider: CelebrityWorksProvider(context),
            onProviderReady: (provider) async {
              await provider.initData(arguments: widget.id);
            },
            builder: (context, CelebrityWorksProvider provider, child) {
              if (provider.isBusy) {
                return SkeletonList(
                  builder: (context, index) => MovieItemSkeleton(
                    showIndexNumber: false,
                  ),
                );
              } else if (provider.isEmpty) {
                return CommonEmptyWidget(onPressed: provider.initData(arguments: widget.id));
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
                      return MovieItemWidget(
                          isShowing: false,
                          showIndexNumber: false,
                          index: index,
                          movieItemVo: provider.list[index]);
                    }),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
