import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/service/storage_manager.dart';
import 'package:flutter/cupertino.dart';

class LocaleProvider extends ChangeNotifier {
  static const kLocaleIndex = 'kLocaleIndex';
  static List<String> localeValueList = ['', 'zh-CN', 'en-Us'];

  int _localeIndex;

  int get localeIndex => _localeIndex;

  Locale get locale {
    if (_localeIndex > 0) {
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }

    return null;
  }

  LocaleProvider() {
    _localeIndex = StorageManager.sharedPreferences.get(kLocaleIndex) ?? 0;
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(kLocaleIndex, index);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return DouBanLocalizations.of(context).follow_system;
      case 1:
        return DouBanLocalizations.of(context).chinese;
      case 2:
        return DouBanLocalizations.of(context).english;
      default:
        return '';
    }
  }
}
