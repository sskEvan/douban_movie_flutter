import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/gesture_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

class StillsDetailPage extends StatefulWidget {
  List<MovieStillsPhoto> movieStillsPhotoList;
  int currentIndex;
  int totalPhotoCount;

  StillsDetailPage(
      this.movieStillsPhotoList, this.currentIndex, this.totalPhotoCount);

  @override
  State<StatefulWidget> createState() {
    return StillsDetailState(
        movieStillsPhotoList, currentIndex, totalPhotoCount);
  }
}

class StillsDetailState extends State<StillsDetailPage>
    with SingleTickerProviderStateMixin {
  List<MovieStillsPhoto> movieStillsPhotoList;
  int currentIndex;
  int totalPhotoCount;
  PageController _controller = new PageController();
  Widget appBar;
  Animation<Offset> appBarPosition;
  Animation<Offset> bottomBarPosition;
  AnimationController animController;
  var onlyShowStills = false;

  StillsDetailState(
      this.movieStillsPhotoList, this.currentIndex, this.totalPhotoCount);

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    appBarPosition =
        Tween(begin: Offset.zero, end: Offset(0, -2)).animate(animController);
    animController.addListener(() {
      debugPrint('animController listener ${appBarPosition.value}');
    });
    animController.addStatusListener((status) {
      print("animController StatusListener status====$status");
    });
  }

  @override
  Widget build(BuildContext context) {
    appBar = SafeArea(
      child: Container(
        color: Colors.black,
        height: kToolbarHeight,
        width: ScreenUtil.width,
        child: SlideTransition(
          position: appBarPosition,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${currentIndex + 1} / ${totalPhotoCount}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        //),
      ),
    );

    _controller = new PageController(
      initialPage: currentIndex,
    );
    return Scaffold(
        //appBar: appBar,
        body: Container(
            color: Colors.black,
            width: ScreenUtil.width,
            height: ScreenUtil.height,
            child: Column(children: <Widget>[
              appBar,
              Container(
                width: ScreenUtil.width,
                height: ScreenUtil.height -
                    kToolbarHeight -
                    ScreenUtil.navigationBarHeight,
                child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: movieStillsPhotoList
                      .map((item) => _buildStillsWidget(item))
                      .toList(),
                ),
              )
            ])));
  }

  @override
  void dispose() {
    animController?.dispose();
    super.dispose();
  }

  Widget _buildStillsWidget(MovieStillsPhoto item) {
    return Center(
      child: Hero(
          tag: 'hero' + item.id, //唯一标记，前后两个路由页Hero的tag必须相同
          child: GestureBox(
            maxScale: 5.0,
            doubleTapScale: 2.0,
            onPressed: () {
              _handleClickStills(context);
            },
            onLongPressed: () {
              _handleLongPressStills(context);
            },
            duration: Duration(milliseconds: 200),
            child: CacheImageWidget(
              url: item.image,
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }

  _handleClickStills(BuildContext context) {
    if (onlyShowStills) {
      animController.reverse();
    } else {
      animController.forward();
    }
    onlyShowStills = !onlyShowStills;
  }

  _handleLongPressStills(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _saveStills();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text(
                    '保存',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text(
                    '取消',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          );
        });
  }

  _saveStills() async {
    requestPermission().then((bool) {
      if (bool) {
        _savenNetworkImage();
      }
    });
  }

  Future<bool> requestPermission() async {
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
    return status.isGranted;
  }

  //保存网络图片到本地
  _savenNetworkImage() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet.
      print('暂无相册权限');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("您当前没有存储文件到本地的权限"),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.of(context).pop(), //关闭对话框
                ),
                FlatButton(
                  child: Text("去开启"),
                  onPressed: () {
                    openAppSettings();
                  },
                ),
              ],
            );
          });

      return;
    }

    var response = await Dio().get(movieStillsPhotoList[currentIndex].image,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    if (result != null) {
      showToast('保存成功');
    } else {
      showToast('保存失败');
    }
  }
}
