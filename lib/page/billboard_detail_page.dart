import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget.dart';
import 'package:douban_movie_flutter/widget/movie_skeleton_item_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BillboardDetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BillboardDetailState();
  }
}

class BillboardDetailState extends State<BillboardDetailPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('top250'),
        ),
        body: ViewStateWidget<BillboardTop250Provider>(
            provider: BillboardTop250Provider(context),
            onProviderReady: (provider) async {
              await provider.initData();
            },
            builder: (context, BillboardTop250Provider provider, child) {
              if (provider.isBusy) {
                return SkeletonList(
                  builder: (context, index) => MovieSkeletonItemWidget(),
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
                      MovieSubject item = provider.list[index];
                      return MovieItemWidget(isShowing: false, movieSubject: item);
                    }),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;

}