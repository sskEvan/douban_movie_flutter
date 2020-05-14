import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget2.dart';
import 'package:douban_movie_flutter/widget/my_sliver_child_builder_delegate.dart';
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
  SliverChildBuilderDelegate drawerDelegate;

  List<int> positions;
  int memoryPosition;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
//      debugPrint(
//          'offset:${scrollController.offset},maxOffset:${scrollController.position.maxScrollExtent},bodyDelegate:${drawerDelegate.childCount}');
    });
  }

  @override
  Widget build(BuildContext context) {
    drawerDelegate = SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        //debugPrint("drawer item builder ---- index=$index");

        if (positions != null) {
          //已经初始化过的话 滑动自行调整头和尾
          if (index > positions.last) {
            positions.removeAt(0);
            positions.add(index);
          } else if (index < positions.first) {
            positions.removeLast();
            positions.insert(0, index);
          }
        } else {
          //记录初始化了多少个Item
          memoryPosition = index;
        }

        if (index == 0) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            height: 50,
            alignment: Alignment.centerLeft,
            width: ScreenUtil.width,
            child: Center(
              child: Text('影评'),
            ),
          );
        } else {
          return Container(
            color: Color(0xcccccccc),
            padding: EdgeInsets.all(15),
            height: 50,
            alignment: Alignment.centerLeft,
            width: ScreenUtil.width,
            child: Text('   影评item -- $index'),
          );
        }
      },
      childCount: 30,
    );

    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: Stack(children: <Widget>[
        CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: MySliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //debugPrint("body item builder ---- index=$index");
                  return Container(
                    padding: EdgeInsets.all(15),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil.width,
                    child: Text('---------------------------body item$index'),
                  );
                },
                childCount: 30,
              ),
            ),
            SliverList(
              delegate: drawerDelegate,
            ),
          ],
        ),
        Offstage(
          offstage: true,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              height: 50,
              alignment: Alignment.centerLeft,
              width: ScreenUtil.width,
              child: Center(
                child: Text('影评'),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
