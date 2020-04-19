import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';
import 'package:douban_movie_flutter/model/movie_subject.dart';

weeklyMovieEntityFromJson(WeeklyMovieEntity data, Map<String, dynamic> json) {
	if (json['subjects'] != null) {
		data.subjects = new List<WeeklyMovieSubject>();
		(json['subjects'] as List).forEach((v) {
			data.subjects.add(new WeeklyMovieSubject().fromJson(v));
		});
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> weeklyMovieEntityToJson(WeeklyMovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.subjects != null) {
		data['subjects'] =  entity.subjects.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	return data;
}

weeklyMovieSubjectFromJson(WeeklyMovieSubject data, Map<String, dynamic> json) {
	if (json['subject'] != null) {
		data.subject = new MovieSubject().fromJson(json['subject']);
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['delta'] != null) {
		data.delta = json['delta']?.toInt();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectToJson(WeeklyMovieSubject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	data['rank'] = entity.rank;
	data['delta'] = entity.delta;
	return data;
}