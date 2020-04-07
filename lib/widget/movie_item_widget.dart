
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/showing_movie.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/material.dart';

import 'skeleton.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieSubject movieSubject;

  MovieItemWidget({this.movieSubject}) : super(key: ValueKey(movieSubject.id));

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildMoviePoster(),
                  SizedBox(width: 10),
                  _buildMovieInfo(),
                  SizedBox(width: 10),
                  _buildDottedLine(),
                  SizedBox(width: 10),
                  _buildTicketPurchase(context)
                ],
              ),
            ),
            Divider(height: 1)
          ],
        ));
  }

  Widget _buildMoviePoster() {
    return SizedBox(
      width: 90,
      height: 120,
      child: CacheImageWidget(
        url: movieSubject.images.small,
        radius: 5,
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildMovieTitle(),
          SizedBox(height: 5),
          _buildMovieScore(),
          SizedBox(height: 5),
          _buildMovieTag()
        ],
      ),
    );
  }

  Widget _buildDottedLine() {
    return Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
            Container(
              width: 1,
              height: 10,
            ),
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
            Container(
              width: 1,
              height: 10,
            ),
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
            Container(
              width: 1,
              height: 10,
            ),
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
            Container(
              width: 1,
              height: 10,
            ),
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
            Container(
              width: 1,
              height: 10,
            ),
            Container(
              width: 1,
              height: 10,
              color: Colors.black12,
            ),
          ],
        )
    );
  }

  Widget _buildMovieTitle() {
    return Text(
      movieSubject.title,
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMovieScore() {
    return Text(
      '暂无评分',
      style: TextStyle(color: Colors.black45, fontSize: 13),
    );
  }

  Widget _buildMovieTag() {
    return Text(
      '${movieSubject.year} / ${_genres2String(
          movieSubject.genres)} /${_durings2String(movieSubject.durations)} '
          '/${_directors2String(movieSubject.directors)} /${_cases2String(movieSubject.casts)}',
      style: TextStyle(color: Colors.black45, fontSize: 13),
    );
  }

  Widget _buildTicketPurchase(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
            child: Text(
              DouBanLocalizations.of(context).buy,
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: new Border.all(width: 1, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '${movieSubject.collectCount}${DouBanLocalizations.of(context).seen}',
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _genres2String(List genres) {
    StringBuffer sb = new StringBuffer();
    genres.forEach((it) {
      sb.write(' $it ');
    });
    return sb.toString();
  }

  String _cases2String(List<MovieSubjectsCast> casts) {
    StringBuffer sb = new StringBuffer();
    casts.forEach((it) {
      sb.write(' ${it.name} ');
    });
    return sb.toString();
  }

  String _directors2String(List<MovieSubjectsDirector> directors) {
    StringBuffer sb = new StringBuffer();
    directors.forEach((it) {
      sb.write(' ${it.name} ');
    });
    return sb.toString();
  }

  String _durings2String(List durings) {
    StringBuffer sb = new StringBuffer();
    durings.forEach((it) {
      sb.write(' $it ');
    });
    return sb.toString();
  }
  
}