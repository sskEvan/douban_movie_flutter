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
class BottomDrawer extends StatefulWidget {
  final Widget body;
  final Widget drawer;
  final double drawerHeight;
  double defaultDrawerShowHeight = 0;
  VoidCallback requestInterceptBodyScroll;
  VoidCallback requestAllowBodyScroll;
  ScrollController bodyScrollController;

  BottomDrawer(
      {Key key,
      @required this.body,
      @required this.drawer,
      @required this.drawerHeight,
      this.defaultDrawerShowHeight,
      this.requestInterceptBodyScroll,
      this.requestAllowBodyScroll,
      this.bodyScrollController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomDrawerState();
  }
}

class BottomDrawerState extends State<BottomDrawer>
    with TickerProviderStateMixin {
  double bodyOffset;
  double bodyContentScrollOffset;
  double lastBodyOffset;
  double drawerOffset;
  double lastDrawerOffset;
  double drawerInitOffset;
  bool bodyAbsorbing;
  bool lastBodyAbsorbing;
  bool bodyOverscrollUp;
  bool showDrawerTranslateLayer;
  ScrollPhysics bodyScrollPhysics;
  AnimationController offsetAnimalController;
  Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    bodyContentScrollOffset = lastBodyOffset = bodyOffset = 0;
    drawerInitOffset = widget.drawerHeight - widget.defaultDrawerShowHeight;
    lastDrawerOffset = drawerOffset = drawerInitOffset;
    lastBodyAbsorbing = bodyAbsorbing = false;
    bodyOverscrollUp = false;
    showDrawerTranslateLayer = false;
    debugPrint('-------------initPointerMoveEvent:bodyOffset=${bodyOffset},'
        'drawerOffset=${drawerOffset},drawerInitOffset=${drawerInitOffset},'
        'drawerHeight=${widget.drawerHeight},defaultDrawerShowHeight=${widget.defaultDrawerShowHeight}');
    widget.bodyScrollController.addListener(() {
      bodyContentScrollOffset = widget.bodyScrollController.offset;
    });
    offsetAnimalController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, bodyOffset),
          child: NotificationListener<ScrollStartNotification>(
            child: NotificationListener<OverscrollNotification>(
                child: Listener(
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: widget.defaultDrawerShowHeight),
                    child: ScrollConfiguration(
                        behavior: OverScrollBehavior(), child: widget.body),
                  ),
                  onPointerMove: (PointerMoveEvent event) {
                    debugPrint(
                        "------timeStamp=${event.timeStamp},offset=${event.delta.dy}");
                    //body已经滑动到底部了,要拦截body滑动
                    if (event.delta.dy != null) {
//                      debugPrint(
//                          '--------------ScrollUpdateNotification1--drawerOffset:${drawerOffset},bodyOffset:${bodyOffset}'
//                          ' dy${event.delta.dy},'
//                          'bodyContentScrollOffset=$bodyContentScrollOffset,');
                      //body滑动到底部
                      if (bodyContentScrollOffset ==
                          widget
                              .bodyScrollController.position.maxScrollExtent) {
                        //请求body拦截滑动
                        if (bodyAbsorbing != true) {
                          bodyAbsorbing = true;
                          widget.requestInterceptBodyScroll();
                          debugPrint("请求body拦截滑动");
                        }

                        //drawer张开一半
                        if (drawerOffset < drawerInitOffset) {
                          debugPrint("updateBodyAndDrawOffset 1");
                          updateBodyAndDrawOffset(event.delta.dy);
                        } else if (drawerOffset == drawerInitOffset) {
                          //drawer收起
                          if (event.delta.dy <= 0) {
                            //向上滑动
                            debugPrint("updateBodyAndDrawOffset 2");
                            updateBodyAndDrawOffset(event.delta.dy);
                          } else {
                            //向下滑动
                            //body恢复滚动
                            if (bodyAbsorbing == true) {
                              bodyAbsorbing = false;
                              widget.requestAllowBodyScroll();
                              debugPrint("body恢复滚动");
                            }
                          }
                        }
                      }
                    }
                  },

                  onPointerUp: (PointerUpEvent event) {
//                    bool show = drawerOffset != 0;
                    if(drawerOffset != 0  && drawerOffset > drawerInitOffset) {
                      showDrawerTranslateLayer = false;
                      setState(() {

                      });
                    }
                  },
                ),
                onNotification: (OverscrollNotification notification) {
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
        //),
        Transform.translate(
          offset: Offset(0.0, drawerOffset),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Listener(
                      onPointerMove: (PointerMoveEvent event) {
                        if(event.delta.dy < 0) {  //上滑,并且drawer张开一半
                          if(!showDrawerTranslateLayer) {
                            showDrawerTranslateLayer = true;
                            setState(() {
                              debugPrint('---------showDrawerTranslateLayer = true');
                            });
                          }
                        }
                        updateDrawerOffsetWhenScrollDrawer(event.delta.dy);
                      },
                      onPointerUp: (PointerUpEvent event) {
                        if(drawerOffset != 0 && drawerOffset > drawerInitOffset) {
                          showDrawerTranslateLayer = false;
                          setState(() {

                          });
                        }
                        handleDrawerPointerUp();
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: widget.drawerHeight,
                          child: widget.drawer,
                        ),
                        Offstage(
                          offstage: drawerOffset == 0 || !showDrawerTranslateLayer,
                          child: Container(
                            color: Colors.transparent,
                            height: widget.drawerHeight,
                          ),
                        ),
                        Offstage(
                          offstage: drawerOffset != drawerInitOffset,
                          child: GestureDetector(
                              onTap: () {
                                openDrawer();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: widget.defaultDrawerShowHeight,
                              )),
                        ),
                      ])),
                ],
              )),
        )
      ],
    );
  }

  void openDrawer() {
    offsetAnimalController.reset();
    final CurvedAnimation curve = CurvedAnimation(
        parent: offsetAnimalController, curve: Curves.easeOut);
    offsetAnimation = Tween(begin: drawerInitOffset, end: 0.0).animate(curve)
      ..addListener(() {
        drawerOffset = offsetAnimation.value;
        debugPrint('--------drawerOffset:${drawerOffset}');
        setState(() {});
      });

    ///自己滚动
    offsetAnimalController.forward();
  }

  void handleDrawerPointerUp() {
    debugPrint('--------handleDrawerPointerUp,bodyOffset:${bodyOffset}');
    if (bodyOffset == 0) {
      double start = drawerOffset;
      double end = 0;
      if (drawerOffset >= widget.drawerHeight / 2) {
        //drawer张开高度小于一半
        end = drawerInitOffset;
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
    }else {
      showDrawerTranslateLayer = false;
      setState(() {

      });
    }
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

  void updateDrawerOffsetWhenScrollDrawer(double offset) {
    if (bodyOffset == 0) {
      drawerOffset += offset;
      drawerOffset = (drawerOffset < 0 ? 0 : drawerOffset);
      drawerOffset =
          (drawerOffset >= drawerInitOffset ? drawerInitOffset : drawerOffset);

      if (lastDrawerOffset != drawerOffset) {
        lastDrawerOffset = drawerOffset;
        setState(() {});
      }
    } else {
      updateBodyAndDrawOffset(offset);
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
