import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 通用正在加载数据组件
 */
class CommonLoadingWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeHelper.wrapDarkBackgroundColor(context, Colors.white),
      alignment: Alignment.center,
      child:  CircularProgressIndicator(
          backgroundColor: Color(0xAAEEEEEE),
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xAACCCCCC))),
    );
  }

  CommonLoadingWidget({Key key}) : super(key : key);
}
