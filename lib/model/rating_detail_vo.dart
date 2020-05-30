import 'package:flutter/cupertino.dart';

class RatingDetailVo {
  int max;
  double average;
  Details details;
  String stars;
  int min;

  RatingDetailVo({this.max, this.average, this.details, this.stars, this.min});

  RatingDetailVo.fromJson(Map<String, dynamic> json) {
    if(json != null) {
      max = json['max'];
      var tempAverage = json['average'];
      if(tempAverage.runtimeType == int) {
        tempAverage = double.parse('${json['average']}');
      }
      average = tempAverage;
      details =
      json['details'] != null ? new Details.fromJson(json['details']) : null;
      stars = json['stars'];
      min = json['min'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['average'] = this.average;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['stars'] = this.stars;
    data['min'] = this.min;
    return data;
  }
}

class Details {
  double i1;
  double i2;
  double i3;
  double i4;
  double i5;

  Details({this.i1, this.i2, this.i3, this.i4, this.i5});

  Details.fromJson(Map<String, dynamic> json) {
    i1 = typeWrapper(json['1']);
    i2 = typeWrapper(json['2']);
    i3 = typeWrapper(json['3']);
    i4 = typeWrapper(json['4']);
    i5 = typeWrapper(json['5']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    return data;
  }

  double typeWrapper(jsonData) {
    if(jsonData.runtimeType == int) {
      return double.parse('${jsonData}');
    }else {
      return jsonData;
    }
  }
}