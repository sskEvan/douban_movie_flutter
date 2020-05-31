import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 电影详情页通用标题栏组件
 */
class MovieDetailSectionWidget extends StatelessWidget {
  String actionText;
  String title;
  final VoidCallback onAction;

  MovieDetailSectionWidget(
      {this.actionText: '', this.title, this.onAction, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Offstage(
            offstage: actionText.isEmpty,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onAction,
              child: Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    actionText,
                    style: TextStyle(
                        color: Color(0xAAFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xAAFFFFFF),
                    size: 14,
                  )
                ],
              )),
            ))
      ],
    );
  }
}
