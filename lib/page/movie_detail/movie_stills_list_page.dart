import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/provider/movie_stills_list_provider.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 电影剧照列表页
 */
class MovieStillsListPage extends StatefulWidget {
  String movieId;
  int totalPhotoCount;

  MovieStillsListPage(this.movieId, this.totalPhotoCount,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieStillsListState();
  }
}

class _MovieStillsListState extends State<MovieStillsListPage> {

  _MovieStillsListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              title: Text(
                '全部剧照',
                style: TextStyle(color: Colors.black87),
              ),
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black87),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: ViewStateWidget<MovieStillsListProvider>(
              provider: MovieStillsListProvider(context),
              onProviderReady: (provider) async {
                await provider.initData([widget.movieId, widget.totalPhotoCount]);
              },
              builder: (context, MovieStillsListProvider provider, child) {
                if (provider.isBusy) {
                  return CommonLoadingWidget();
                } else if (provider.isEmpty) {
                  return CommonEmptyWidget(
                      onPressed: provider.initData([widget.movieId, widget.totalPhotoCount]));
                } else if (provider.isError) {
                  return CommonErrorWidget(
                      error: provider.viewStateError,
                      onPressed: provider.initData([widget.movieId, widget.totalPhotoCount]));
                }

                return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: provider.moviePhotoDetailListVo.photos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, //横轴三个子widget
                          childAspectRatio: 1,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3),
                      itemBuilder: (context, index) {
                        PhotoDetailInfo item = provider.moviePhotoDetailListVo.photos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(RouteName.movieStillsDetail,
                                arguments: [provider.moviePhotoDetailListVo.photos, index, provider.moviePhotoDetailListVo.photos.length]);
                          },
                          child: Hero(
                            tag: 'hero' + item.id ,
                            child: CacheImageWidget(
                              url: item.image,
                            ),
                          ),
                        );
                      },
                );
              },
            ));
  }
}
