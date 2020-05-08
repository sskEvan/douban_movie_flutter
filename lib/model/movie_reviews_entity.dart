import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';

class MovieReviewsEntity with JsonConvert<MovieReviewsEntity> {
	int count;
	List<MovieReviewsReview> reviews;
	int start;
	int total;
	@JSONField(name: "next_start")
	int nextStart;
	MovieReviewsSubject subject;
}

class MovieReviewsReview with JsonConvert<MovieReviewsReview> {
	MovieReviewsReviewsRating rating;
	@JSONField(name: "useful_count")
	int usefulCount;
	MovieReviewsReviewsAuthor author;
	@JSONField(name: "created_at")
	String createdAt;
	String title;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "share_url")
	String shareUrl;
	String summary;
	String content;
	@JSONField(name: "useless_count")
	int uselessCount;
	@JSONField(name: "comments_count")
	int commentsCount;
	String alt;
	String id;
	@JSONField(name: "subject_id")
	String subjectId;
}

class MovieReviewsReviewsRating with JsonConvert<MovieReviewsReviewsRating> {
	int max;
	double value;
	int min;
}

class MovieReviewsReviewsAuthor with JsonConvert<MovieReviewsReviewsAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class MovieReviewsSubject with JsonConvert<MovieReviewsSubject> {
	MovieReviewsSubjectRating rating;
	List<String> genres;
	String title;
	List<MovieReviewsSubjectCast> casts;
	List<String> durations;
	@JSONField(name: "collect_count")
	int collectCount;
	@JSONField(name: "mainland_pubdate")
	String mainlandPubdate;
	@JSONField(name: "has_video")
	bool hasVideo;
	@JSONField(name: "original_title")
	String originalTitle;
	String subtype;
	List<MovieReviewsSubjectDirector> directors;
	List<String> pubdates;
	String year;
	MovieReviewsSubjectImages images;
	String alt;
	String id;
}

class MovieReviewsSubjectRating with JsonConvert<MovieReviewsSubjectRating> {
	int max;
	double average;
	MovieReviewsSubjectRatingDetails details;
	String stars;
	int min;
}

class MovieReviewsSubjectRatingDetails with JsonConvert<MovieReviewsSubjectRatingDetails> {
	double i1;
	double i3;
	double i2;
	double i5;
	double i4;
}

class MovieReviewsSubjectCast with JsonConvert<MovieReviewsSubjectCast> {
	MovieReviewsSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieReviewsSubjectCastsAvatars with JsonConvert<MovieReviewsSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieReviewsSubjectDirector with JsonConvert<MovieReviewsSubjectDirector> {
	MovieReviewsSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieReviewsSubjectDirectorsAvatars with JsonConvert<MovieReviewsSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieReviewsSubjectImages with JsonConvert<MovieReviewsSubjectImages> {
	String small;
	String large;
	String medium;
}
