import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:douban_movie_flutter/service/net/result_data.dart';

const String baseUrl = 'http://api.douban.com/v2/movie/';
const String apiKey = '0b2bdeda43b5688921839c8ecb20399b';
const String webUrl = 'https://movie.douban.com/';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;

  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal() {
    if (null == _dio) {
      var options = BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 10000,
          receiveTimeout: 100000,
          responseType: ResponseType.plain,
          queryParameters: {"apikey": apiKey});

      _dio = Dio(options);
      _dio.interceptors.add(LogInterceptor());
    }
  }

  static HttpManager getInstance({String baseUrl}) {
    return _instance;
  }

  ///通用的GET请求
  get(url, {queryParameters, noTip = false}) async {
    Response response = await _dio.get(url, queryParameters: queryParameters);
    return ResultData(response.data, true);
  }
}
