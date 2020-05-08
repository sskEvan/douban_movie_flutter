import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MovieReviewsWidget extends StatefulWidget {

  MovieReviewsWidget();

  @override
  State<StatefulWidget> createState() {
    return MovieReviewsState();
  }
}

class MovieReviewsState extends State<MovieReviewsWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
              width: ScreenUtil.width,
              padding: EdgeInsets.all(5),
              height: kToolbarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Text(
                      '影评',
                      style: TextStyle(color: Colors.black45, fontSize: 16),
                    ),
                  )
                ],
              )),
          Expanded(
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        showToast("点击影评${index}");
                      },
                      child: Text('影评内容$index'));
                }),
          )
        ],
    );
  }


}
