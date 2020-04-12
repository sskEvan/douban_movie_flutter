import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';

import 'movie_subject.dart';


class Movie with JsonConvert<Movie> {
	int count;
	int start;
	int total;
	List<MovieSubject> subjects;
	String title;
}

