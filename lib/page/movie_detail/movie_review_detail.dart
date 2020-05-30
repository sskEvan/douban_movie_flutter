import 'package:douban_movie_flutter/model/reviews_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MovieReviewDetailPage extends StatefulWidget {
  ReviewsVo reviewsVo;

  MovieReviewDetailPage(this.reviewsVo);

  @override
  State<StatefulWidget> createState() {
    return MovieReviewDetailState();
  }
}

class MovieReviewDetailState extends State<MovieReviewDetailPage> {
  ScrollController scrollController;
  int offsetLimit;
  bool offstageAutorInfo;
  bool offstageTitle;

  MovieReviewDetailState();

  @override
  void initState() {
    super.initState();
    offsetLimit = 110;
    offstageAutorInfo = true;
    offstageTitle = false;
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > offsetLimit) {
        if (offstageAutorInfo) {
          offstageAutorInfo = false;
          offstageTitle = true;
          setState(() {});
        }
      } else {
        if (!offstageAutorInfo) {
          offstageAutorInfo = true;
          offstageTitle = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 1,
          title: Stack(
            children: <Widget>[
              Offstage(
                offstage: offstageTitle,
                child: Text(
                  '影评详情',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Offstage(
                offstage: offstageAutorInfo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CacheImageWidget(
                            url: widget.reviewsVo.author.avatar,
                            radius: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          widget.reviewsVo.author.name,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 78,
                      height: 30,
                      margin: EdgeInsets.only(right: 10),
                      child: RaisedButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                        label: Text(
                          "关注",
                          style: TextStyle(color: Colors.white,
                              fontSize: 14),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          showToast("关注${widget.reviewsVo.author.name}",
                              context: context);
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
      body: Container(
        color: Colors.white,
        height: ScreenUtil.height,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.reviewsVo.title,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CacheImageWidget(
                      url: widget.reviewsVo.author.avatar,
                      radius: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.reviewsVo.author.name} 的影评',
                        style: TextStyle(color: Colors.black45, fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.reviewsVo.createdAt}',
                        style: TextStyle(color: Colors.black45, fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.reviewsVo.content,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
