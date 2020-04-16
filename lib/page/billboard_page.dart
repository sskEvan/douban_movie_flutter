import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/provider/billboard_top250_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/billboard_banner_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_item_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_section_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_skeleton_item_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
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
  var banners = <Widget>[
    BillboardBannerSkeleton(shimmer: true),
    BillboardBannerSkeleton(shimmer: true),
    BillboardBannerSkeleton(shimmer: true),
  ];

  @override
  void initState() {
    super.initState();
    _fetchOtherBillboard();
  }

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
                  title: DouBanLocalizations.of(context).top_250,
                  action: DouBanLocalizations.of(context).all,
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteName.billboardTop250);
                  },
                ),
                _buildTop250GridView(context),
                BillboardSection(
                    title: DouBanLocalizations.of(context).other_billboard),
                _buildOtherBillboardBaners(context, banners)
              ],
            )));
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchOtherBillboard() async {
    WeeklyMovieEntity weeklyMovieEntity =
        await DouBanMovieRepository.getWeeklyMovieEntity();
    UsboxMovieEntity usboxMovieEntity =
        await DouBanMovieRepository.getUsBoxMovieEntity();
    NewMovieEntity newMovieEntity =
        await DouBanMovieRepository.getNewMovieEntity();

    var weeklyMovieSubjects = <MovieSubject>[];
    weeklyMovieEntity.subjects.forEach((it) {
      weeklyMovieSubjects.add(it.subject);
    });
    List<MovieSubject> newMovieSubjects = newMovieEntity.subjects;
    var usboxMovieSubjects = <MovieSubject>[];
    usboxMovieEntity.subjects.forEach((it) {
      usboxMovieSubjects.add(it.subject);
    });

    setState(() {
      banners = [
        BillboardBanner(
            title: weeklyMovieEntity.title, movieSubjects: weeklyMovieSubjects, routerName: RouteName.billboardWeekly),
        BillboardBanner(
            title: usboxMovieEntity.title, movieSubjects: newMovieSubjects, routerName: RouteName.billboardUsBox),
        BillboardBanner(
            title: newMovieEntity.title, movieSubjects: usboxMovieSubjects, routerName: RouteName.billboardNewMovies),
      ];
    });
  }

  Widget _buildTop250GridView(BuildContext context) {
    return ViewStateWidget<BillboardTop250Provider>(
      provider: BillboardTop250Provider(context),
      onProviderReady: (provider) async {
        await provider.initData();
      },
      builder: (context, BillboardTop250Provider provider, child) {
        if (provider.isBusy) {
          return SkeletonGrid(
            padding: EdgeInsets.symmetric(horizontal: 10),
            childAspectRatio: 0.65,
            builder: (context, index) =>
                BillboardTop250SkeletonItemWidget(index: index),
          );
        } else if (provider.isEmpty) {
          return CommonEmptyWidget(onPressed: provider.initData);
        } else if (provider.isError) {
          return CommonErrorWidget(
              error: provider.viewStateError,
              onPressed: () {
                provider.initData;
                setState(() {
                  banners = <Widget>[
                    BillboardBannerSkeleton(),
                    BillboardBannerSkeleton(),
                    BillboardBannerSkeleton(),
                  ];
                });
                _fetchOtherBillboard();
              });
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
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
}

Widget _buildOtherBillboardBaners(BuildContext context, List<Widget> banners) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      width: ScreenUtil.width,
      height: 200,
      child: CarouselSlider(
        aspectRatio: 15 / 9,
        items: banners,
      ));
}
