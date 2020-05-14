import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget2.dart';
import 'package:douban_movie_flutter/widget/my_sliver_child_builder_delegate.dart';
import 'package:douban_movie_flutter/widget/over_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';

class BottomDrawerDemoPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomDrawerDemoPageState3();
  }
}

class BottomDrawerDemoPageState3 extends State<BottomDrawerDemoPage3> {
  ScrollController scrollController;

  List<int> positions;
  int memoryPosition;
  final GlobalKey listViewKey = GlobalKey();
  bool offstageBottomTitle = false;
  bool offstageTopTitle = true;
  double drawerOffset = 0.0;
  ScrollPhysics scrollPhysics;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollPhysics = ClampingScrollPhysics();

//    scrollController.addListener(() {
//      debugPrint(
   //       'offset:${scrollController.positions.elementAt(0).pixels}');
//      if (scrollController.positions.elementAt(0).pixels >=
//          scrollController.positions.elementAt(0).maxScrollExtent +
//              drawerOffset) {
//        //scrollController.jumpTo(scrollController.positions.elementAt(0).maxScrollExtent + drawerOffset);
//        if (!(scrollPhysics is NeverScrollableScrollPhysics)) {
//          scrollPhysics = NeverScrollableScrollPhysics();
//          setState(() {});
//        }
//      } else {
//        if (scrollPhysics is NeverScrollableScrollPhysics) {
//          scrollPhysics = ClampingScrollPhysics();
//          setState(() {});
//        }
//      }
 //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: Stack(children: <Widget>[
        NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                if (positions == null) {
                  positions = new List();
                  for (int i = 0; i <= memoryPosition; i++) {
                    positions.add(i);
                  }
                }
              } else if (notification is ScrollUpdateNotification) {
                if (listViewKey.currentContext != null &&
                    listViewKey.currentContext.findRenderObject() != null) {
                  double listViewGlobalPositionY = listViewKey.currentContext
                      .findRenderObject()
                      .getTransformTo(null)
                      .getTranslation()
                      .y;
                  if(notification.dragDetails != null) {
//                    debugPrint("dy=${notification.dragDetails.delta.dy}"
//                        ",offset=${scrollController.positions.elementAt(0).pixels},"
//                        "临界值=${scrollController.positions.elementAt(0).maxScrollExtent + drawerOffset}"
//                        "screenHeight=${ScreenUtil.height}");

                    if (scrollController.positions.elementAt(0).pixels >=
                        scrollController.positions.elementAt(0).maxScrollExtent + drawerOffset
                        && notification.dragDetails.delta.dy < 0) {  //向上滑
                      //scrollController.jumpTo(scrollController.positions.elementAt(0).maxScrollExtent + drawerOffset);
                      debugPrint("禁止滑动");
                      if (!(scrollPhysics is NeverScrollableScrollPhysics)) {
                        scrollPhysics = NeverScrollableScrollPhysics();
                        setState(() {});
                      }
                    } else {
                      if (scrollPhysics is NeverScrollableScrollPhysics) {
                        debugPrint("恢复滑动");
                        scrollPhysics = ClampingScrollPhysics();
                        setState(() {});
                      }
                    }

                  }


                  if (listViewGlobalPositionY <=
                      ScreenUtil.navigationBarHeight + 50) {
                    if (offstageTopTitle != false) {
                      debugPrint("显示顶部标题");
                      offstageTopTitle = false;
                      setState(() {});
                    }
                  } else if (offstageTopTitle != true) {
                    debugPrint("隐藏顶部标题");
                    offstageTopTitle = true;
                    setState(() {});
                  }

                  if (listViewGlobalPositionY <= ScreenUtil.height - 50) {
                    //影评列表滑动已经现在在界面上,并且标题已经全部显示出来
                    //隐藏底部标题
                    if (offstageBottomTitle != true) {
                      debugPrint("隐藏底部标题");
                      offstageBottomTitle = true;
                      setState(() {});
                    }
                  } else {
                    //显示底部标题
                    if (offstageBottomTitle == true) {
                      debugPrint("显示底部标题");
                      offstageBottomTitle = false;
                      setState(() {});
                    }
                  }
                }
              }
            },
            child: ListView.builder(
                physics: scrollPhysics,
                controller: scrollController,
                itemCount: 30,
                itemBuilder: (context, index) {
                  //根据positions==null来判断是否已经初始化
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

                  if (index < 29) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil.width,
                      child: Text('---------------------------body item$index'),
                    );
                  } else {
                    return Transform.translate(
                        offset: Offset(0.0, drawerOffset),
                        child: ListView.builder(
                            key: listViewKey,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            controller: scrollController,
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight:
                                              const Radius.circular(10.0))),
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
                            }));
                  }
                })),
        Offstage(
          offstage: offstageTopTitle,
          child: Align(
            alignment: Alignment.topCenter,
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
        ),
        Offstage(
          offstage: offstageBottomTitle,
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
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            child: Text('下移评论列表'),
            onPressed: () {
              showToast("下移评论列表");
              drawerOffset += 40;
              setState(() {});
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 80),
          child: RaisedButton(
            child: Text('上移评论列表'),
            onPressed: () {
              showToast("上移评论列表");
              drawerOffset -= 40;
              setState(() {});
            },
          ),
        )
      ]),
    );
  }
}
