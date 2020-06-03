import 'package:chewie/chewie.dart';
import 'package:douban_movie_flutter/model/trailer_vo.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/**
 * 电影预告片页面
 */
class MovieTrailerPage extends StatefulWidget {
  TrailerVo trailerVo;

  MovieTrailerPage(this.trailerVo, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieTrailerState();
  }
}

class _MovieTrailerState extends State<MovieTrailerPage> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  _MovieTrailerState();

  @override
  void initState() {
    super.initState();
    //配置视频地址
    _videoPlayerController =
        VideoPlayerController.network(widget.trailerVo.resourceUrl);
    _chewieController = ChewieController(
      placeholder: CacheImageWidget(
          url: widget.trailerVo.medium,
          width: ScreenUtil.width,
          height: ScreenUtil.width * 2 / 3,
      ),
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2, //宽高比
      autoPlay: true, //自动播放
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            '${widget.trailerVo.title}',
            style: TextStyle(color: Colors.white),
          )),
      body: Container(
          alignment: Alignment.center,
          color: Colors.black,
          height: ScreenUtil.height,
          child:  Chewie(
              controller: _chewieController,
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
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
