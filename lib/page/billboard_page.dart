import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/provider/billboard_new_movies_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_usbox_provider.dart';
import 'package:douban_movie_flutter/provider/billboard_weekly_provider.dart';
import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_item_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_section_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_skeleton_item_widget.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class BillboardPage extends StatefulWidget {
  @override
  State<BillboardPage> createState() {
    return BillboardState();
  }
}

class BillboardState extends State<BillboardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: SearchWidget(),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                BillboardSection(
                  title: '豆瓣TOP250',
                  action: '全部',
                  onTap: () {
                    showToast('查看豆瓣TOP250', context: context);
                  },
                ),
                _buildTop250GridView(context),
                BillboardSection(title: '其他榜单'),
                _buildOtherBillboardBaners(context)
              ],
            )));
  }

  @override
  bool get wantKeepAlive => true;
}

Widget _buildTop250GridView(BuildContext context) {
  return ViewStateWidget<BillboardTop250>(
    provider: BillboardTop250(context),
    onProviderReady: (provider) async {
      await provider.initData();
    },
    builder: (context, BillboardTop250 provider, child) {
      if (provider.isBusy) {
        return SkeletonGrid(
          padding: EdgeInsets.symmetric(horizontal: 10),
          childAspectRatio: 0.65,
          builder: (context, index) =>
              BillboardTop250SkeletonItemWidget(index: index),
        );
      } else if (provider.isEmpty) {
        return Container();
      } else if (provider.isError) {
        return Container();
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              MovieSubject item = provider.list[index];
              return BillboardTop250ItemWidget(movieSubject: item);
            }),
      );
    },
  );
}

Widget _buildOtherBillboardBaners(BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: CarouselSlider(initialPage: 3, items: <Widget>[
        _buildBannerItem<BillboardWeekly>(BillboardWeekly(context)),
        _buildBannerItem<BillboardUsBox>(BillboardUsBox(context)),
        _buildBannerItem<BillboardNewMovies>(BillboardNewMovies(context)),
      ]));
}

Widget _buildBannerItem<T extends ViewStateListProvider>(
    ViewStateListProvider provider) {
  var url;
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
        url = (provider.list[0] as WeeklyMovieSubject).subject.images.small;
      } else if (provider is BillboardNewMovies) {
        url = (provider.list[0] as NewMovieSubject).images.small;
      } else if (provider is BillboardUsBox) {
        url = (provider.list[0] as UsboxMovieSubject).subject.images.small;
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 90,
          height: 120,
          child: CacheImageWidget(
            url: url,
            radius: 5,
          ),
        ),
      );
    },
  );
}
