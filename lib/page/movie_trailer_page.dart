import 'package:chewie/chewie.dart';
import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieTrailerPage extends StatefulWidget {
  MovieDetailTrailer movieDetailTrailer;

  MovieTrailerPage(this.movieDetailTrailer);

  @override
  State<StatefulWidget> createState() {
    return MovieTrailerState(movieDetailTrailer);
  }
}

class MovieTrailerState extends State<MovieTrailerPage> {
  MovieDetailTrailer movieDetailTrailer;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  MovieTrailerState(this.movieDetailTrailer);

  @override
  void initState() {
    super.initState();
    //配置视频地址
    videoPlayerController =
        VideoPlayerController.network(movieDetailTrailer.resourceUrl);
    chewieController = ChewieController(
      placeholder: SizedBox(
        width: ScreenUtil.width,
        height: ScreenUtil.width * 2 / 3,
        child: CacheImageWidget(
          url: movieDetailTrailer.medium,
        ),
      ),
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2, //宽高比
      autoPlay: true, //自动播放
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            '${movieDetailTrailer.title}',
            style: TextStyle(color: Colors.white),
          )),
      body: Container(
          alignment: Alignment.center,
          color: Colors.black,
          height: ScreenUtil.height,
          child:  Chewie(
              controller: chewieController,
            ),
          ),
    );
  }

  @override
  void dispose() {
    /**
     * 当页面销毁的时候，将视频播放器也销毁
     * 否则，当页面销毁后会继续播放视频！
     */
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
