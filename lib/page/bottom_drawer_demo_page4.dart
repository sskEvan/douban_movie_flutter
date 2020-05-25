
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget.dart';
import 'package:douban_movie_flutter/widget/bottom_drawer_widget2.dart';
import 'package:douban_movie_flutter/widget/my_sliver_child_builder_delegate.dart';
import 'package:douban_movie_flutter/widget/over_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';

class BottomDrawerDemoPage4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomDrawerDemoPageState4();
  }
}

class BottomDrawerDemoPageState4 extends State<BottomDrawerDemoPage4>
    with TickerProviderStateMixin {
  ScrollController bodyScrollController;
  ScrollController drawScrollController;
  final GlobalKey bodyFooterKey = GlobalKey();
  double bodyFooterPositionYInScreen;
  double drawerOffset = 0.0;
  double initDrawerOffset = 0.0;
  AnimationController offsetAnimalController;
  Animation<double> offsetAnimation;
  double bodyFooterVisibleThreshold = 0.0;
  double bodyScrollOffset = 0.0;
  double bodyScrollDy = 0.0;
  double drawerScrollOffset = 0.0;
  double drawerScrollDy = 0.0;
  double containHeight;
  bool drawerObsorting = false;
  bool isDrawerMoving = false;

  @override
  void initState() {
    super.initState();
    offsetAnimalController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    bodyScrollController = ScrollController();
    initDrawerOffset =
        drawerOffset = ScreenUtil.height - ScreenUtil.navigationBarHeight - 50;
    bodyFooterVisibleThreshold = ScreenUtil.height - 50;
    containHeight = initDrawerOffset + 50;
//    debugPrint(
//        "!!!!!!!!!!!!!!!!!!!!!initState done,initDrawerOffset=${initDrawerOffset},navigationBarHeight=${ScreenUtil.navigationBarHeight}");
    bodyScrollController.addListener(() {
      bodyScrollDy = bodyScrollController.offset - bodyScrollOffset;
      debugPrint(
          "scrollDy:${bodyScrollDy},bodyScrollOffset=${bodyScrollController.offset}"
              ",drawerOffset=${drawerOffset},initDrawerOffset=${initDrawerOffset}");
      if (bodyFooterKey.currentContext != null &&
          bodyFooterKey.currentContext.findRenderObject() != null) {
        bodyFooterPositionYInScreen = bodyFooterKey.currentContext
            .findRenderObject()
            .getTransformTo(null)
            .getTranslation()
            .y;

        if (bodyFooterVisibleThreshold - bodyFooterPositionYInScreen > 0 && !isDrawerMoving) {
          bodyFooterPositionYInScreen -= bodyScrollDy;
          //container显示在屏幕
          updateDrawerOffset(bodyFooterPositionYInScreen - ScreenUtil.navigationBarHeight);
          setState(() {});
        } else {
          if (drawerOffset != initDrawerOffset && !isDrawerMoving) {
            updateDrawerOffset(initDrawerOffset);
            setState(() {});
          }
          //debugPrint("containerVisiblePosition <= containerGlobalPositionY");
        }
        bodyScrollOffset = bodyScrollController.offset;
      }
    });

    drawScrollController = new ScrollController();
    drawScrollController.addListener(() {
      drawerScrollOffset = drawScrollController.offset;
      debugPrint("^^^^^^^^^^^^^drawerScrollOffset:${drawScrollController.offset}");
    });

  }

  void updateDrawerOffset(double offset) {
    drawerOffset = offset;

    if (drawerOffset < 0) {
      drawerOffset = 0;
    }
    if (drawerOffset > initDrawerOffset) {
      drawerOffset = initDrawerOffset;
    }

    if (drawerOffset == 0) {
      if (drawerObsorting) {
        debugPrint("-------------------------恢复滑动");
        drawerObsorting = false;
      }
    } else {
      if (!drawerObsorting) {
        debugPrint("--------------------------拦截");
        drawerObsorting = true;
      }
    }
  }

  double tempBodyScrollOffset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bottom drawer demo')),
      body: Stack(children: <Widget>[
        ListView.builder(
            cacheExtent: 3000,
            controller: bodyScrollController,
            itemCount: 40,
            itemBuilder: (context, index) {
              if (index < 39) {
                return Container(
                  padding: EdgeInsets.all(15),
                  height: 50,
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil.width,
                  child: Text('---------------------------body item$index'),
                );
              } else {
                return Container(
                  key: bodyFooterKey,
                  height: containHeight,
                );
              }
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Listener(
            onPointerDown: (event) {
              tempBodyScrollOffset = bodyScrollController.offset;

            },
            onPointerMove: (event) {
              if (event.delta.dy != 0 && drawerOffset <= initDrawerOffset) {
                isDrawerMoving = true;
                double newDrawerOffset = drawerOffset + event.delta.dy;
                updateDrawerOffset(newDrawerOffset);

                if(bodyFooterVisibleThreshold - bodyFooterPositionYInScreen > 0) {
                  tempBodyScrollOffset = tempBodyScrollOffset - event.delta.dy;
                  debugPrint('onPointerMove:dy=${event.delta.dy}，drawerOffset=${drawerOffset}'
                      ',tempBodyScrollOffset=${tempBodyScrollOffset},');
                  bodyScrollController.jumpTo(tempBodyScrollOffset);
                }

                setState(() {});
              }
            },
            onPointerUp: (event) {
              isDrawerMoving = false;
              debugPrint(
                  "onPointerUp----containerGlobalPositionY=${bodyFooterPositionYInScreen}");
              if (bodyFooterPositionYInScreen > bodyFooterVisibleThreshold) {
                double start = drawerOffset;
                double end = 0;
                if (drawerOffset >= initDrawerOffset / 2) {
                  //drawer张开高度小于一半
                  end = initDrawerOffset;
                }
                offsetAnimalController.reset();
                final CurvedAnimation curve = CurvedAnimation(
                    parent: offsetAnimalController, curve: Curves.easeOut);
                //debugPrint('--------start:${start},end:${end}');
                offsetAnimation = Tween(begin: start, end: end).animate(curve)
                  ..addListener(() {
                    drawerOffset = offsetAnimation.value;
                    //debugPrint('--------drawerOffset:${drawerOffset}');
                    setState(() {});
                  });

                ///自己滚动
                offsetAnimalController.forward();
              }
            },
            child: Transform.translate(
              offset: Offset(0.0, drawerOffset),
              child: AbsorbPointer(
                  absorbing: drawerObsorting,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
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
                      Expanded(
                        child: ListView.builder(
                            controller: drawScrollController,
                            shrinkWrap: true,
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Color(0xffeeeeee),
                                padding: EdgeInsets.all(15),
                                height: 50,
                                alignment: Alignment.centerLeft,
                                width: ScreenUtil.width,
                                child: Text('   影评item -- $index'),
                              );
                            }),
                      )
                    ],
                  )),
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
              bodyScrollController.jumpTo(bodyScrollController.offset - 40);
              setState(() {});
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 80),
          child: RaisedButton(
            child: Text('上移评论列表'),
            onPressed: () {
//              showToast("上移评论列表");
//              bodyScrollController.jumpTo(bodyScrollController.offset + 40);
//              drawerOffset -= 40;
              if (drawerObsorting) {
                debugPrint("-------------------------恢复滑动");
                drawerObsorting = false;
              }
              setState(() {});
            },
          ),
        ),
      ]),
    );
  }
}
