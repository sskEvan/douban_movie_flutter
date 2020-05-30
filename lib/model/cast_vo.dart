import 'avatars_vo.dart';

class CastVo {
  Avatars avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  CastVo({this.avatars, this.nameEn, this.name, this.alt, this.id});

  CastVo.fromJson(Map<String, dynamic> json) {
    avatars =
    json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

