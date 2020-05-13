import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget.dart';
import 'package:douban_movie_flutter/widget/over_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomDrawerDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerDemoPageState();
  }
}

class BottomDrawerDemoPageState extends State<BottomDrawerDemoPage> {

  ScrollController scrollController;
  ScrollPhysics scrollPhysics;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();

    scrollController.addListener(() {
//      if (lastOffset != scrollController.offset) {
////        debugPrint(
////            "!!!!!!!!!!!!!!!!!scrollController.offset;${scrollController.offset - lastOffset}");
//        lastOffset = scrollController.offset;
//      }
//      debugPrint('########scrollController.offset=${scrollController.offset}');
//      if (scrollController.offset > 100) {
//        scrollPhysics = NeverScrollableScrollPhysics();
//
////        setState(() {
////
////        });
//        //debugPrint('##################scrollController 禁止listview滑动');
//
//      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: BottomDrawer(
        drawerHeight: ScreenUtil.height - ScreenUtil.navigationBarHeight,
        defaultDrawerShowHeight: kToolbarHeight,
        bodyScrollController: scrollController,
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
        requestInterceptBodyScroll: () {
          scrollPhysics = NeverScrollableScrollPhysics();
          debugPrint('!!!!!!!!!!!!!!!!!!requestInterceptBodyScroll done');
          setState(() {

          });
        },
        requestAllowBodyScroll: () {
          scrollPhysics = ClampingScrollPhysics();
          debugPrint('!!!!!!!!!!!!!!!!!!requestAllowBodyScroll done');
          setState(() {

          });
        },
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
