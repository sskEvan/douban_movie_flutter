
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieReviewsListProvider extends ViewStateRefreshListProvider {

  MovieReviewsListProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    String movieId = arguments;
    return await DouBanMovieRepository.getMovieReviewsListVo(movieId : movieId, count: pageSize, start: pageSize * pageNum);
  }

}