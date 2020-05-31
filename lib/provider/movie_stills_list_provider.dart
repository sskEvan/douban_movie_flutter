import 'package:douban_movie_flutter/model/photo_detail_list_vo.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieStillsListProvider extends ViewStateCommonProvider {

  PhotoDetailListVo moviePhotoDetailListVo;

  MovieStillsListProvider(BuildContext context) : super(context);

  @override
  Future loadData(Object arguments) async {
    List arg = arguments;
    String movieId = arg[0];
    int totalPhotoCount = arg[1];
    moviePhotoDetailListVo =  await DouBanMovieRepository.getMoviePhotoDetailListVo(movieId: movieId, count: totalPhotoCount, start: 0);
    return moviePhotoDetailListVo;
  }

}