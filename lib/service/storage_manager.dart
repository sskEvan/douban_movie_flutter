import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// app全局配置 eg:theme,locale
  static SharedPreferences sharedPreferences;

  /// 临时目录 eg: cookie
  static Directory temporaryDirectory;

  static void init() async {
    temporaryDirectory = await getTemporaryDirectory();
    sharedPreferences = await SharedPreferences.getInstance();
  }

}
