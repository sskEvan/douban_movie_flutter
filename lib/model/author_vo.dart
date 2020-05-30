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