import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardWeeklyMovieProvider extends ViewStateRefreshListProvider {

  BillboardWeeklyMovieProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({int pageSize, int pageNum}) async {
    return await DouBanMovieRepository.getWeeklyMovieList(count: pageSize, start: pageSize * pageNum);
  }


}