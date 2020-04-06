import 'package:douban_movie_flutter/model/dio_error_entity.dart';

dioErrorEntityFromJson(DioErrorEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['request'] != null) {
		data.request = json['request']?.toString();
	}
	return data;
}

Map<String, dynamic> dioErrorEntityToJson(DioErrorEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['request'] = entity.request;
	return data;
}