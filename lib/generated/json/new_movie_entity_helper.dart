import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/new_movie_entity.dart';

newMovieEntityFromJson(NewMovieEntity data, Map<String, dynamic> json) {
	if (json['subjects'] != null) {
		data.subjects = new List<MovieSubject>();
		(json['subjects'] as List).forEach((v) {
			data.subjects.add(new MovieSubject().fromJson(v));
		});
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> newMovieEntityToJson(NewMovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.subjects != null) {
		data['subjects'] =  entity.subjects.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	return data;
}
