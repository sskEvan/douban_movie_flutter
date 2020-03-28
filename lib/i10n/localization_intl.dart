import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class DouBanLocalizations {
  static const DouBanLocalizationsDelegate delegate = DouBanLocalizationsDelegate();

  static Future<DouBanLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
//    final String localeName = "zh_CN";
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new DouBanLocalizations();
    });
  }

  static DouBanLocalizations of(BuildContext context) {
    return Localizations.of<DouBanLocalizations>(context, DouBanLocalizations);
  }

  String get splash_meet {
    return Intl.message(
      'Nice to meet you',
      name: 'splash_meet',
      desc: 'splash_meet',
    );
  }

  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: 'skip',
    );
  }

  String get projecting {
    return Intl.message(
      'projecting',
      name: 'projecting',
      desc: 'projecting',
    );
  }

  String get billboard {
    return Intl.message(
      'billboard',
      name: 'billboard',
      desc: 'billboard',
    );
  }

  String get mine {
    return Intl.message(
      'mine',
      name: 'mine',
      desc: 'mine',
    );
  }

}

//Locale代理类
class DouBanLocalizationsDelegate extends LocalizationsDelegate<DouBanLocalizations> {
  const DouBanLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('zh', 'CN'), Locale('en', 'US'),
    ];
  }

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DouBanLocalizations> load(Locale locale) {
    //3
    return  DouBanLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DouBanLocalizationsDelegate old) => false;
}