import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'bottom_drag_widget.dart';
import 'over_scroll_behaviour.dart';

/**
 * 底部抽屉,主要试下功能
 * 1.drawer可以默认显示defaultDrawerShowHeight高度在屏幕上  DONE
 * 2.点击显示在屏幕defaultDrawerShowHeight的内容时,自动展开抽屉  DONE
 * 2.用户上滑body,body到底部的时候,如果继续上滑,drawer和body都会同时上滑;
 *  当drawer在屏幕上显示到高度为drawerHeight时,drawer里面的内容可以跟着上滑;
 *  当drawer内容显示一半时，用户停止滑动并再次下滑body或者drawer,drawer和body同时下滑,当drawer在屏幕上显示到高度为defaultDrawerShowHeight时,只有body内容下滑
 * 3.drawer上滑的时候,上滑超过一半drawerHeight时手指离开,自动完全显示,否则自动收回,下滑滑超过一半drawerHeight时手指离开,自动收回,否则自动展开
 *   drawer上滑到屏幕上显示到高度为drawerHeight时,drawer里面的内容可以跟着上滑;
 */
class BottomDrawer2 extends StatefulWidget {
  final Widget body;
  final Widget drawer;
  final double drawerHeight;
  double defaultDrawerShowHeight = 0;

  BottomDrawer2({
    Key key,
    @required this.body,
    @required this.drawer,
    @required this.drawerHeight,
    this.defaultDrawerShowHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerState2();
  }
}

class BottomDrawerState2 extends State<BottomDrawer2> {
  double bodyOffset;
  double lastBodyOffset;
  double drawerOffset;
  double lastDrawerOffset;
  double drawerInitOffset;
  bool bodyAbsorbing;
  bool lastBodyAbsorbing;
  bool bodyOverscrollUp;
  ListView testListView;
  ScrollPhysics bodyScrollPhysics;
  bool showBodyTranslateLayer;

  @override
  void initState() {
    super.initState();
    lastBodyOffset = bodyOffset = 0;
    drawerInitOffset = widget.drawerHeight - widget.defaultDrawerShowHeight;
    lastDrawerOffset = drawerOffset = drawerInitOffset;
    lastBodyAbsorbing = bodyAbsorbing = false;
    bodyOverscrollUp = false;
    showBodyTranslateLayer = false;
    debugPrint('-------------initPointerMoveEvent:bodyOffset=${bodyOffset},'
        'drawerOffset=${drawerOffset},drawerInitOffset=${drawerInitOffset},'
        'drawerHeight=${widget.drawerHeight},defaultDrawerShowHeight=${widget.defaultDrawerShowHeight}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, bodyOffset),
          child: NotificationListener<ScrollStartNotification>(
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (ScrollUpdateNotification notification) {
                //body已经滑动到底部了,要拦截body滑动
                if (notification.dragDetails != null) {
                  //body滑动到底部
                  if (showBodyTranslateLayer) {
                    debugPrint(
                        '--------------ScrollUpdateNotification1--drawerOffset:${drawerOffset},bodyOffset:${bodyOffset}'
                            ' dy${notification.dragDetails.delta.dy},');
                    //drawer张开一半
                    if (drawerOffset < drawerInitOffset) {
                      debugPrint("updateBodyAndDrawOffset 1");
                      updateBodyAndDrawOffset(notification.dragDetails.delta.dy);
                    } else if (drawerOffset == drawerInitOffset) {
                      //drawer收起
                      if (notification.dragDetails.delta.dy <= 0) {
                        //向上滑动
                        debugPrint("updateBodyAndDrawOffset 2");
                        updateBodyAndDrawOffset(notification.dragDetails.delta.dy);
                      } else {
                        //向下滑动
                        //body恢复滚动
                        showBodyTranslateLayer = false;
                        setState(() {

                        });
                      }
                    }
                  }
                }
              },
              child: NotificationListener<OverscrollNotification>(
                  child: Listener(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: widget.defaultDrawerShowHeight),
                      child: ScrollConfiguration(
                          behavior: OverScrollBehavior(),
                          child: Stack(
                            children: <Widget>[
                              widget.body,
                              Offstage(
                                offstage: !showBodyTranslateLayer,
                                child: Container(
                                  color: Color(0xaaeeeeee),
                                ),
                              )
                            ],
                          )),
                    ),
                    onPointerMove: (PointerMoveEvent event) {

                    },
                  ),
                  onNotification: (OverscrollNotification notification) {
                    if(showBodyTranslateLayer != true) {
                      showBodyTranslateLayer = true;
                      setState(() {

                      });
                    }
                    //body到达边界,并且向上滑动
                    if (notification.dragDetails != null) {
                      if (notification.dragDetails.delta.dy < 0) {
                        bodyOverscrollUp = true;
                        updateBodyAndDrawOffset(
                            notification.dragDetails.delta.dy);
                      }
                    }
                    return false;
                  }),
            ),
          ),
        ),
        //),
        Transform.translate(
          offset: Offset(0.0, drawerOffset),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: <Widget>[
                Container(
                  color: Colors.grey,
                  height: widget.drawerHeight,
                  child: Listener(
                      child: widget.drawer,
                      onPointerMove: (PointerMoveEvent event) {
                        updateDrawerOffset(event.delta.dy);
                      }),
                ),
                Offstage(
                  offstage: drawerOffset != drawerInitOffset,
                  child: GestureDetector(
                      onTap: () {
                        lastBodyOffset = drawerOffset = 0;
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: widget.drawerHeight -
                            widget.defaultDrawerShowHeight,
                      )),
                )
              ])),
        )
      ],
    );
  }

  void updateBodyAndDrawOffset(double offset) {
    bodyOffset += offset;
    bodyOffset = (bodyOffset >= 0 ? 0 : bodyOffset);
    bodyOffset =
        (bodyOffset <= -drawerInitOffset ? -drawerInitOffset : bodyOffset);

    drawerOffset += offset;
    drawerOffset = (drawerOffset < 0 ? 0 : drawerOffset);
    drawerOffset =
        (drawerOffset >= drawerInitOffset ? drawerInitOffset : drawerOffset);

    if (lastBodyOffset != bodyOffset || lastDrawerOffset != drawerOffset) {
      lastBodyOffset = bodyOffset;
      lastDrawerOffset = drawerOffset;
      setState(() {});
    }
  }

  void updateDrawerOffset(double offset) {
    drawerOffset += offset;
    drawerOffset = (drawerOffset < 0 ? 0 : drawerOffset);
    drawerOffset =
        (drawerOffset >= drawerInitOffset ? drawerInitOffset : drawerOffset);

    if (lastDrawerOffset != drawerOffset) {
      lastBodyOffset = bodyOffset;
      lastDrawerOffset = drawerOffset;
      setState(() {});
    }
  }
}

class MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  final FlingListener flingListener;

  /// Create a gesture recognizer for interactions in the vertical axis.
  MyVerticalDragGestureRecognizer({Object debugOwner, this.flingListener})
      : super(debugOwner: debugOwner);

  final Map<int, VelocityTracker> _velocityTrackers = <int, VelocityTracker>{};

  @override
  void handleEvent(PointerEvent event) {
    super.handleEvent(event);
    if (!event.synthesized &&
        (event is PointerDownEvent || event is PointerMoveEvent)) {
      final VelocityTracker tracker = _velocityTrackers[event.pointer];
      assert(tracker != null);
      tracker.addPosition(event.timeStamp, event.position);
    }
  }

  @override
  void addPointer(PointerEvent event) {
    super.addPointer(event);
    _velocityTrackers[event.pointer] = VelocityTracker();
  }

  ///来检测是否是fling
  @override
  void didStopTrackingLastPointer(int pointer) {
    final double minVelocity = minFlingVelocity ?? kMinFlingVelocity;
    final double minDistance = minFlingDistance ?? kTouchSlop;
    final VelocityTracker tracker = _velocityTrackers[pointer];

    ///VelocityEstimate 计算二维速度的
    final VelocityEstimate estimate = tracker.getVelocityEstimate();
    bool isFling = false;
    if (estimate != null && estimate.pixelsPerSecond != null) {
      isFling = estimate.pixelsPerSecond.dy.abs() > minVelocity &&
          estimate.offset.dy.abs() > minDistance;
    }
    _velocityTrackers.clear();
    if (flingListener != null) {
      flingListener(isFling);
    }

    ///super.didStopTrackingLastPointer(pointer) 会调用[_handleDragEnd]
    ///所以将[lingListener(isFling);]放在前一步调用
    super.didStopTrackingLastPointer(pointer);
  }

  @override
  void dispose() {
    _velocityTrackers.clear();
    super.dispose();
  }
}
