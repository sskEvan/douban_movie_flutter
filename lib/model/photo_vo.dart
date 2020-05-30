class PhotoVo {
  String thumb;
  String image;
  String cover;
  String alt;
  String id;
  String icon;

  PhotoVo({this.thumb, this.image, this.cover, this.alt, this.id, this.icon});

  PhotoVo.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    image = json['image'];
    cover = json['cover'];
    alt = json['alt'];
    id = json['id'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['image'] = this.image;
    data['cover'] = this.cover;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['icon'] = this.icon;
    return data;
  }
}