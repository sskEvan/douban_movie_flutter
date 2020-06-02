import 'package:douban_movie_flutter/model/work_vo.dart';

class CelebrityWorksVo {
  int count;
  int start;
  int total;
  List<WorkVo> works;

  CelebrityWorksVo({this.count, this.start, this.total, this.works});

  CelebrityWorksVo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];

    if (json['works'] != null) {
      works = new List<WorkVo>();
      json['works'].forEach((v) {
        works.add(new WorkVo.fromJson(v));
      });
    }
  }

}
