class TrailerVo {
  String medium;
  String title;
  String subjectId;
  String alt;
  String small;
  String resourceUrl;
  String id;

  TrailerVo(
      {this.medium,
        this.title,
        this.subjectId,
        this.alt,
        this.small,
        this.resourceUrl,
        this.id});

  TrailerVo.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    title = json['title'];
    subjectId = json['subject_id'];
    alt = json['alt'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['title'] = this.title;
    data['subject_id'] = this.subjectId;
    data['alt'] = this.alt;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['id'] = this.id;
    return data;
  }
}