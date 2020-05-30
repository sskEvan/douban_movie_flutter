import 'package:douban_movie_flutter/model/clip_vo.dart';
import 'package:douban_movie_flutter/model/image_vo.dart';

import 'blooper_vo.dart';
import 'cast_vo.dart';
import 'director_vo.dart';
import 'photo_vo.dart';
import 'popular_comment_vo.dart';
import 'popular_reviews_vo.dart';
import 'rating_detail_vo.dart';
import 'trailer_vo.dart';
import 'video_vo.dart';
import 'writer_vo.dart';

class MovieDetailVo {
  int reviewsCount;
  int wishCount;
  String originalTitle;
  int collectCount;
  String doubanSite;
  String year;
  String alt;
  String id;
  String mobileUrl;
  int photosCount;
  String pubdate;
  String title;
  Null doCount;
  bool hasVideo;
  String shareUrl;
  Null seasonsCount;
  List<String> languages;
  String scheduleUrl;
  List<String> pubdates;
  String website;
  List<String> tags;
  bool hasSchedule;
  List<String> durations;
  List<String> genres;
  Null collection;
  Null episodesCount;
  List<String> trailerUrls;
  bool hasTicket;
  List<String> clipUrls;
  Null currentSeason;
  List<String> countries;
  String mainlandPubdate;
  String summary;
  String subtype;
  int commentsCount;
  int ratingsCount;
  RatingDetailVo rating;
  ImageVo images;
  List<String> aka;
  List<BlooperVo> bloopers;
  List<CastVo> casts;
  List<DirectorVo> directors;
  List<PhotoVo> photoes;
  List<PopularCommentVo> popularComments;
  List<PopularReviewsVo> popularReviews;
  List<ClipVo> clips;
  List<TrailerVo> trailers;
  List<VideoVo> videos;
  List<WriterVo> writers;

  MovieDetailVo(
      this.reviewsCount,
      this.wishCount,
      this.originalTitle,
      this.collectCount,
      this.doubanSite,
      this.year,
      this.alt,
      this.id,
      this.mobileUrl,
      this.photosCount,
      this.pubdate,
      this.title,
      this.doCount,
      this.hasVideo,
      this.shareUrl,
      this.seasonsCount,
      this.languages,
      this.scheduleUrl,
      this.pubdates,
      this.website,
      this.tags,
      this.hasSchedule,
      this.durations,
      this.genres,
      this.collection,
      this.episodesCount,
      this.trailerUrls,
      this.hasTicket,
      this.clipUrls,
      this.currentSeason,
      this.countries,
      this.mainlandPubdate,
      this.summary,
      this.subtype,
      this.commentsCount,
      this.ratingsCount,
      this.rating,
      this.aka,
      this.bloopers,
      this.casts,
      this.directors,
      this.images,
      this.photoes,
      this.popularComments,
      this.popularReviews,
      this.clips,
      this.trailers,
      this.videos,
      this.writers);

  MovieDetailVo.fromJson(Map<String, dynamic> json) {
    reviewsCount = json['reviews_count'];
    wishCount = json['wish_count'];
    originalTitle = json['original_title'];
    collectCount = json['collect_count'];
    doubanSite = json['douban_site'];
    year = json['year'];
    alt = json['alt'];
    id = json['id'];
    mobileUrl = json['mobile_url'];
    photosCount = json['photos_count'];
    pubdate = json['pubdate'];
    title = json['title'];
    doCount = json['do_count'];
    hasVideo = json['has_video'];
    shareUrl = json['share_url'];
    seasonsCount = json['seasons_count'];
    languages = json['languages'].cast<String>();
    scheduleUrl = json['schedule_url'];
    pubdates = json['pubdates'].cast<String>();
    website = json['website'];
    tags = json['tags'].cast<String>();
    hasSchedule = json['has_schedule'];
    durations = json['durations'].cast<String>();
    genres = json['genres'].cast<String>();
    collection = json['collection'];
    episodesCount = json['episodes_count'];
    trailerUrls = json['trailer_urls'].cast<String>();
    hasTicket = json['has_ticket'];
    clipUrls = json['clip_urls'].cast<String>();
    currentSeason = json['current_season'];
    countries = json['countries'].cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
    summary = json['summary'];
    subtype = json['subtype'];
    commentsCount = json['comments_count'];
    ratingsCount = json['ratings_count'];
    aka = json['aka'].cast<String>();
    rating = RatingDetailVo.fromJson(json['rating']);
    images = ImageVo.fromJson(json['images']);

    List<BlooperVo> blooperData = [];
    for (var i = 0; i < json['bloopers'].length; i++) {
      blooperData.add(BlooperVo.fromJson(json['bloopers'][i]));
    }
    bloopers = blooperData;

    List<CastVo> castData = [];
    for (var i = 0; i < json['casts'].length; i++) {
      castData.add(CastVo.fromJson(json['casts'][i]));
    }
    casts = castData;

    List<DirectorVo> directorData = [];
    for (var i = 0; i < json['directors'].length; i++) {
      directorData.add(DirectorVo.fromJson(json['directors'][i]));
    }
    directors = directorData;

    List<PhotoVo> photoData = [];
    for (var i = 0; i < json['photos'].length; i++) {
      photoData.add(PhotoVo.fromJson(json['photos'][i]));
    }
    photoes = photoData;

    List<PopularCommentVo> popularCommentData = [];
    for (var i = 0; i < json['popular_comments'].length; i++) {
      popularCommentData
          .add(PopularCommentVo.fromJson(json['popular_comments'][i]));
    }
    popularComments = popularCommentData;

    List<PopularReviewsVo> popularReviewsData = [];
    for (var i = 0; i < json['popular_reviews'].length; i++) {
      popularReviewsData
          .add(PopularReviewsVo.fromJson(json['popular_reviews'][i]));
    }
    popularReviews = popularReviewsData;

    List<ClipVo> clipData = [];
    for (var i = 0; i < json['clips'].length; i++) {
      clipData.add(ClipVo.fromJson(json['clips'][i]));
    }
    clips = clipData;

    List<TrailerVo> trailerData = [];
    for (var i = 0; i < json['trailers'].length; i++) {
      trailerData.add(TrailerVo.fromJson(json['trailers'][i]));
    }
    trailers = trailerData;

    List<VideoVo> videoData = [];
    for (var i = 0; i < json['videos'].length; i++) {
      videoData.add(VideoVo.fromJson(json['videos'][i]));
    }
    videos = videoData;

    List<WriterVo> writerData = [];
    for (var i = 0; i < json['writers'].length; i++) {
      writerData.add(WriterVo.fromJson(json['writers'][i]));
    }
    writers = writerData;
  }
}
