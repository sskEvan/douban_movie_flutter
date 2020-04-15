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

