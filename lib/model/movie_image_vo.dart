class ImageVo {
  String small;
  String large;
  String medium;

  ImageVo({this.small, this.large, this.medium});

  ImageVo.fromJson(Map<String, dynamic> json) {
    if(json != null) {
      small = json['small'];
      large = json['large'];
      medium = json['medium'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}