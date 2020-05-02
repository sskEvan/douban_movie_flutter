import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';

class MovieStillsEntity with JsonConvert<MovieStillsEntity> {
	int count;
	List<MovieStillsPhoto> photos;
	int total;
	int start;
	MovieStillsSubject subject;
}

class MovieStillsPhoto with JsonConvert<MovieStillsPhoto> {
	@JSONField(name: "photos_count")
	int photosCount;
	String thumb;
	String icon;
	MovieStillsPhotosAuthor author;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "album_id")
	String albumId;
	String cover;
	String id;
	@JSONField(name: "prev_photo")
	String prevPhoto;
	@JSONField(name: "album_url")
	String albumUrl;
	@JSONField(name: "comments_count")
	int commentsCount;
	String image;
	@JSONField(name: "recs_count")
	int recsCount;
	int position;
	String alt;
	@JSONField(name: "album_title")
	String albumTitle;
	@JSONField(name: "next_photo")
	String nextPhoto;
	@JSONField(name: "subject_id")
	String subjectId;
	String desc;
}

class MovieStillsPhotosAuthor with JsonConvert<MovieStillsPhotosAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class MovieStillsSubject with JsonConvert<MovieStillsSubject> {
	MovieStillsSubjectRating rating;
	List<String> genres;
	String title;
	List<MovieStillsSubjectCast> casts;
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
	List<MovieStillsSubjectDirector> directors;
	List<String> pubdates;
	String year;
	MovieStillsSubjectImages images;
	String alt;
	String id;
}

class MovieStillsSubjectRating with JsonConvert<MovieStillsSubjectRating> {
	int max;
	double average;
	MovieStillsSubjectRatingDetails details;
	String stars;
	int min;
}

class MovieStillsSubjectRatingDetails with JsonConvert<MovieStillsSubjectRatingDetails> {
	double i1;
	double i3;
	double i2;
	double i5;
	double i4;
}

class MovieStillsSubjectCast with JsonConvert<MovieStillsSubjectCast> {
	MovieStillsSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieStillsSubjectCastsAvatars with JsonConvert<MovieStillsSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieStillsSubjectDirector with JsonConvert<MovieStillsSubjectDirector> {
	MovieStillsSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MovieStillsSubjectDirectorsAvatars with JsonConvert<MovieStillsSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class MovieStillsSubjectImages with JsonConvert<MovieStillsSubjectImages> {
	String small;
	String large;
	String medium;
}
