import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardListProvider extends ViewStateListProvider {

  BillboardListProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({int count, int start}) async {
    return await DouBanMovieRepository.getTop250(count: 6, start: 0);
  }

}