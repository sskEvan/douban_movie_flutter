import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';

class UsboxMovieEntity with JsonConvert<UsboxMovieEntity> {
	String date;
	List<UsboxMovieSubject> subjects;
	String title;
}

class UsboxMovieSubject with JsonConvert<UsboxMovieSubject> {
	int box;
	@JSONField(name: "new")
	bool xNew;
	int rank;
	MovieSubject subject;
}

//class UsboxMovieSubjectsSubject with JsonConvert<UsboxMovieSubjectsSubject> {
//	UsboxMovieSubjectsSubjectRating rating;
//	List<String> genres;
//	String title;
//	List<UsboxMovieSubjectsSubjectCast> casts;
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
//	List<UsboxMovieSubjectsSubjectDirector> directors;
//	List<String> pubdates;
//	String year;
//	UsboxMovieSubjectsSubjectImages images;
//	String alt;
//	String id;
//}
//
//class UsboxMovieSubjectsSubjectRating with JsonConvert<UsboxMovieSubjectsSubjectRating> {
//	int max;
//	double average;
//	UsboxMovieSubjectsSubjectRatingDetails details;
//	String stars;
//	int min;
//}
//
//class UsboxMovieSubjectsSubjectRatingDetails with JsonConvert<UsboxMovieSubjectsSubjectRatingDetails> {
//	double i1;
//	double i3;
//	double i2;
//	double i5;
//	double i4;
//}
//
//class UsboxMovieSubjectsSubjectCast with JsonConvert<UsboxMovieSubjectsSubjectCast> {
//	UsboxMovieSubjectsSubjectCastsAvatars avatars;
//	@JSONField(name: "name_en")
//	String nameEn;
//	String name;
//	String alt;
//	String id;
//}
//
//class UsboxMovieSubjectsSubjectCastsAvatars with JsonConvert<UsboxMovieSubjectsSubjectCastsAvatars> {
//	String small;
//	String large;
//	String medium;
//}
//
//class UsboxMovieSubjectsSubjectDirector with JsonConvert<UsboxMovieSubjectsSubjectDirector> {
//	UsboxMovieSubjectsSubjectDirectorsAvatars avatars;
//	@JSONField(name: "name_en")
//	String nameEn;
//	String name;
//	String alt;
//	String id;
//}
//
//class UsboxMovieSubjectsSubjectDirectorsAvatars with JsonConvert<UsboxMovieSubjectsSubjectDirectorsAvatars> {
//	String small;
//	String large;
//	String medium;
//}
//
//class UsboxMovieSubjectsSubjectImages with JsonConvert<UsboxMovieSubjectsSubjectImages> {
//	String small;
//	String large;
//	String medium;
//}
