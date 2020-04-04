import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    //初始化，假如app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    init();
  }

  void init();
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

_parseAndDecode(String responce) {
  jsonDecode(responce);
}

abstract class BaseResponseData {
  int code = 0;
  String  msg;

  //Object 和 dynamic 都使得我们可以接收任意类型的参数，但两者的区别非常的大。
  //使用 Object 时，我们只是在说接受任意类型，我们需要的是一个 Object。类型系统会保证其类型安全。
  //使用 dynamic 则是告诉编译器，我们知道自己在做什么，不用做类型检测。
  // 当我们调用一个不存在的方法时，会执行 noSuchMethod() 方法，默认情况下（在 Object 里实现）它会抛出 NoSuchMethodError。
  dynamic data;

  BaseResponseData({this.code, this.data, this.msg});

  bool get success;

  @override
  String toString() => 'BaseRespData{code: $code, message: $msg, data: $data}';
}

/**
 * 服务器协议异常
 */
class ServiceAgreementExecption implements Exception {
  String msg;

  ServiceAgreementExecption.fromRespData(BaseResponseData respData) {
    msg = respData.msg;
  }

  @override
  String toString() => 'NotExpectedException{respData: $msg}';
}