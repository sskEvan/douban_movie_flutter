import 'package:douban_movie_flutter/model/movie.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';

movieFromJson(Movie data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
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

Map<String, dynamic> movieToJson(Movie entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['start'] = entity.start;
	data['total'] = entity.total;
	if (entity.subjects != null) {
		data['subjects'] =  entity.subjects.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	return data;
}