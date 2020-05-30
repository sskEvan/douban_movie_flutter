class VideoVo {
  Source source;
  String sampleLink;
  String videoId;
  bool needPay;

  VideoVo({this.source, this.sampleLink, this.videoId, this.needPay});

  VideoVo.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    sampleLink = json['sample_link'];
    videoId = json['video_id'];
    needPay = json['need_pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['sample_link'] = this.sampleLink;
    data['video_id'] = this.videoId;
    data['need_pay'] = this.needPay;
    return data;
  }
}

class Source {
  String literal;
  String pic;
  String name;

  Source({this.literal, this.pic, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    literal = json['literal'];
    pic = json['pic'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['literal'] = this.literal;
    data['pic'] = this.pic;
    data['name'] = this.name;
    return data;
  }
}