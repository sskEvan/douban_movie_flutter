import 'package:date_format/date_format.dart';

class DataUtil {
  static String getWeekDay() {
    var weekday = formatDate(DateTime.now(), [w]);
    if(weekday == "0") {
      weekday = "星期一";
    }else  if(weekday == "1") {
      weekday = "星期二";
    }else  if(weekday == "2") {
      weekday = "星期三";
    }else  if(weekday == "3") {
      weekday = "星期四";
    }else  if(weekday == "4") {
      weekday = "星期五";
    }else  if(weekday == "5") {
      weekday = "星期六";
    }else  if(weekday == "6") {
      weekday = "星期七";
    }
    return weekday;
  }
}