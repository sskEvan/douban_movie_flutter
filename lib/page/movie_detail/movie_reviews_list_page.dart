import 'package:douban_movie_flutter/model/reviews_vo.dart';
import 'package:douban_movie_flutter/provider/movie_reviews_list_provider.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 影评列表页
 */
class MovieReviewsListPage extends StatefulWidget {
  var movieId;
  DrawerScrollListener scrollListener;

  MovieReviewsListPage(this.movieId, this.scrollListener,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieReviewsListState();
  }
}

class _MovieReviewsListState extends State<MovieReviewsListPage> {
  ScrollController _scrollController;
  _MovieReviewsListState();

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if(widget.scrollListener != null) {
        widget.scrollListener(_scrollController.offset);
      }
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget<MovieReviewsListProvider>(
        provider: MovieReviewsListProvider(context),
        onProviderReady: (provider) async {
          await provider.initData(arguments: widget.movieId);
        },
        builder: (context, MovieReviewsListProvider provider, child) {
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

  Widget _buildReviewsContent(MovieReviewsListProvider provider) {
    return Container(
        color: Colors.white,
        child: RepaintBoundary(
            child: SmartRefresher(
          controller: provider.refreshController,
          footer: ClassicFooter(),
          enablePullDown: false,
          onLoading: provider.loadMore,
          enablePullUp: true,
          child: ListView.builder(
              controller: _scrollController,
              addRepaintBoundaries: true,
              itemCount: provider.list.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCommendItem(context, provider.list[index]);
              }),
        )));
  }

  Widget _buildCommendItem(
      BuildContext context, ReviewsVo reviewsVo) {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.movieReviewDetailPage,
                  arguments: reviewsVo);
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
                          url: reviewsVo.author.avatar,
                          radius: 12,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 8),
                          Text(
                            reviewsVo.author.name,
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
                              rate: reviewsVo.rating.value / 2,
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
                      reviewsVo.title,
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
                    reviewsVo.summary,
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
                        '${reviewsVo.usefulCount}有用 · ',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      Text(
                        '${reviewsVo.commentsCount}回复 · ',
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

typedef DrawerScrollListener = void Function(double offset);

