import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// app全局配置 eg:theme,locale
  static SharedPreferences sharedPreferences;

  static void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

}
