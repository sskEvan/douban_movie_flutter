import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/gesture_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StillsDetailPage extends StatefulWidget {
  List<MovieStillsPhoto> movieStillsPhotoList;
  int currentIndex;
  int totalPhotoCount;

  StillsDetailPage(this.movieStillsPhotoList, this.currentIndex,
      this.totalPhotoCount);

  @override
  State<StatefulWidget> createState() {
    return StillsDetailState(
        movieStillsPhotoList, currentIndex, totalPhotoCount);
  }
}

class StillsDetailState extends State<StillsDetailPage> {
  List<MovieStillsPhoto> movieStillsPhotoList;
  int currentIndex;
  int totalPhotoCount;
  PageController _controller = new PageController();

  StillsDetailState(this.movieStillsPhotoList, this.currentIndex,
      this.totalPhotoCount);

  @override
  Widget build(BuildContext context) {
    _controller = new PageController(
      initialPage: currentIndex,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            '${currentIndex + 1} / ${totalPhotoCount}',
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          width: ScreenUtil.width,
          child: PageView(
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: movieStillsPhotoList
                .map((item) => _buildStillsWidget(item))
                .toList(),
          ),
        ));
  }

  Widget _buildStillsWidget(MovieStillsPhoto item) {
    return Center(
      child: Hero(
          tag: 'hero' + item.id, //唯一标记，前后两个路由页Hero的tag必须相同
          child: GestureBox(
            maxScale: 5.0,
            doubleTapScale: 2.0,
            duration: Duration(milliseconds: 200),
            child: CacheImageWidget(
              url: item.image,
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}
