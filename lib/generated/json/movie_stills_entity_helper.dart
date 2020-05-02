import 'package:douban_movie_flutter/model/movie_stills_entity.dart';

movieStillsEntityFromJson(MovieStillsEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['photos'] != null) {
		data.photos = new List<MovieStillsPhoto>();
		(json['photos'] as List).forEach((v) {
			data.photos.add(new MovieStillsPhoto().fromJson(v));
		});
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['subject'] != null) {
		data.subject = new MovieStillsSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> movieStillsEntityToJson(MovieStillsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.photos != null) {
		data['photos'] =  entity.photos.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	data['start'] = entity.start;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

movieStillsPhotoFromJson(MovieStillsPhoto data, Map<String, dynamic> json) {
	if (json['photos_count'] != null) {
		data.photosCount = json['photos_count']?.toInt();
	}
	if (json['thumb'] != null) {
		data.thumb = json['thumb']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['author'] != null) {
		data.author = new MovieStillsPhotosAuthor().fromJson(json['author']);
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['album_id'] != null) {
		data.albumId = json['album_id']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['prev_photo'] != null) {
		data.prevPhoto = json['prev_photo']?.toString();
	}
	if (json['album_url'] != null) {
		data.albumUrl = json['album_url']?.toString();
	}
	if (json['comments_count'] != null) {
		data.commentsCount = json['comments_count']?.toInt();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['recs_count'] != null) {
		data.recsCount = json['recs_count']?.toInt();
	}
	if (json['position'] != null) {
		data.position = json['position']?.toInt();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['album_title'] != null) {
		data.albumTitle = json['album_title']?.toString();
	}
	if (json['next_photo'] != null) {
		data.nextPhoto = json['next_photo']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	return data;
}

Map<String, dynamic> movieStillsPhotoToJson(MovieStillsPhoto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['photos_count'] = entity.photosCount;
	data['thumb'] = entity.thumb;
	data['icon'] = entity.icon;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['created_at'] = entity.createdAt;
	data['album_id'] = entity.albumId;
	data['cover'] = entity.cover;
	data['id'] = entity.id;
	data['prev_photo'] = entity.prevPhoto;
	data['album_url'] = entity.albumUrl;
	data['comments_count'] = entity.commentsCount;
	data['image'] = entity.image;
	data['recs_count'] = entity.recsCount;
	data['position'] = entity.position;
	data['alt'] = entity.alt;
	data['album_title'] = entity.albumTitle;
	data['next_photo'] = entity.nextPhoto;
	data['subject_id'] = entity.subjectId;
	data['desc'] = entity.desc;
	return data;
}

movieStillsPhotosAuthorFromJson(MovieStillsPhotosAuthor data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> movieStillsPhotosAuthorToJson(MovieStillsPhotosAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

movieStillsSubjectFromJson(MovieStillsSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieStillsSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<MovieStillsSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new MovieStillsSubjectCast().fromJson(v));
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
		data.directors = new List<MovieStillsSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new MovieStillsSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new MovieStillsSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieStillsSubjectToJson(MovieStillsSubject entity) {
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

movieStillsSubjectRatingFromJson(MovieStillsSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new MovieStillsSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieStillsSubjectRatingToJson(MovieStillsSubjectRating entity) {
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

movieStillsSubjectRatingDetailsFromJson(MovieStillsSubjectRatingDetails data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> movieStillsSubjectRatingDetailsToJson(MovieStillsSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

movieStillsSubjectCastFromJson(MovieStillsSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieStillsSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieStillsSubjectCastToJson(MovieStillsSubjectCast entity) {
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

movieStillsSubjectCastsAvatarsFromJson(MovieStillsSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieStillsSubjectCastsAvatarsToJson(MovieStillsSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieStillsSubjectDirectorFromJson(MovieStillsSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieStillsSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieStillsSubjectDirectorToJson(MovieStillsSubjectDirector entity) {
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

movieStillsSubjectDirectorsAvatarsFromJson(MovieStillsSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieStillsSubjectDirectorsAvatarsToJson(MovieStillsSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieStillsSubjectImagesFromJson(MovieStillsSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieStillsSubjectImagesToJson(MovieStillsSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}