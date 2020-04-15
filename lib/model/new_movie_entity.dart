import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';
import 'package:douban_movie_flutter/generated/json/base/json_filed.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';

class NewMovieEntity with JsonConvert<NewMovieEntity> {
	List<MovieSubject> subjects;
	String title;
}
