import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/provider/billboard_list_provider.dart';
import 'package:douban_movie_flutter/widget/billboard_item_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_section_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
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

class BillboardState extends State<BillboardPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: SearchWidget(),
        ),
        body: Column(
          children: <Widget>[
            BillboardSection(
              title: '豆瓣TOP250',
              action: '全部',
              onTap: () {
                showToast('查看豆瓣TOP250', context: context);
              },
            ),
            _buildTop250GridView(context),
            BillboardSection(title: '其他榜单')
          ],
        ));
  }
}

Widget _buildTop250GridView(BuildContext context) {
  return ViewStateWidget<BillboardListProvider>(
      provider: BillboardListProvider(context),
      onProviderReady: (provider) async {
        await provider.initData();
      },
      builder: (context, BillboardListProvider provider, child) {
        if (provider.isBusy) {
          return CommonLoadingWidget();
        } else if (provider.isEmpty) {
          return Container();
        } else if (provider.isError) {
          return Container();
        }
        return Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: provider.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //横轴三个子widget
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  MovieSubject item = provider.list[index];
                  return BillboardItemWidget(movieSubject: item);
                }),
          )
        );
      });
}
