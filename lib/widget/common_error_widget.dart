import 'package:douban_movie_flutter/model/view_state.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String message;
  final ViewStateError error;

  CommonErrorWidget(
      {Key key, @required this.error, this.onPressed, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, -0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ImageHelper.wrapAssets('error.png'),
            width: 100,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
            child: Text(
              message ?? error == ViewStateErrorType.defaultError ? "加载出错～请重试" : "网络不给力～请检查网络设置",
              style: TextStyle(color: Colors.black38, fontSize: 16),
            ),
          ),
          OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                  '刷新',
              style: TextStyle(
                fontSize: 16
              ),),
              onPressed: onPressed,
              textColor: Theme.of(context).primaryColor,
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ],
      ),
    );
  }
}
