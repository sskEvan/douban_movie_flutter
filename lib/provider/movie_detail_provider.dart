import 'package:douban_movie_flutter/model/movie_detail_vo.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieDetailVoProvider extends ViewStateCommonProvider {
  MovieDetailVo movieDetailVo;

  MovieDetailVoProvider(BuildContext context) : super(context);

  @override
  Future loadData(Object arguments) async {
    String movieId = arguments;
    movieDetailVo  = await DouBanMovieRepository.getMovieDetailVo(movieId: movieId);
    return movieDetailVo;
  }

}
