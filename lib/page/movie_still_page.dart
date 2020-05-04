import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/provider/movie_stills_provider.dart';
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

class MovieStillPage extends StatefulWidget {
  String movieId;
  int totalPhotoCount;

  MovieStillPage(this.movieId, this.totalPhotoCount);

  @override
  State<StatefulWidget> createState() {
    return MovieStillState(movieId, totalPhotoCount);
  }
}

class MovieStillState extends State<MovieStillPage> {
  String movieId;
  int totalPhotoCount;

  MovieStillState(this.movieId, this.totalPhotoCount);

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
            body: ViewStateWidget<MovieStillsProvider>(
              provider: MovieStillsProvider(context),
              onProviderReady: (provider) async {
                await provider.initData([movieId, totalPhotoCount]);
              },
              builder: (context, MovieStillsProvider provider, child) {
                if (provider.isBusy) {
                  return CommonLoadingWidget();
                } else if (provider.isEmpty) {
                  return CommonEmptyWidget(
                      onPressed: provider.initData([movieId, totalPhotoCount]));
                } else if (provider.isError) {
                  return CommonErrorWidget(
                      error: provider.viewStateError,
                      onPressed: provider.initData([movieId, totalPhotoCount]));
                }

                return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: provider.movieStillsEntity.photos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, //横轴三个子widget
                          childAspectRatio: 1,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3),
                      itemBuilder: (context, index) {
                        MovieStillsPhoto item = provider.movieStillsEntity.photos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(RouteName.movieStillsDetail,
                                arguments: [provider.movieStillsEntity.photos, index, provider.movieStillsEntity.photos.length]);
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
