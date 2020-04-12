import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';

class NewMovieEntity with JsonConvert<NewMovieEntity> {
	List<NewMovieSubject> subjects;
	String title;
}

class NewMovieSubject with JsonConvert<NewMovieSubject> {
	NewMovieSubjectsRating rating;
	List<String> genres;
	String title;
	List<NewMovieSubjectsCast> casts;
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
	List<NewMovieSubjectsDirector> directors;
	List<String> pubdates;
	String year;
	NewMovieSubjectsImages images;
	String alt;
	String id;
}

class NewMovieSubjectsRating with JsonConvert<NewMovieSubjectsRating> {
	int max;
	double average;
	NewMovieSubjectsRatingDetails details;
	String stars;
	int min;
}

class NewMovieSubjectsRatingDetails with JsonConvert<NewMovieSubjectsRatingDetails> {
	double i1;
	double i3;
	double i2;
	double i5;
	double i4;
}

class NewMovieSubjectsCast with JsonConvert<NewMovieSubjectsCast> {
	NewMovieSubjectsCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class NewMovieSubjectsCastsAvatars with JsonConvert<NewMovieSubjectsCastsAvatars> {
	String small;
	String large;
	String medium;
}

class NewMovieSubjectsDirector with JsonConvert<NewMovieSubjectsDirector> {
	NewMovieSubjectsDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class NewMovieSubjectsDirectorsAvatars with JsonConvert<NewMovieSubjectsDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class NewMovieSubjectsImages with JsonConvert<NewMovieSubjectsImages> {
	String small;
	String large;
	String medium;
}
