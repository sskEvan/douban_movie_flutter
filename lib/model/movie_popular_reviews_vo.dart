class PopularReviewsVo {
  Rating rating;
  String title;
  String subjectId;
  Author author;
  String summary;
  String alt;
  String id;

  PopularReviewsVo(
      {this.rating,
        this.title,
        this.subjectId,
        this.author,
        this.summary,
        this.alt,
        this.id});

  PopularReviewsVo.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    title = json['title'];
    subjectId = json['subject_id'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    summary = json['summary'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['title'] = this.title;
    data['subject_id'] = this.subjectId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['summary'] = this.summary;
    data['alt'] = this.alt;
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