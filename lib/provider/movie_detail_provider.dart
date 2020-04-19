import 'package:douban_movie_flutter/model/movie_detail_entity.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieDetailProvider extends ViewStateCommonProvider {
  MovieDetailEntity movieDetailEntity;

  MovieDetailProvider(BuildContext context) : super(context);

  @override
  Future loadData(Object arguments) async {
    String movieId = arguments;
    movieDetailEntity  = await DouBanMovieRepository.getMovieDetailEntity(movieId: movieId);
    return movieDetailEntity;
  }

}
