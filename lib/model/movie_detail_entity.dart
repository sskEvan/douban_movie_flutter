import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';

class MovieDetailEntity with JsonConvert<MovieDetailEntity> {
  MovieDetailRating rating;
  @JSONField(name: "reviews_count")
  int reviewsCount;
  List<MovieDetailVideo> videos;
  @JSONField(name: "wish_count")
  int wishCount;
  @JSONField(name: "original_title")
  String originalTitle;
  @JSONField(name: "blooper_urls")
  List<String> blooperUrls;
  @JSONField(name: "collect_count")
  int collectCount;
  MovieDetailImages images;
  @JSONField(name: "douban_site")
  String doubanSite;
  String year;
  @JSONField(name: "popular_comments")
  List<MovieDetailPopularCommants> popularComments;
  String alt;
  String id;
  @JSONField(name: "mobile_url")
  String mobileUrl;
  @JSONField(name: "photos_count")
  int photosCount;
  String pubdate;
  String title;
  @JSONField(name: "do_count")
  dynamic doCount;
  @JSONField(name: "has_video")
  bool hasVideo;
  @JSONField(name: "share_url")
  String shareUrl;
  @JSONField(name: "seasons_count")
  dynamic seasonsCount;
  List<String> languages;
  @JSONField(name: "schedule_url")
  String scheduleUrl;
  List<MovieDetailWriter> writers;
  List<String> pubdates;
  String website;
  List<String> tags;
  @JSONField(name: "has_schedule")
  bool hasSchedule;
  List<String> durations;
  List<String> genres;
  dynamic collection;
  List<MovieDetailTrailer> trailers;
  @JSONField(name: "episodes_count")
  dynamic episodesCount;
  @JSONField(name: "trailer_urls")
  List<String> trailerUrls;
  @JSONField(name: "has_ticket")
  bool hasTicket;
  List<MovieDetailBlooper> bloopers;
  @JSONField(name: "clip_urls")
  List<String> clipUrls;
  @JSONField(name: "current_season")
  dynamic currentSeason;
  List<MovieDetailCast> casts;
  List<String> countries;
  @JSONField(name: "mainland_pubdate")
  String mainlandPubdate;
  List<MovieDetailPhoto> photos;
  String summary;
  List<MovieDetailClip> clips;
  String subtype;
  List<MovieDetailDirector> directors;
  @JSONField(name: "comments_count")
  int commentsCount;
  @JSONField(name: "popular_reviews")
  List<MovieDetailPopularReview> popularReviews;
  @JSONField(name: "ratings_count")
  int ratingsCount;
  List<String> aka;
}

class MovieDetailRating with JsonConvert<MovieDetailRating> {
  int max;
  double average;
  MovieDetailRatingDetails details;
  String stars;
  int min;
}

class MovieDetailRatingDetails with JsonConvert<MovieDetailRatingDetails> {
  double i1;
  double i3;
  double i2;
  double i5;
  double i4;
}

class MovieDetailVideo with JsonConvert<MovieDetailVideo> {
  MovieDetailVideosSource source;
  @JSONField(name: "sample_link")
  String sampleLink;
  @JSONField(name: "video_id")
  String videoId;
  @JSONField(name: "need_pay")
  bool needPay;
}

class MovieDetailVideosSource with JsonConvert<MovieDetailVideosSource> {
  String literal;
  String pic;
  String name;
}

class MovieDetailImages with JsonConvert<MovieDetailImages> {
  String small;
  String large;
  String medium;
}

class MovieDetailPopularCommants with JsonConvert<MovieDetailPopularCommants> {
  MovieDetailPopularCommentsRating rating;
  @JSONField(name: "useful_count")
  int usefulCount;
  MovieDetailPopularCommentsAuthor author;
  @JSONField(name: "subject_id")
  String subjectId;
  String content;
  @JSONField(name: "created_at")
  String createdAt;
  String id;
}

class MovieDetailPopularCommentsRating
    with JsonConvert<MovieDetailPopularCommentsRating> {
  int max;
  double value;
  int min;
}

class MovieDetailPopularCommentsAuthor
    with JsonConvert<MovieDetailPopularCommentsAuthor> {
  String uid;
  String avatar;
  String signature;
  String alt;
  String id;
  String name;
}

class MovieDetailWriter with JsonConvert<MovieDetailWriter> {
  MovieDetailWritersAvatars avatars;
  @JSONField(name: "name_en")
  String nameEn;
  String name;
  String alt;
  String id;
}

class MovieDetailWritersAvatars with JsonConvert<MovieDetailWritersAvatars> {
  String small;
  String large;
  String medium;
}

class MovieDetailTrailer with JsonConvert<MovieDetailTrailer> {
  String medium;
  String title;
  @JSONField(name: "subject_id")
  String subjectId;
  String alt;
  String small;
  @JSONField(name: "resource_url")
  String resourceUrl;
  String id;
}

class MovieDetailBlooper with JsonConvert<MovieDetailBlooper> {
  String medium;
  String title;
  @JSONField(name: "subject_id")
  String subjectId;
  String alt;
  String small;
  @JSONField(name: "resource_url")
  String resourceUrl;
  String id;
}

class MovieDetailCast with JsonConvert<MovieDetailCast> {
  MovieDetailCastsAvatars avatars;
  @JSONField(name: "name_en")
  String nameEn;
  String name;
  String alt;
  String id;
}

class MovieDetailCastsAvatars with JsonConvert<MovieDetailCastsAvatars> {
  String small;
  String large;
  String medium;
}

class MovieDetailPhoto with JsonConvert<MovieDetailPhoto> {
  String thumb;
  String image;
  String cover;
  String alt;
  String id;
  String icon;
}

class MovieDetailClip with JsonConvert<MovieDetailClip> {
  String medium;
  String title;
  @JSONField(name: "subject_id")
  String subjectId;
  String alt;
  String small;
  @JSONField(name: "resource_url")
  String resourceUrl;
  String id;
}

class MovieDetailDirector with JsonConvert<MovieDetailDirector> {
  MovieDetailDirectorsAvatars avatars;
  @JSONField(name: "name_en")
  String nameEn;
  String name;
  String alt;
  String id;
}

class MovieDetailDirectorsAvatars
    with JsonConvert<MovieDetailDirectorsAvatars> {
  String small;
  String large;
  String medium;
}

class MovieDetailPopularReview with JsonConvert<MovieDetailPopularReview> {
  MovieDetailPopularReviewsRating rating;
  String title;
  @JSONField(name: "subject_id")
  String subjectId;
  MovieDetailPopularReviewsAuthor author;
  String summary;
  String alt;
  String id;
}

class MovieDetailPopularReviewsRating
    with JsonConvert<MovieDetailPopularReviewsRating> {
  int max;
  double value;
  int min;
}

class MovieDetailPopularReviewsAuthor
    with JsonConvert<MovieDetailPopularReviewsAuthor> {
  String uid;
  String avatar;
  String signature;
  String alt;
  String id;
  String name;
}
