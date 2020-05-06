import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieCommendProvider extends ViewStateRefreshListProvider {
  MovieCommendProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    String movieId = arguments;
    return await DouBanMovieRepository.getMovieCommendList(
        movieId: movieId, count: pageSize, start: pageSize * pageNum);
  }
}
