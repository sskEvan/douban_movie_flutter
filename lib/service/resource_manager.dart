
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageHelper {

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }
}

class ThemeHelper {
  static Color wrapDarkBackgroundColor(BuildContext context, Color lightModeColor) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark) {
      return Color(0xFF272727);
    }else {
      return lightModeColor;
    }
  }

  static Color wrapDarkColor(BuildContext context, Color lightModeColor) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark) {
      return Color(0xffffffff);
    }else {
      return lightModeColor;
    }
  }

  static Color wrapColor(BuildContext context, {Color lightModeColor, Color darkModeColor}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark) {
      return darkModeColor;
    }else {
      return lightModeColor;
    }
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