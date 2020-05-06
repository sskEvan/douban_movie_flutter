import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';

class MovieCommendEntity with JsonConvert<MovieCommendEntity> {
	int count;
	List<MovieCommandCommants> comments;
	int start;
	int total;
	@JSONField(name: "next_start")
	int nextStart;
	MovieCommendSubject subject;
}

class MovieCommandCommants with JsonConvert<MovieCommandCommants> {
	MovieCommendCommentsRating rating;
	@JSONField(name: "useful_count")
	int usefulCount;
	MovieCommendCommentsAuthor author;
	@JSONField(name: "subject_id")
	String subjectId;
	String content;
	@JSONField(name: "created_at")
	String createdAt;
	String id;
}

class MovieCommendCommentsRating with JsonConvert<MovieCommendCommentsRating> {
	int max;
	double value;
	int min;
}

class MovieCommendCommentsAuthor with JsonConvert<MovieCommendCommentsAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class MovieCommendSubject with JsonConvert<MovieCommendSubject> {
	MovieCommendSubjectRating rating;
	List<String> genres;
	String title;
	List<MovieCommandSubjectCasts> casts;
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
	List<MovieCommandSubjectDirectors> directors;
	List<String> pubdates;
	String year;
	MovieCommendSubjectImages images;
	String alt;
	String id;
}

class MovieCommendSubjectRating with JsonConvert<MovieCommendSubjectRating> {
	int max;
	double average;
	MovieCommendSubjectRatingDetails details;
	String stars;
	int min;
}

class MovieCommendSubjectRatingDetails with JsonConvert<MovieCommendSubjectRatingDetails> {
	double i1;
	double i3;
	double i2;
	double i5;
	double i4;
}

class MovieCommandSubjectCasts with JsonConvert<MovieCommandSubjectCasts> {
	MovieCommendSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieCommendSubjectCastsAvatars with JsonConvert<MovieCommendSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieCommandSubjectDirectors with JsonConvert<MovieCommandSubjectDirectors> {
	MovieCommendSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieCommendSubjectDirectorsAvatars with JsonConvert<MovieCommendSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieCommendSubjectImages with JsonConvert<MovieCommendSubjectImages> {
	String small;
	String large;
	String medium;
}
