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

class BottomDrawerDemoPageState3 extends State<BottomDrawerDemoPage3>
    with TickerProviderStateMixin {
  ScrollController scrollController;

  List<int> positions;
  int memoryPosition;
  final GlobalKey listViewKey = GlobalKey();
  bool offstageBottomTitle = false;
  bool offstageTopTitle = true;
  double drawerOffset = 0.0;
  AnimationController offsetAnimalController;
  Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    debugPrint("!!!!!!!!!!!!!!!!!!!!!initState done");
    offsetAnimalController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    scrollController = ScrollController();
    scrollController.addListener(() {
//      debugPrint("offset：${scrollController.positions.elementAt(0).pixels},"
//          "maxOffset:${scrollController.positions.elementAt(0).maxScrollExtent},"
//          "drawerOffset:${drawerOffset}");

      if (listViewKey.currentContext != null &&
          listViewKey.currentContext.findRenderObject() != null) {
        double listViewGlobalPositionY = listViewKey.currentContext
            .findRenderObject()
            .getTransformTo(null)
            .getTranslation()
            .y;

        if (listViewGlobalPositionY <= ScreenUtil.navigationBarHeight + 50) {
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

      if (scrollController.positions.elementAt(0).pixels >
          scrollController.positions.elementAt(0).maxScrollExtent +
              drawerOffset) {
//        scrollController.animateTo(
//            scrollController.positions.elementAt(0).maxScrollExtent +
//                drawerOffset,
//            duration: Duration(milliseconds: 200),
//            curve: Curves.easeOut);
        debugPrint(
            "-----scrollController jumpto ${scrollController.positions.elementAt(0).maxScrollExtent + drawerOffset}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: Stack(children: <Widget>[
        ListView.builder(
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
                        controller: scrollController,
                        itemCount: 30,
                        itemBuilder: (context, index) {
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
                        }));
              }
            }),
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
          child: Listener(
              onPointerMove: (event) {
                debugPrint('onPointerMove:dy=${event.delta.dy}');
                if (event.delta.dy != 0) {
                  drawerOffset += event.delta.dy;
                  if (drawerOffset < 0) {
                    drawerOffset = 0;
                  }
                  if (drawerOffset >
                      -ScreenUtil.height + ScreenUtil.navigationBarHeight) {
                    drawerOffset =
                        -ScreenUtil.height + ScreenUtil.navigationBarHeight;
                  }
                  setState(() {});
                }
              },
              onPointerUp: (event) {
                double start = drawerOffset;
                double end = 0;
                if (drawerOffset <= -ScreenUtil.height / 2) {
                  //drawer张开高度小于一半
                  end = -ScreenUtil.height + ScreenUtil.navigationBarHeight;
                }
                offsetAnimalController.reset();
                final CurvedAnimation curve = CurvedAnimation(
                    parent: offsetAnimalController, curve: Curves.easeOut);
                debugPrint('--------start:${start},end:${end}');
                offsetAnimation = Tween(begin: start, end: end).animate(curve)
                  ..addListener(() {
                    drawerOffset = offsetAnimation.value;
                    debugPrint('--------drawerOffset:${drawerOffset}');
                    setState(() {});
                  });

                ///自己滚动
                offsetAnimalController.forward();
              },
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
              )),
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
              drawerOffset -= 1500;
//              listViewKey.currentContext
//                  .findRenderObject()
//                  .getTransformTo(null)
//                  .getTranslation()
//                  .y -= 40;
              setState(() {});
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 140),
            child: ReorderableListView(

            ),
//          child: RaisedButton(
//            child: Text('禁止滑动'),
//            onPressed: () {
//              showToast("禁止滑动");
//              //scrollPhysics = NeverScrollableScrollPhysics();
//              setState(() {});
//            },
//          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          child: RaisedButton(
            child: Text('恢复滑动'),
            onPressed: () {
              showToast("恢复滑动");
              //scrollPhysics = ClampingScrollPhysics();
              setState(() {});
            },
          ),
        )
      ]),
    );
  }
}
