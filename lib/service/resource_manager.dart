
import 'package:flutter/cupertino.dart';

class ImageHelper {

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }

}

class IconFonts {
  IconFonts._();

  /// iconfont:flutter base
  static const String fontFamily = 'iconfont';

  static const IconData pageEmpty = IconData(0xe63c, fontFamily: fontFamily);
  static const IconData pageError = IconData(0xe600, fontFamily: fontFamily);
  static const IconData pageNetworkError = IconData(0xe678, fontFamily: fontFamily);
  static const IconData pageUnAuth = IconData(0xe65f, fontFamily: fontFamily);
}