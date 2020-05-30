
class DioErrorVo {
	String msg;
	int code;
	String request;

	DioErrorVo(this.msg, this.code, this.request);

	DioErrorVo.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		request = json['request'];
	}
	
}
