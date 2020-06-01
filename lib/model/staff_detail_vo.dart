import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/photo_vo.dart';

import 'avatars_vo.dart';

class StaffDetailVo {
  String website;
  String mobileUrl;
  List<String> akaEn;
  String name;
  String nameEn;
  String gender;
  List<String> professions;
  Avatars avatars;
  String summary;
  String birthday;
  List<String> aka;
  String alt;
  String bornPlace;
  String constellation;
  String id;
  List<PhotoVo> photos;
  List<StaffDetailWorkVo> works;

  StaffDetailVo(
      {this.website,
        this.mobileUrl,
        this.akaEn,
        this.name,
        this.nameEn,
        this.gender,
        this.professions,
        this.avatars,
        this.summary,
        this.birthday,
        this.aka,
        this.alt,
        this.bornPlace,
        this.constellation,
        this.id,
        this.photos,
      this.works});

  StaffDetailVo.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    mobileUrl = json['mobile_url'];
    akaEn = json['aka_en'].cast<String>();
    name = json['name'];
    nameEn = json['name_en'];
    gender = json['gender'];
    professions = json['professions'].cast<String>();
    avatars =
    json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    summary = json['summary'];
    birthday = json['birthday'];
    aka = json['aka'].cast<String>();
    alt = json['alt'];
    bornPlace = json['born_place'];
    constellation = json['constellation'];
    id = json['id'];
    if (json['photos'] != null) {
      photos = new List<PhotoVo>();
      json['photos'].forEach((v) {
        photos.add(new PhotoVo.fromJson(v));
      });
    }
    if (json['works'] != null) {
      works = new List<StaffDetailWorkVo>();
      json['works'].forEach((v) {
        works.add(new StaffDetailWorkVo.fromJson(v));
      });
    }
  }
}


class StaffDetailWorkVo {
  List<String> roles;
  MovieItemVo movieItemVo;

  StaffDetailWorkVo({this.roles, this.movieItemVo});

  StaffDetailWorkVo.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    movieItemVo =
    json['subject'] != null ? new MovieItemVo.fromJson(json['subject']) : null;
  }

}