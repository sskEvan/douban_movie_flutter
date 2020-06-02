import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 榜单标题栏组件
 */
class CommonSection extends StatelessWidget {
  final String title;
  String action;
  Color backgroundColor;
  EdgeInsetsGeometry padding;
  TextStyle titleStyle;
  TextStyle actionStyle;
  VoidCallback onTap;

  CommonSection(
      {this.title,
      this.action,
      this.backgroundColor,
      this.padding,
      this.titleStyle,
      this.actionStyle,
      this.onTap,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: padding ?? EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            Offstage(
              offstage: action == null,
              child: Material(
                  color: backgroundColor,
                  child: InkWell(
                    onTap: onTap,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          action ?? '',
                          style: actionStyle,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: actionStyle.fontSize,
                          color: actionStyle.color,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
