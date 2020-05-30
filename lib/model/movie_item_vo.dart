import 'cast_vo.dart';
import 'director_vo.dart';
import 'image_vo.dart';
import 'rating_detail_vo.dart';

class MovieItemVo {
  List<String> genres;
  String title;
  List<String> durations;
  int collectCount;
  String mainlandPubdate;
  bool hasVideo;
  String originalTitle;
  String subtype;
  List<String> pubdates;
  String year;
  String alt;
  String id;
  RatingDetailVo rating;
  ImageVo images;
  List<CastVo> casts;
  List<DirectorVo> directors;

  MovieItemVo(
      this.genres,
      this.title,
      this.durations,
      this.collectCount,
      this.mainlandPubdate,
      this.hasVideo,
      this.originalTitle,
      this.subtype,
      this.pubdates,
      this.year,
      this.alt,
      this.id,
      this.rating,
      this.images,
      this.casts,
      this.directors);

  MovieItemVo.fromJson(Map<String, dynamic> json) {
    if(json['genres'] != null) {
      genres = json['genres'].cast<String>();
    }
    title = json['title'];
    if(json['durations'] != null) {
      durations = json['durations'].cast<String>();
    }
    collectCount = json['collect_count'];
    mainlandPubdate = json['mainland_pubdate'];
    hasVideo = json['has_video'];
    originalTitle = json['original_title'];
    subtype = json['subtype'];
    if(json['durations'] != null) {
      pubdates = json['durations'].cast<String>();
    }
    year = json['year'];
    alt = json['alt'];
    id = json['id'];
    rating = RatingDetailVo.fromJson(json['rating']);
    images = ImageVo.fromJson(json['images']);

    if(json['casts'] != null) {
      List<CastVo> castData = [];
      for (var i = 0; i < json['casts'].length; i++) {
        castData.add(CastVo.fromJson(json['casts'][i]));
      }
      casts = castData;
    }

    if(json['directors'] != null) {
      List<DirectorVo> directorData = [];
      for (var i = 0; i < json['directors'].length; i++) {
        directorData.add(DirectorVo.fromJson(json['directors'][i]));
      }
      directors = directorData;
    }

  }
}
