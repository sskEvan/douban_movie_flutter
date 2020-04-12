import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_usbox_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_provider.dart';
import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cache_image_widget.dart';
import 'common_loading_widget.dart';

class BillboardBanner<T extends ViewStateListProvider> extends StatefulWidget {
  final ViewStateListProvider provider;

  BillboardBanner(this.provider);

  @override
  State<StatefulWidget> createState() {
    return BillboardBannerState<T>(provider);
  }
}

class BillboardBannerState<T extends ViewStateListProvider>
    extends State<BillboardBanner> with AutomaticKeepAliveClientMixin {
  final ViewStateListProvider provider;
  MovieSubject movieSubject;

  BillboardBannerState(this.provider);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget<T>(
      provider: provider,
      onProviderReady: (provider) async {
        await provider.initData();
      },
      builder: (context, T provider, child) {
        if (provider.isBusy) {
          return CommonLoadingWidget();
        } else if (provider.isEmpty) {
          return Container();
        } else if (provider.isError) {
          return Container();
        }
        if (provider is BillboardWeekly) {
          movieSubject = (provider.list[0] as WeeklyMovieSubject).subject;
        } else if (provider is BillboardNewMovies) {
          movieSubject = provider.list[0];
        } else if (provider is BillboardUsBox) {
          movieSubject = (provider.list[0] as UsboxMovieSubject).subject;
        }
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                  width: ScreenUtil.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.width,
                        height: 120,
                        child: CacheImageWidget(
                          url: movieSubject.images.small,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didUpdateWidget(BillboardBanner<ViewStateListProvider> oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
}



