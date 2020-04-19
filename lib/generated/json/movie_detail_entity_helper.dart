import 'package:douban_movie_flutter/model/movie_detail_entity.dart';

movieDetailEntityFromJson(MovieDetailEntity data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieDetailRating().fromJson(json['rating']);
	}
	if (json['reviews_count'] != null) {
		data.reviewsCount = json['reviews_count']?.toInt();
	}
	if (json['videos'] != null) {
		data.videos = new List<MovieDetailVideo>();
		(json['videos'] as List).forEach((v) {
			data.videos.add(new MovieDetailVideo().fromJson(v));
		});
	}
	if (json['wish_count'] != null) {
		data.wishCount = json['wish_count']?.toInt();
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title']?.toString();
	}
	if (json['blooper_urls'] != null) {
		data.blooperUrls = json['blooper_urls']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['collect_count'] != null) {
		data.collectCount = json['collect_count']?.toInt();
	}
	if (json['images'] != null) {
		data.images = new MovieDetailImages().fromJson(json['images']);
	}
	if (json['douban_site'] != null) {
		data.doubanSite = json['douban_site']?.toString();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['popular_comments'] != null) {
		data.popularComments = new List<MovieDetailPopularCommants>();
		(json['popular_comments'] as List).forEach((v) {
			data.popularComments.add(new MovieDetailPopularCommants().fromJson(v));
		});
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['mobile_url'] != null) {
		data.mobileUrl = json['mobile_url']?.toString();
	}
	if (json['photos_count'] != null) {
		data.photosCount = json['photos_count']?.toInt();
	}
	if (json['pubdate'] != null) {
		data.pubdate = json['pubdate']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['do_count'] != null) {
		data.doCount = json['do_count'];
	}
	if (json['has_video'] != null) {
		data.hasVideo = json['has_video'];
	}
	if (json['share_url'] != null) {
		data.shareUrl = json['share_url']?.toString();
	}
	if (json['seasons_count'] != null) {
		data.seasonsCount = json['seasons_count'];
	}
	if (json['languages'] != null) {
		data.languages = json['languages']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['schedule_url'] != null) {
		data.scheduleUrl = json['schedule_url']?.toString();
	}
	if (json['writers'] != null) {
		data.writers = new List<MovieDetailWriter>();
		(json['writers'] as List).forEach((v) {
			data.writers.add(new MovieDetailWriter().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['website'] != null) {
		data.website = json['website']?.toString();
	}
	if (json['tags'] != null) {
		data.tags = json['tags']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['has_schedule'] != null) {
		data.hasSchedule = json['has_schedule'];
	}
	if (json['durations'] != null) {
		data.durations = json['durations']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['collection'] != null) {
		data.collection = json['collection'];
	}
	if (json['trailers'] != null) {
		data.trailers = new List<MovieDetailTrailer>();
		(json['trailers'] as List).forEach((v) {
			data.trailers.add(new MovieDetailTrailer().fromJson(v));
		});
	}
	if (json['episodes_count'] != null) {
		data.episodesCount = json['episodes_count'];
	}
	if (json['trailer_urls'] != null) {
		data.trailerUrls = json['trailer_urls']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['has_ticket'] != null) {
		data.hasTicket = json['has_ticket'];
	}
	if (json['bloopers'] != null) {
		data.bloopers = new List<MovieDetailBlooper>();
		(json['bloopers'] as List).forEach((v) {
			data.bloopers.add(new MovieDetailBlooper().fromJson(v));
		});
	}
	if (json['clip_urls'] != null) {
		data.clipUrls = json['clip_urls']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['current_season'] != null) {
		data.currentSeason = json['current_season'];
	}
	if (json['casts'] != null) {
		data.casts = new List<MovieDetailCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new MovieDetailCast().fromJson(v));
		});
	}
	if (json['countries'] != null) {
		data.countries = json['countries']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['mainland_pubdate'] != null) {
		data.mainlandPubdate = json['mainland_pubdate']?.toString();
	}
	if (json['photos'] != null) {
		data.photos = new List<MovieDetailPhoto>();
		(json['photos'] as List).forEach((v) {
			data.photos.add(new MovieDetailPhoto().fromJson(v));
		});
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['clips'] != null) {
		data.clips = new List<MovieDetailClip>();
		(json['clips'] as List).forEach((v) {
			data.clips.add(new MovieDetailClip().fromJson(v));
		});
	}
	if (json['subtype'] != null) {
		data.subtype = json['subtype']?.toString();
	}
	if (json['directors'] != null) {
		data.directors = new List<MovieDetailDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new MovieDetailDirector().fromJson(v));
		});
	}
	if (json['comments_count'] != null) {
		data.commentsCount = json['comments_count']?.toInt();
	}
	if (json['popular_reviews'] != null) {
		data.popularReviews = new List<MovieDetailPopularReview>();
		(json['popular_reviews'] as List).forEach((v) {
			data.popularReviews.add(new MovieDetailPopularReview().fromJson(v));
		});
	}
	if (json['ratings_count'] != null) {
		data.ratingsCount = json['ratings_count']?.toInt();
	}
	if (json['aka'] != null) {
		data.aka = json['aka']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> movieDetailEntityToJson(MovieDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['reviews_count'] = entity.reviewsCount;
	if (entity.videos != null) {
		data['videos'] =  entity.videos.map((v) => v.toJson()).toList();
	}
	data['wish_count'] = entity.wishCount;
	data['original_title'] = entity.originalTitle;
	data['blooper_urls'] = entity.blooperUrls;
	data['collect_count'] = entity.collectCount;
	if (entity.images != null) {
		data['images'] = entity.images.toJson();
	}
	data['douban_site'] = entity.doubanSite;
	data['year'] = entity.year;
	if (entity.popularComments != null) {
		data['popular_comments'] =  entity.popularComments.map((v) => v.toJson()).toList();
	}
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['mobile_url'] = entity.mobileUrl;
	data['photos_count'] = entity.photosCount;
	data['pubdate'] = entity.pubdate;
	data['title'] = entity.title;
	data['do_count'] = entity.doCount;
	data['has_video'] = entity.hasVideo;
	data['share_url'] = entity.shareUrl;
	data['seasons_count'] = entity.seasonsCount;
	data['languages'] = entity.languages;
	data['schedule_url'] = entity.scheduleUrl;
	if (entity.writers != null) {
		data['writers'] =  entity.writers.map((v) => v.toJson()).toList();
	}
	data['pubdates'] = entity.pubdates;
	data['website'] = entity.website;
	data['tags'] = entity.tags;
	data['has_schedule'] = entity.hasSchedule;
	data['durations'] = entity.durations;
	data['genres'] = entity.genres;
	data['collection'] = entity.collection;
	if (entity.trailers != null) {
		data['trailers'] =  entity.trailers.map((v) => v.toJson()).toList();
	}
	data['episodes_count'] = entity.episodesCount;
	data['trailer_urls'] = entity.trailerUrls;
	data['has_ticket'] = entity.hasTicket;
	if (entity.bloopers != null) {
		data['bloopers'] =  entity.bloopers.map((v) => v.toJson()).toList();
	}
	data['clip_urls'] = entity.clipUrls;
	data['current_season'] = entity.currentSeason;
	if (entity.casts != null) {
		data['casts'] =  entity.casts.map((v) => v.toJson()).toList();
	}
	data['countries'] = entity.countries;
	data['mainland_pubdate'] = entity.mainlandPubdate;
	if (entity.photos != null) {
		data['photos'] =  entity.photos.map((v) => v.toJson()).toList();
	}
	data['summary'] = entity.summary;
	if (entity.clips != null) {
		data['clips'] =  entity.clips.map((v) => v.toJson()).toList();
	}
	data['subtype'] = entity.subtype;
	if (entity.directors != null) {
		data['directors'] =  entity.directors.map((v) => v.toJson()).toList();
	}
	data['comments_count'] = entity.commentsCount;
	if (entity.popularReviews != null) {
		data['popular_reviews'] =  entity.popularReviews.map((v) => v.toJson()).toList();
	}
	data['ratings_count'] = entity.ratingsCount;
	data['aka'] = entity.aka;
	return data;
}

movieDetailRatingFromJson(MovieDetailRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new MovieDetailRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieDetailRatingToJson(MovieDetailRating entity) {
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

movieDetailRatingDetailsFromJson(MovieDetailRatingDetails data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailRatingDetailsToJson(MovieDetailRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

movieDetailVideoFromJson(MovieDetailVideo data, Map<String, dynamic> json) {
	if (json['source'] != null) {
		data.source = new MovieDetailVideosSource().fromJson(json['source']);
	}
	if (json['sample_link'] != null) {
		data.sampleLink = json['sample_link']?.toString();
	}
	if (json['video_id'] != null) {
		data.videoId = json['video_id']?.toString();
	}
	if (json['need_pay'] != null) {
		data.needPay = json['need_pay'];
	}
	return data;
}

Map<String, dynamic> movieDetailVideoToJson(MovieDetailVideo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.source != null) {
		data['source'] = entity.source.toJson();
	}
	data['sample_link'] = entity.sampleLink;
	data['video_id'] = entity.videoId;
	data['need_pay'] = entity.needPay;
	return data;
}

movieDetailVideosSourceFromJson(MovieDetailVideosSource data, Map<String, dynamic> json) {
	if (json['literal'] != null) {
		data.literal = json['literal']?.toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailVideosSourceToJson(MovieDetailVideosSource entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['literal'] = entity.literal;
	data['pic'] = entity.pic;
	data['name'] = entity.name;
	return data;
}

movieDetailImagesFromJson(MovieDetailImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailImagesToJson(MovieDetailImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieDetailPopularCommantsFromJson(MovieDetailPopularCommants data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieDetailPopularCommentsRating().fromJson(json['rating']);
	}
	if (json['useful_count'] != null) {
		data.usefulCount = json['useful_count']?.toInt();
	}
	if (json['author'] != null) {
		data.author = new MovieDetailPopularCommentsAuthor().fromJson(json['author']);
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailPopularCommantsToJson(MovieDetailPopularCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['useful_count'] = entity.usefulCount;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['subject_id'] = entity.subjectId;
	data['content'] = entity.content;
	data['created_at'] = entity.createdAt;
	data['id'] = entity.id;
	return data;
}

movieDetailPopularCommentsRatingFromJson(MovieDetailPopularCommentsRating data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailPopularCommentsRatingToJson(MovieDetailPopularCommentsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

movieDetailPopularCommentsAuthorFromJson(MovieDetailPopularCommentsAuthor data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailPopularCommentsAuthorToJson(MovieDetailPopularCommentsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

movieDetailWriterFromJson(MovieDetailWriter data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieDetailWritersAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieDetailWriterToJson(MovieDetailWriter entity) {
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

movieDetailWritersAvatarsFromJson(MovieDetailWritersAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailWritersAvatarsToJson(MovieDetailWritersAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieDetailTrailerFromJson(MovieDetailTrailer data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailTrailerToJson(MovieDetailTrailer entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

movieDetailBlooperFromJson(MovieDetailBlooper data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailBlooperToJson(MovieDetailBlooper entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

movieDetailCastFromJson(MovieDetailCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieDetailCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieDetailCastToJson(MovieDetailCast entity) {
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

movieDetailCastsAvatarsFromJson(MovieDetailCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailCastsAvatarsToJson(MovieDetailCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieDetailPhotoFromJson(MovieDetailPhoto data, Map<String, dynamic> json) {
	if (json['thumb'] != null) {
		data.thumb = json['thumb']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailPhotoToJson(MovieDetailPhoto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['thumb'] = entity.thumb;
	data['image'] = entity.image;
	data['cover'] = entity.cover;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	return data;
}

movieDetailClipFromJson(MovieDetailClip data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailClipToJson(MovieDetailClip entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

movieDetailDirectorFromJson(MovieDetailDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MovieDetailDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> movieDetailDirectorToJson(MovieDetailDirector entity) {
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

movieDetailDirectorsAvatarsFromJson(MovieDetailDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailDirectorsAvatarsToJson(MovieDetailDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

movieDetailPopularReviewFromJson(MovieDetailPopularReview data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MovieDetailPopularReviewsRating().fromJson(json['rating']);
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['author'] != null) {
		data.author = new MovieDetailPopularReviewsAuthor().fromJson(json['author']);
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> movieDetailPopularReviewToJson(MovieDetailPopularReview entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['summary'] = entity.summary;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

movieDetailPopularReviewsRatingFromJson(MovieDetailPopularReviewsRating data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailPopularReviewsRatingToJson(MovieDetailPopularReviewsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

movieDetailPopularReviewsAuthorFromJson(MovieDetailPopularReviewsAuthor data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieDetailPopularReviewsAuthorToJson(MovieDetailPopularReviewsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}