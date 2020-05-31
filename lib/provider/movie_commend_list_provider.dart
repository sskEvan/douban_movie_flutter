import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieCommendListProvider extends ViewStateRefreshListProvider {
  MovieCommendListProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    String movieId = arguments;
    return await DouBanMovieRepository.getMovieCommendListVo(
        movieId: movieId, count: pageSize, start: pageSize * pageNum);
  }
}
