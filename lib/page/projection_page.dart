import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/page/movie_list_page.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/search_label_widget.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 首页电影页
 */
class ProjectionPage extends StatefulWidget {
  ProjectionPage({Key key}) : super(key: key);

  @override
  State<ProjectionPage> createState() => _ProjectionState();
}

class _ProjectionState extends State<ProjectionPage>
    with TickerProviderStateMixin {
  var _tabs;
  var _tabController;

  @override
  Widget build(BuildContext context) {
    _tabs = [
      Tab(text: DouBanLocalizations.of(context).showing_projection),
      Tab(text: DouBanLocalizations.of(context).upcoming_projection)
    ];

    _tabController = TabController(length: 2, vsync: this);

    return new Scaffold(
      appBar: AppBar(
        title: SearchLabelWidget(
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.searchPage);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 16),
              controller: _tabController,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: _tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                MovieListPage(isShowing: true),
                MovieListPage(isShowing: false)
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
