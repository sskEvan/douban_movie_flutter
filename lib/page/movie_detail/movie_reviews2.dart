import 'package:douban_movie_flutter/model/movie_reviews_entity.dart';
import 'package:douban_movie_flutter/provider/movie_reviews_provider.dart';
import 'package:douban_movie_flutter/service/provider_manager.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_drag_widget.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieReviewsWidget2 extends StatefulWidget {
  var movieId;
  ScrollController scrollController;

  MovieReviewsWidget2(this.movieId, this.scrollController);

  @override
  State<StatefulWidget> createState() {
    return MovieReviewsState2(movieId, scrollController);
  }
}

class MovieReviewsState2 extends State<MovieReviewsWidget2> {
  var movieId;
  ScrollController scrollController;

  MovieReviewsState2(this.movieId, this.scrollController);

  @override
  Widget build(BuildContext context) {
    //debugPrint("!!!!MovieReviewsWidget build done ");

    return ViewStateWidget<MovieReviewsProvider>(
        provider: MovieReviewsProvider(context),
        onProviderReady: (provider) async {
          //debugPrint("!!!!MovieReviewsWidget onProviderReady ..........................");
          await provider.initData(arguments: movieId);
        },
        builder: (context, MovieReviewsProvider provider, child) {
          if (provider.isBusy) {
            return CommonLoadingWidget();
          } else if (provider.isEmpty) {
            return CommonEmptyWidget(onPressed: provider.initData);
          } else if (provider.isError) {
            return CommonErrorWidget(
                error: provider.viewStateError, onPressed: provider.initData);
          }
          return _buildReviewsContent(provider);
        });
  }

  Widget _buildReviewsContent(MovieReviewsProvider provider) {
    return SmartRefresher(
          controller: provider.refreshController,
          footer: ClassicFooter(),
          enablePullDown: false,
          onLoading: provider.loadMore,
          enablePullUp: true,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.list.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCommendItem(context, provider.list[index]);
              }),
        );
  }

  Widget _buildCommendItem(
      BuildContext context, MovieReviewsReview movieReviewsReview) {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.movieReviewDetail,
                  arguments: movieReviewsReview);
            },
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CacheImageWidget(
                          url: movieReviewsReview.author.avatar,
                          radius: 12,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 8),
                          Text(
                            movieReviewsReview.author.name,
                            style:
                                TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '看过',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45),
                          ),
                          SizedBox(width: 5),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: StaticRatingBar(
                              rate: movieReviewsReview.rating.value / 2,
                              size: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: ScreenUtil.width,
                    child: Text(
                      movieReviewsReview.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movieReviewsReview.summary,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '${movieReviewsReview.usefulCount}有用 · ',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      Text(
                        '${movieReviewsReview.commentsCount}回复 · ',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(height: 8, color: Color(0xFFFAFAFA))
      ],
    );
  }
}
