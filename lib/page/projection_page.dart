import 'package:douban_movie_flutter/page/movie_page.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectionPage extends StatefulWidget {
  @override
  State<ProjectionPage> createState() => ProjectionState();
}

class ProjectionState extends State<ProjectionPage>
    with TickerProviderStateMixin {
  final _tabs = [Tab(text: '正在上映'), Tab(text: '即将上映')];

  var _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 2, vsync: this);

    return new Scaffold(
      appBar: AppBar(
        title: SearchWidget(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child:  TabBar(
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
                MoviePage(isShowing: true),
                MoviePage(isShowing: false)
              ],
            ),
          )
        ],
      ),
    );
  }

}
