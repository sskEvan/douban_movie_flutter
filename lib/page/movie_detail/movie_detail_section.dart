import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailSection extends StatelessWidget {
  String actionText;
  String title;

  MovieDetailSection({this.actionText, this.title});

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
        Container(
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
            ))
      ],
    );
  }
}