import 'package:douban_movie_flutter/model/celebrity_works_vo.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class CelebrityWorksProvider extends ViewStateRefreshListProvider {

  CelebrityWorksVo celebrityVo;

  CelebrityWorksProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    String id = arguments;
    celebrityVo = await DouBanMovieRepository.getCelebrityWorksVo(
        id: id, count: pageSize, start: pageSize * pageNum);
    List<MovieItemVo> movieItemVoList = new List<MovieItemVo>();
    celebrityVo.works.forEach((it) {
      movieItemVoList.add(it.movieItemVo);
    });
    return movieItemVoList;
  }

}