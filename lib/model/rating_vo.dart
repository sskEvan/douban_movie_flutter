class Rating {
  int max;
  double value;
  int min;

  Rating({this.max, this.value, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    var tempValue = json['value'];
    if(tempValue.runtimeType == int) {
      tempValue = double.parse('${json['value']}');
    }
    value = tempValue;
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['value'] = this.value;
    data['min'] = this.min;
    return data;
  }
}
