import 'package:douban_movie_flutter/model/movie_reviews_entity.dart';

movieReviewsEntityFromJson(MovieReviewsEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['reviews'] != null) {
		data.reviews = new List<MovieReviewsReview>();
		(json['reviews'] as List).forEach((v) {
			data.reviews.add(new MovieReviewsReview().fromJson(v));
		});
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['next_start'] != null) {
		data.nextStart = json['next_start']?.toInt();
	}
	if (json['subject'] != null) {
		data.subject = new MovieReviewsSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> movieReviewsEntityToJson(MovieReviewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.reviews != null) {
		data['reviews'] =  entity.reviews.map((v) => v.toJson()).toList();
	}
	data['start'] = entity.start;
	data['total'] = entity.total;
	data['next_start'] = entity.nextStart;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

movieReviewsReviewFromJson(MovieReviewsReview data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieReviewsReviewsRating().fromJson(json['rating']);
	}
	if (json['useful_count'] != null) {
		data.usefulCount = json['useful_count']?.toInt();
	}
	if (json['author'] != null) {
		data.author = new MovieReviewsReviewsAuthor().fromJson(json['author']);
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['share_url'] != null) {
		data.shareUrl = json['share_url']?.toString();
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['useless_count'] != null) {
		data.uselessCount = json['useless_count']?.toInt();
	}
	if (json['comments_count'] != null) {
		data.commentsCount = json['comments_count']?.toInt();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieReviewsReviewToJson(MovieReviewsReview entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['useful_count'] = entity.usefulCount;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['created_at'] = entity.createdAt;
	data['title'] = entity.title;
	data['updated_at'] = entity.updatedAt;
	data['share_url'] = entity.shareUrl;
	data['summary'] = entity.summary;
	data['content'] = entity.content;
	data['useless_count'] = entity.uselessCount;
	data['comments_count'] = entity.commentsCount;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['subject_id'] = entity.subjectId;
	return data;
}

movieReviewsReviewsRatingFromJson(MovieReviewsReviewsRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieReviewsReviewsRatingToJson(MovieReviewsReviewsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

movieReviewsReviewsAuthorFromJson(MovieReviewsReviewsAuthor data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieReviewsReviewsAuthorToJson(MovieReviewsReviewsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

movieReviewsSubjectFromJson(MovieReviewsSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieReviewsSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<MovieReviewsSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new MovieReviewsSubjectCast().fromJson(v));
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
		data.directors = new List<MovieReviewsSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new MovieReviewsSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new MovieReviewsSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieReviewsSubjectToJson(MovieReviewsSubject entity) {
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

movieReviewsSubjectRatingFromJson(MovieReviewsSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new MovieReviewsSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieReviewsSubjectRatingToJson(MovieReviewsSubjectRating entity) {
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

movieReviewsSubjectRatingDetailsFromJson(MovieReviewsSubjectRatingDetails data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> movieReviewsSubjectRatingDetailsToJson(MovieReviewsSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

movieReviewsSubjectCastFromJson(MovieReviewsSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieReviewsSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieReviewsSubjectCastToJson(MovieReviewsSubjectCast entity) {
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

movieReviewsSubjectCastsAvatarsFromJson(MovieReviewsSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieReviewsSubjectCastsAvatarsToJson(MovieReviewsSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieReviewsSubjectDirectorFromJson(MovieReviewsSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieReviewsSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieReviewsSubjectDirectorToJson(MovieReviewsSubjectDirector entity) {
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

movieReviewsSubjectDirectorsAvatarsFromJson(MovieReviewsSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieReviewsSubjectDirectorsAvatarsToJson(MovieReviewsSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieReviewsSubjectImagesFromJson(MovieReviewsSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieReviewsSubjectImagesToJson(MovieReviewsSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}