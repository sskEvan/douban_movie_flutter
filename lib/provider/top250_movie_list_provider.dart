import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieListProvider extends ViewStateRefreshListProvider {

  final bool isShowing;
  MovieListProvider(BuildContext context, {this.isShowing}) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    if(isShowing) {
      return await DouBanMovieRepository.getShowingMovieList(count: pageSize, start: pageSize * pageNum);
    }else {
      return await DouBanMovieRepository.getUpcomingMovieList(count: pageSize, start: pageSize * pageNum);
    }
  }

}