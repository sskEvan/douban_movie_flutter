import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieListProvider extends ViewStateRefreshListProvider {

  final bool isShowing;
  MovieListProvider(BuildContext context, {this.isShowing}) : super(context);

  @override
  Future<List> loadData({int pageNum}) async{
    if(isShowing) {
      return await DouBanMovieRepository.getShowingMovies(count: 10, start: 0);
    }else {
      return await DouBanMovieRepository.getUpcomingMovies(count: 10, start: 0);
    }
  }

}