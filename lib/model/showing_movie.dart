import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';


class ShowingMovie with JsonConvert<ShowingMovie> {
	int count;
	int start;
	int total;
	List<MovieSubject> subjects;
	String title;
}

class MovieSubject with JsonConvert<MovieSubject> {
	MovieSubjectsRating rating;
	List<String> genres;
	String title;
	List<MovieSubjectsCast> casts;
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
	List<MovieSubjectsDirector> directors;
	List<String> pubdates;
	String year;
	MovieSubjectsImages images;
	String alt;
	String id;
}

class MovieSubjectsRating with JsonConvert<MovieSubjectsRating> {
	int max;
	double average;
	MovieSubjectsRatingDetails details;
	String stars;
	int min;
}

class MovieSubjectsRatingDetails with JsonConvert<MovieSubjectsRatingDetails> {
	double i1;
	double i3;
	double i2;
	double i5;
	double i4;
}

class MovieSubjectsCast with JsonConvert<MovieSubjectsCast> {
	MovieSubjectsCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieSubjectsCastsAvatars with JsonConvert<MovieSubjectsCastsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieSubjectsDirector with JsonConvert<MovieSubjectsDirector> {
	MovieSubjectsDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieSubjectsDirectorsAvatars with JsonConvert<MovieSubjectsDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieSubjectsImages with JsonConvert<MovieSubjectsImages> {
	String small;
	String large;
	String medium;
}
