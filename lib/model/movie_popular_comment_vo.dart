import 'package:flutter/cupertino.dart';

class PopularCommentVo {
  Rating rating;
  int usefulCount;
  Author author;
  String subjectId;
  String content;
  String createdAt;
  String id;

  PopularCommentVo(
      {this.rating,
        this.usefulCount,
        this.author,
        this.subjectId,
        this.content,
        this.createdAt,
        this.id});

  PopularCommentVo.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    usefulCount = json['useful_count'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    subjectId = json['subject_id'];
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['useful_count'] = this.usefulCount;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['subject_id'] = this.subjectId;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Rating {
  int max;
  double value;
  int min;

  Rating({this.max, this.value, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    var tempValue = json['value'];
    debugPrint("------------------tempValue:${tempValue}");
    if(tempValue.runtimeType == int) {
      tempValue = double.parse('${json['value']}');
    }
    value = tempValue;
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['value'] = this.value;
    data['min'] = this.min;
    return data;
  }
}

class Author {
  String uid;
  String avatar;
  String signature;
  String alt;
  String id;
  String name;

  Author({this.uid, this.avatar, this.signature, this.alt, this.id, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    avatar = json['avatar'];
    signature = json['signature'];
    alt = json['alt'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['avatar'] = this.avatar;
    data['signature'] = this.signature;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}