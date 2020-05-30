import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillboardBanner extends StatelessWidget {
  final String title;
  final List<MovieItemVo> movieItemVos;
  final String routerName;

  BillboardBanner({this.title, this.movieItemVos, this.routerName});

  @override
  Widget build(BuildContext context) {
    final height = 190.0;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routerName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: ScreenUtil.width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        movieItemVos[0].images.medium),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.2),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: ScreenUtil.width,
                  height: height * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Center(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return _buildMovieInfoItem(index, movieItemVos[index]);
                        },
                        itemCount: 3),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfoItem(int index, MovieItemVo movieItemVo) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '${index + 1}. ${movieItemVo.title}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 15),
            Text(
              '${movieItemVo.rating.average}',
              style: TextStyle(
                color: Color(0xFFD7B018),
                fontSize: 14,
              ),
            )
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
