import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xFFF7F7F7),
            ),
            child: TextField(
              autofocus: false,
              minLines: 1,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: '请输入搜索内容',
                contentPadding: EdgeInsets.all(0),
                icon: Icon(Icons.search),
                alignLabelWithHint: true,
                helperStyle: TextStyle(fontSize: 16),

                //打开enabledBorder focusedBorde: 为了让文本居中
                enabledBorder: OutlineInputBorder(
                  /*边角*/
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.transparent, //边线颜色为白色
                    width: 1, //边线宽度为2
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent, //边框颜色为白色
                    width: 1, //宽度为5
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              style: TextStyle(
                fontSize: 16,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          flex: 1,
        ),
        Offstage(
          offstage: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: new Text("取消",
                style: new TextStyle(fontSize: 16, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
