import 'package:douban_movie_flutter/model/movie_item_vo.dart';

import 'author_vo.dart';

class PhotoDetailListVo {
  int count;
  List<PhotoDetailInfo> photos;
  MovieItemVo movieItemVo;
  int total;
  int start;

  PhotoDetailListVo({this.count, this.photos, this.movieItemVo, this.total, this.start});

  PhotoDetailListVo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if(json['subject'] != null) {
      movieItemVo = MovieItemVo.fromJson(json['subject']);
    }
    if (json['photos'] != null) {
      photos = new List<PhotoDetailInfo>();
      json['photos'].forEach((v) {
        photos.add(new PhotoDetailInfo.fromJson(v));
      });
    }
    total = json['total'];
    start = json['start'];
  }

}

class PhotoDetailInfo {
  int photosCount;
  String thumb;
  String icon;
  Author author;
  String createdAt;
  String albumId;
  String cover;
  String id;
  String prevPhoto;
  String albumUrl;
  int commentsCount;
  String image;
  int recsCount;
  int position;
  String alt;
  String albumTitle;
  String nextPhoto;
  String subjectId;
  String desc;

  PhotoDetailInfo(
      {this.photosCount,
        this.thumb,
        this.icon,
        this.author,
        this.createdAt,
        this.albumId,
        this.cover,
        this.id,
        this.prevPhoto,
        this.albumUrl,
        this.commentsCount,
        this.image,
        this.recsCount,
        this.position,
        this.alt,
        this.albumTitle,
        this.nextPhoto,
        this.subjectId,
        this.desc});

  PhotoDetailInfo.fromJson(Map<String, dynamic> json) {
    photosCount = json['photos_count'];
    thumb = json['thumb'];
    icon = json['icon'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    createdAt = json['created_at'];
    albumId = json['album_id'];
    cover = json['cover'];
    id = json['id'];
    prevPhoto = json['prev_photo'];
    albumUrl = json['album_url'];
    commentsCount = json['comments_count'];
    image = json['image'];
    recsCount = json['recs_count'];
    position = json['position'];
    alt = json['alt'];
    albumTitle = json['album_title'];
    nextPhoto = json['next_photo'];
    subjectId = json['subject_id'];
    desc = json['desc'];
  }
}
