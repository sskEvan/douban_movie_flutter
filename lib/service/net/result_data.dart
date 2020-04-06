class ResultData {
  var data;
  bool isSuccess;
  int errorCode;
  String errorMessage;

  ResultData(this.data, this.isSuccess, {this.errorCode, this.errorMessage});
}