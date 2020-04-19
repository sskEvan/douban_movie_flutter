import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';
import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardProvider extends ViewStateRefreshListProvider {

  List<MovieSubject> top250MovieSubjects;

  BillboardBannerEntity weeklyBannerEntity;
  BillboardBannerEntity newMovieBannerEntity;
  BillboardBannerEntity usboxBannerEntity;

  BillboardProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({int pageSize, int pageNum}) async {
    List<Future> futures = [];
    futures.add(DouBanMovieRepository.getTop250MovieList());
    futures.add(DouBanMovieRepository.getWeeklyMovieEntity());
    futures.add(DouBanMovieRepository.getNewMovieEntity());
    futures.add(DouBanMovieRepository.getUsBoxMovieEntity());

    var result = await Future.wait(futures);
    top250MovieSubjects = result[0];
    WeeklyMovieEntity weeklyMovieEntity = result[1];
    NewMovieEntity newMovieEntity = result[2];
    UsboxMovieEntity usboxMovieEntity = result[3];

    var weeklyMovieSubjects = <MovieSubject>[];
    weeklyMovieEntity.subjects.forEach((it) {
      weeklyMovieSubjects.add(it.subject);
    });
    List<MovieSubject> newMovieSubjects = newMovieEntity.subjects;
    var usboxMovieSubjects = <MovieSubject>[];
    usboxMovieEntity.subjects.forEach((it) {
      usboxMovieSubjects.add(it.subject);
    });

    weeklyBannerEntity = BillboardBannerEntity(
        title: weeklyMovieEntity.title,
        movieSubjects: weeklyMovieSubjects,
        routerName: RouteName.billboardWeekly);

    newMovieBannerEntity = BillboardBannerEntity(
        title: usboxMovieEntity.title,
        movieSubjects: newMovieSubjects,
        routerName: RouteName.billboardUsBox);

    usboxBannerEntity = BillboardBannerEntity(
        title: newMovieEntity.title,
        movieSubjects: usboxMovieSubjects,
        routerName: RouteName.billboardNewMovies);

    return result[0];
  }

}

class BillboardBannerEntity {
  final String title;
  final List<MovieSubject> movieSubjects;
  final String routerName;

  BillboardBannerEntity({this.title, this.movieSubjects, this.routerName});
}