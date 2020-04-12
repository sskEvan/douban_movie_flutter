import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';

class WeeklyMovieEntity with JsonConvert<WeeklyMovieEntity> {
	List<WeeklyMovieSubject> subjects;
	String title;
}

class WeeklyMovieSubject with JsonConvert<WeeklyMovieSubject> {
	MovieSubject subject;
	int rank;
	int delta;
}

//class WeeklyMovieSubjectsSubject with JsonConvert<WeeklyMovieSubjectsSubject> {
//	WeeklyMovieSubjectsSubjectRating rating;
//	List<String> genres;
//	String title;
//	List<WeeklyMovieSubjectsSubjectCast> casts;
//	List<String> durations;
//	@JSONField(name: "collect_count")
//	int collectCount;
//	@JSONField(name: "mainland_pubdate")
//	String mainlandPubdate;
//	@JSONField(name: "has_video")
//	bool hasVideo;
//	@JSONField(name: "original_title")
//	String originalTitle;
//	String subtype;
//	List<WeeklyMovieSubjectsSubjectDirector> directors;
//	List<String> pubdates;
//	String year;
//	WeeklyMovieSubjectsSubjectImages images;
//	String alt;
//	String id;
//}
//
//class WeeklyMovieSubjectsSubjectRating with JsonConvert<WeeklyMovieSubjectsSubjectRating> {
//	int max;
//	double average;
//	WeeklyMovieSubjectsSubjectRatingDetails details;
//	String stars;
//	int min;
//}
//
//class WeeklyMovieSubjectsSubjectRatingDetails with JsonConvert<WeeklyMovieSubjectsSubjectRatingDetails> {
//	double i1;
//	double i3;
//	double i2;
//	double i5;
//	double i4;
//}
//
//class WeeklyMovieSubjectsSubjectCast with JsonConvert<WeeklyMovieSubjectsSubjectCast> {
//	dynamic avatars;
//	@JSONField(name: "name_en")
//	String nameEn;
//	String name;
//	dynamic alt;
//	dynamic id;
//}
//
//class WeeklyMovieSubjectsSubjectDirector with JsonConvert<WeeklyMovieSubjectsSubjectDirector> {
//	WeeklyMovieSubjectsSubjectDirectorsAvatars avatars;
//	@JSONField(name: "name_en")
//	String nameEn;
//	String name;
//	String alt;
//	String id;
//}
//
//class WeeklyMovieSubjectsSubjectDirectorsAvatars with JsonConvert<WeeklyMovieSubjectsSubjectDirectorsAvatars> {
//	String small;
//	String large;
//	String medium;
//}
//
//class WeeklyMovieSubjectsSubjectImages with JsonConvert<WeeklyMovieSubjectsSubjectImages> {
//	String small;
//	String large;
//	String medium;
//}
