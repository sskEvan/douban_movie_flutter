class SearchKeywordVo {
  List<String> keywords;

  SearchKeywordVo({this.keywords});

  SearchKeywordVo.fromJson(Map<String, dynamic> json) {
    keywords = json['keywords'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keywords'] = this.keywords;
    return data;
  }
}
