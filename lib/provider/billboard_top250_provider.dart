import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardTop250Provider extends ViewStateRefreshListProvider {

  BillboardTop250Provider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    return await DouBanMovieRepository.getTop250MovieList(count: pageSize, start: pageSize * pageNum);
  }


}