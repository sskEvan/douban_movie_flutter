import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StillsDetailPage extends StatefulWidget{

  MovieStillsPhoto movieStillsPhoto;
  int currentIndex;
  int totalPhotoCount;

  StillsDetailPage(this.movieStillsPhoto, this.currentIndex,
      this.totalPhotoCount);

  @override
  State<StatefulWidget> createState() {
    return StillsDetailState(movieStillsPhoto, currentIndex, totalPhotoCount);
  }
}

class StillsDetailState extends State<StillsDetailPage> {

  MovieStillsPhoto movieStillsPhoto;
  int currentIndex;
  int totalPhotoCount;


  StillsDetailState(this.movieStillsPhoto, this.currentIndex,
      this.totalPhotoCount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            '${currentIndex} / ${totalPhotoCount}',
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Hero(
              tag: 'hero' + movieStillsPhoto.id, //唯一标记，前后两个路由页Hero的tag必须相同
              child: CacheImageWidget(
                url: movieStillsPhoto.image,
              ),
            ),
          ),
        ));
  }

}