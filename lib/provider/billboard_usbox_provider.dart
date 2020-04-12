import 'package:douban_movie_flutter/provider/vew_state_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardUsBox extends ViewStateListProvider {

  BillboardUsBox(BuildContext context) : super(context);

  @override
  Future<List> loadData({int count, int start}) async {
    return await DouBanMovieRepository.getUsBox(count: 6, start: 0);
  }

}