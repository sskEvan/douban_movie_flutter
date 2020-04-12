import 'package:douban_movie_flutter/model/movie_subject.dart';
import 'package:douban_movie_flutter/model/usbox_movie_entity.dart';

usboxMovieEntityFromJson(UsboxMovieEntity data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['subjects'] != null) {
		data.subjects = new List<UsboxMovieSubject>();
		(json['subjects'] as List).forEach((v) {
			data.subjects.add(new UsboxMovieSubject().fromJson(v));
		});
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> usboxMovieEntityToJson(UsboxMovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['date'] = entity.date;
	if (entity.subjects != null) {
		data['subjects'] =  entity.subjects.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	return data;
}

usboxMovieSubjectFromJson(UsboxMovieSubject data, Map<String, dynamic> json) {
	if (json['box'] != null) {
		data.box = json['box']?.toInt();
	}
	if (json['new'] != null) {
		data.xNew = json['new'];
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['subject'] != null) {
		data.subject = new MovieSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> usboxMovieSubjectToJson(UsboxMovieSubject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['box'] = entity.box;
	data['new'] = entity.xNew;
	data['rank'] = entity.rank;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}
