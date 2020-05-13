import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget2.dart';
import 'package:douban_movie_flutter/widget/over_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomDrawerDemoPage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerDemoPageState2();
  }
}

class BottomDrawerDemoPageState2 extends State<BottomDrawerDemoPage2> {

  ScrollController scrollController;
  ScrollPhysics scrollPhysics;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();

    scrollController.addListener(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: BottomDrawer2(
        drawerHeight: ScreenUtil.height / 2,
        defaultDrawerShowHeight: kToolbarHeight,
        body: ListView.builder(
            controller: scrollController,
            physics: scrollPhysics,
            itemCount: 28,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15),
                height: 50,
                alignment: Alignment.centerLeft,
                width: ScreenUtil.width,
                child: Text('---------------------------body item$index'),
              );
            },
        ),
        drawer: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15),
                height: 50,
                alignment: Alignment.centerLeft,
                width: ScreenUtil.width,
                child: Text('   draw item -- $index'),
              );
            }),
      ),
    );
  }

}
