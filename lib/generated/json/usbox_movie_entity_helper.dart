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
		data.subject = new UsboxMovieSubjectsSubject().fromJson(json['subject']);
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

usboxMovieSubjectsSubjectFromJson(UsboxMovieSubjectsSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new UsboxMovieSubjectsSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<UsboxMovieSubjectsSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new UsboxMovieSubjectsSubjectCast().fromJson(v));
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
		data.directors = new List<UsboxMovieSubjectsSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new UsboxMovieSubjectsSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new UsboxMovieSubjectsSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> usboxMovieSubjectsSubjectToJson(UsboxMovieSubjectsSubject entity) {
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

usboxMovieSubjectsSubjectRatingFromJson(UsboxMovieSubjectsSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new UsboxMovieSubjectsSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> usboxMovieSubjectsSubjectRatingToJson(UsboxMovieSubjectsSubjectRating entity) {
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

usboxMovieSubjectsSubjectRatingDetailsFromJson(UsboxMovieSubjectsSubjectRatingDetails data, Map<String, dynamic> json) {
	if (json['i1'] != null) {
		data.i1 = json['i1']?.toDouble();
	}
	if (json['i3'] != null) {
		data.i3 = json['i3']?.toDouble();
	}
	if (json['i2'] != null) {
		data.i2 = json['i2']?.toDouble();
	}
	if (json['i5'] != null) {
		data.i5 = json['i5']?.toDouble();
	}
	if (json['i4'] != null) {
		data.i4 = json['i4']?.toDouble();
	}
	return data;
}

Map<String, dynamic> usboxMovieSubjectsSubjectRatingDetailsToJson(UsboxMovieSubjectsSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['i1'] = entity.i1;
	data['i3'] = entity.i3;
	data['i2'] = entity.i2;
	data['i5'] = entity.i5;
	data['i4'] = entity.i4;
	return data;
}

usboxMovieSubjectsSubjectCastFromJson(UsboxMovieSubjectsSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new UsboxMovieSubjectsSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> usboxMovieSubjectsSubjectCastToJson(UsboxMovieSubjectsSubjectCast entity) {
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

usboxMovieSubjectsSubjectCastsAvatarsFromJson(UsboxMovieSubjectsSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> usboxMovieSubjectsSubjectCastsAvatarsToJson(UsboxMovieSubjectsSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

usboxMovieSubjectsSubjectDirectorFromJson(UsboxMovieSubjectsSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new UsboxMovieSubjectsSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> usboxMovieSubjectsSubjectDirectorToJson(UsboxMovieSubjectsSubjectDirector entity) {
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

usboxMovieSubjectsSubjectDirectorsAvatarsFromJson(UsboxMovieSubjectsSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> usboxMovieSubjectsSubjectDirectorsAvatarsToJson(UsboxMovieSubjectsSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

usboxMovieSubjectsSubjectImagesFromJson(UsboxMovieSubjectsSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> usboxMovieSubjectsSubjectImagesToJson(UsboxMovieSubjectsSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}