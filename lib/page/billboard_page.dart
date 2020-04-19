import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/provider/billboard_provider.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/billboard_banner_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_skeleton.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_item_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_section_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillboardPage extends StatefulWidget {
  @override
  State<BillboardPage> createState() {
    return BillboardState();
  }
}

class BillboardState extends State<BillboardPage>
    with AutomaticKeepAliveClientMixin {
  var banners;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: SearchWidget(),
        ),
        body: ViewStateWidget<BillboardProvider>(
          provider: BillboardProvider(context),
          onProviderReady: (provider) async {
            await provider.initData();
          },
          builder: (context, BillboardProvider provider, child) {
            if (provider.isBusy) {
              return BillboardSkeleton();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData);
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError,
                  onPressed:provider.initData);
            }
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  BillboardSection(
                    title: DouBanLocalizations.of(context).top_250,
                    action: DouBanLocalizations.of(context).all,
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.billboardTop250);
                    },
                  ),
                  _buildTop250GridView(context, provider.top250MovieSubjects),
                  BillboardSection(
                      title: DouBanLocalizations.of(context).other_billboard),
                  _buildOtherBillboardBaners(context, <Widget>[
                    BillboardBanner(title: provider.weeklyBannerEntity.title,
                        movieSubjects: provider.weeklyBannerEntity.movieSubjects,
                        routerName: provider.weeklyBannerEntity.routerName),
                    BillboardBanner(title: provider.newMovieBannerEntity.title,
                        movieSubjects: provider.newMovieBannerEntity.movieSubjects,
                        routerName: provider.newMovieBannerEntity.routerName),
                    BillboardBanner(title: provider.usboxBannerEntity.title,
                        movieSubjects: provider.usboxBannerEntity.movieSubjects,
                        routerName: provider.usboxBannerEntity.routerName),
                  ])
                ],
              ),
            );
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildTop250GridView(BuildContext context, data) {
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
            MovieSubject item = data[index];
            return BillboardTop250ItemWidget(movieSubject: item);
          }),
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
