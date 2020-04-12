import 'package:douban_movie_flutter/model/weekly_movie_entity.dart';

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
		data.subject = new WeeklyMovieSubjectsSubject().fromJson(json['subject']);
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

weeklyMovieSubjectsSubjectFromJson(WeeklyMovieSubjectsSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new WeeklyMovieSubjectsSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<WeeklyMovieSubjectsSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new WeeklyMovieSubjectsSubjectCast().fromJson(v));
		});
	}
	if (json['durations'] != null) {
		data.durations = json['durations']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['collect_count'] != null) {
		data.collectCount = json['collect_count']?.toInt();
	}
	if (json['mainland_pubdate'] != null) {
		data.mainlandPubdate = json['mainland_pubdate']?.toString();
	}
	if (json['has_video'] != null) {
		data.hasVideo = json['has_video'];
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title']?.toString();
	}
	if (json['subtype'] != null) {
		data.subtype = json['subtype']?.toString();
	}
	if (json['directors'] != null) {
		data.directors = new List<WeeklyMovieSubjectsSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new WeeklyMovieSubjectsSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new WeeklyMovieSubjectsSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectToJson(WeeklyMovieSubjectsSubject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['genres'] = entity.genres;
	data['title'] = entity.title;
	if (entity.casts != null) {
		data['casts'] =  entity.casts.map((v) => v.toJson()).toList();
	}
	data['durations'] = entity.durations;
	data['collect_count'] = entity.collectCount;
	data['mainland_pubdate'] = entity.mainlandPubdate;
	data['has_video'] = entity.hasVideo;
	data['original_title'] = entity.originalTitle;
	data['subtype'] = entity.subtype;
	if (entity.directors != null) {
		data['directors'] =  entity.directors.map((v) => v.toJson()).toList();
	}
	data['pubdates'] = entity.pubdates;
	data['year'] = entity.year;
	if (entity.images != null) {
		data['images'] = entity.images.toJson();
	}
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

weeklyMovieSubjectsSubjectRatingFromJson(WeeklyMovieSubjectsSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new WeeklyMovieSubjectsSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectRatingToJson(WeeklyMovieSubjectsSubjectRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['average'] = entity.average;
	if (entity.details != null) {
		data['details'] = entity.details.toJson();
	}
	data['stars'] = entity.stars;
	data['min'] = entity.min;
	return data;
}

weeklyMovieSubjectsSubjectRatingDetailsFromJson(WeeklyMovieSubjectsSubjectRatingDetails data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectRatingDetailsToJson(WeeklyMovieSubjectsSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

weeklyMovieSubjectsSubjectCastFromJson(WeeklyMovieSubjectsSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = json['avatars'];
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'];
	}
	if (json['id'] != null) {
		data.id = json['id'];
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectCastToJson(WeeklyMovieSubjectsSubjectCast entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['avatars'] = entity.avatars;
	data['name_en'] = entity.nameEn;
	data['name'] = entity.name;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

weeklyMovieSubjectsSubjectDirectorFromJson(WeeklyMovieSubjectsSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new WeeklyMovieSubjectsSubjectDirectorsAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectDirectorToJson(WeeklyMovieSubjectsSubjectDirector entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.avatars != null) {
		data['avatars'] = entity.avatars.toJson();
	}
	data['name_en'] = entity.nameEn;
	data['name'] = entity.name;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

weeklyMovieSubjectsSubjectDirectorsAvatarsFromJson(WeeklyMovieSubjectsSubjectDirectorsAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectDirectorsAvatarsToJson(WeeklyMovieSubjectsSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

weeklyMovieSubjectsSubjectImagesFromJson(WeeklyMovieSubjectsSubjectImages data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> weeklyMovieSubjectsSubjectImagesToJson(WeeklyMovieSubjectsSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}