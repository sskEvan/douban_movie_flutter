import 'package:douban_movie_flutter/model/staff_detail_vo.dart';
import 'package:douban_movie_flutter/provider/view_state_common_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:flutter/cupertino.dart';

class StaffDetailProvider extends ViewStateCommonProvider {
  StaffDetailVo staffDetailVo;

  StaffDetailProvider(BuildContext context) : super(context);

  @override
  Future loadData(Object arguments) async {
    String id = arguments;
    staffDetailVo  = await DouBanMovieRepository.getStaffDetailVo(id: id);
    return staffDetailVo;
  }

}