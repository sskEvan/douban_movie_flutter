import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/showing_movie.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'skeleton.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieSubject movieSubject;
  final bool isShowing;

  MovieItemWidget({this.isShowing, this.movieSubject})
      : super(key: ValueKey(movieSubject.id));

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('----------item click');
        },
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
                  _buildMovieInfo(context),
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

  Widget _buildMovieInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildMovieTitle(),
          SizedBox(height: 5),
          _buildMovieScore(context),
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
        ));
  }

  Widget _buildMovieTitle() {
    return Text(
      movieSubject.title,
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildMovieScore(BuildContext context) {
    if (movieSubject.rating.average > 0) {
      return Row(
        children: <Widget>[
          StaticRatingBar(
            rate: movieSubject.rating.average / 2,
            size: 13,
          ),
          SizedBox(width: 5),
          Text('${movieSubject.rating.average}',
              style: TextStyle(color: Colors.black45, fontSize: 13))
        ],
      );
    } else {
      return Text(DouBanLocalizations.of(context).no_scare,
          style: TextStyle(color: Colors.black45, fontSize: 13));
    }
  }

  Widget _buildMovieTag() {
    return Text(
      '${movieSubject.year} / ${_genres2String(movieSubject.genres)} /${_durings2String(movieSubject.durations)} '
      '/${_directors2String(movieSubject.directors)} /${_cases2String(movieSubject.casts)}',
      style: TextStyle(color: Colors.black45, fontSize: 13),
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
    );
  }

  Widget _buildTicketPurchase(BuildContext context) {
    if (isShowing) {
      return Container(
        height: 120,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              splashColor: Colors.redAccent,
              onTap: () {
                print('------------------------点击购票');
                showToast(
                  '购票',
                  context: context,
                );
              },
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
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
    } else {
      return Container(
        height: 120,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(ImageHelper.wrapAssets('want_to_see.png'),
                width: 20, height: 20),
            Text(
              DouBanLocalizations.of(context).want_to_see,
              style: TextStyle(fontSize: 14, color: Color(0xFFD7B018)),
            ),
            SizedBox(height: 8),
            Text(
              '${movieSubject.collectCount}${DouBanLocalizations.of(context).want_to_see}',
              style: TextStyle(color: Colors.black45, fontSize: 12),
            ),
          ],
        ),
      );
    }
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
