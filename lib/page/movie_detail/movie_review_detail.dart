import 'package:douban_movie_flutter/model/movie_reviews_entity.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieReviewDetailPage extends StatelessWidget {
  MovieReviewsReview movieReviewsReview;

  MovieReviewDetailPage(this.movieReviewsReview);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '影评详情',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movieReviewsReview.title,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 16),
              Text(
                movieReviewsReview.content,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
