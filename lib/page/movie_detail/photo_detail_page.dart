import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/gesture_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

/**
 * 电影剧照详情页
 */
class PhotoDetailPage extends StatefulWidget {
  List<PhotoDetailInfo> photoDetailList;
  int currentIndex;

  PhotoDetailPage(this.photoDetailList, this.currentIndex, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PhotoDetailState();
  }
}

class _PhotoDetailState extends State<PhotoDetailPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = new PageController();
  Widget _appBar;
  Animation<Offset> _appBarPosition;
  AnimationController _animController;
  var _onlyShowStills = false;

  _PhotoDetailState();

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _appBarPosition =
        Tween(begin: Offset.zero, end: Offset(0, -2)).animate(_animController);
    _animController.addListener(() {
      debugPrint('animController listener ${_appBarPosition.value}');
    });
    _animController.addStatusListener((status) {
      print("animController StatusListener status====$status");
    });
  }

  @override
  Widget build(BuildContext context) {
    _appBar = SafeArea(
      child: Container(
        color: Colors.black,
        height: kToolbarHeight,
        width: ScreenUtil.width,
        child: SlideTransition(
          position: _appBarPosition,
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
                '${widget.currentIndex + 1} / ${widget.photoDetailList.length}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        //),
      ),
    );

    _pageController = new PageController(
      initialPage: widget.currentIndex,
    );
    return Scaffold(
        //appBar: appBar,
        body: Container(
            color: Colors.black,
            width: ScreenUtil.width,
            height: ScreenUtil.height,
            child: Column(children: <Widget>[
              _appBar,
              Container(
                width: ScreenUtil.width,
                height: ScreenUtil.height -
                    kToolbarHeight -
                    ScreenUtil.navigationBarHeight,
                child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      widget.currentIndex = index;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  children: widget.photoDetailList
                      .map((item) => _buildStillsWidget(item))
                      .toList(),
                ),
              )
            ])));
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _animController?.dispose();
    super.dispose();
  }

  Widget _buildStillsWidget(PhotoDetailInfo item) {
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
    if (_onlyShowStills) {
      _animController.reverse();
    } else {
      _animController.forward();
    }
    _onlyShowStills = !_onlyShowStills;
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
                  child: Text(
                    DouBanLocalizations.of(context).save,
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
                  child: Text(
                    DouBanLocalizations.of(context).cancel,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          );
        });
  }

  _saveStills() async {
    _requestPermission().then((bool) {
      if (bool) {
        _savenNetworkImage();
      }
    });
  }

  Future<bool> _requestPermission() async {
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
              title: Text(DouBanLocalizations.of(context).tip),
              content: Text(DouBanLocalizations.of(context).no_storage_permission_tip),
              actions: <Widget>[
                FlatButton(
                  child: Text(DouBanLocalizations.of(context).cancel),
                  onPressed: () => Navigator.of(context).pop(), //关闭对话框
                ),
                FlatButton(
                  child: Text(DouBanLocalizations.of(context).go_to_open),
                  onPressed: () {
                    openAppSettings();
                  },
                ),
              ],
            );
          });

      return;
    }

    var response = await Dio().get(
        widget.photoDetailList[widget.currentIndex].image,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    if (result != null) {
      showToast(DouBanLocalizations.of(context).save_success);
    } else {
      showToast(DouBanLocalizations.of(context).save_failed);
    }
  }
}
