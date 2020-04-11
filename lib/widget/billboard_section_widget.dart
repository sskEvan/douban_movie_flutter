import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillboardSection extends StatelessWidget {
  final String title;
  String action;
  VoidCallback onTap;

  BillboardSection({this.title, this.action, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7),
      child: Padding(
      padding: EdgeInsets.fromLTRB(15, 8, 5, 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Offstage(
            offstage: action == null,
            child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        action ?? '',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.black87,
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ),);
  }
}
