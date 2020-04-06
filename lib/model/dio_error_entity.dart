import 'package:douban_movie_flutter/generated/json/base/json_convert_content.dart';

class DioErrorEntity with JsonConvert<DioErrorEntity> {
	String msg;
	int code;
	String request;
}
