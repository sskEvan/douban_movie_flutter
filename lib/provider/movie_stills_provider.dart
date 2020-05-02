import 'package:douban_movie_flutter/model/movie_stills_entity.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieStillsProvider extends ViewStateCommonProvider {

  MovieStillsEntity movieStillsEntity;

  MovieStillsProvider(BuildContext context) : super(context);

  @override
  Future loadData(Object arguments) async {
    List arg = arguments;
    String movieId = arg[0];
    int totalPhotoCount = arg[1];
    movieStillsEntity =  await DouBanMovieRepository.getMovieStillsList(movieId: movieId, count: totalPhotoCount, start: 0);
    return movieStillsEntity;
  }

}