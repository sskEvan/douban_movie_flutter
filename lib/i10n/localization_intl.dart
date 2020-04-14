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

  String get projection {
    return Intl.message(
      'projection',
      name: 'projection',
      desc: 'projection',
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

  String get showing_projection {
    return Intl.message(
      'showing projection',
      name: 'showing_projection',
      desc: 'showing_projection',
    );
  }

  String get upcoming_projection {
    return Intl.message(
      'upcoming projection',
      name: 'upcoming_projection',
      desc: 'upcoming_projection',
    );
  }

  String get network_poor_tip {
    return Intl.message(
      'network poor,please check the network connection',
      name: 'network_poor_tip',
      desc: 'network_poor_tip',
    );
  }

  String get load_data_failed_tip {
    return Intl.message(
      'load data falied, please refresh',
      name: 'load_data_failed_tip',
      desc: 'load_data_failed_tip',
    );
  }

  String get error_code {
    return Intl.message(
      'error code',
      name: 'error_code',
      desc: 'error_code',
    );
  }

  String get empty_data_tip {
    return Intl.message(
      'empty data,please refresh',
      name: 'empty_data_tip',
      desc: 'empty_data_tip',
    );
  }

  String get refresh {
    return Intl.message(
      'refresh',
      name: 'refresh',
      desc: 'refresh',
    );
  }

  String get buy{
    return Intl.message(
      'buy',
      name: 'buy',
      desc: 'buy',
    );
  }

  String get seen{
    return Intl.message(
      'seen',
      name: 'seen',
      desc: 'seen',
    );
  }

  String get cancel{
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: 'cancel',
    );
  }

  String get search_content_hint{
    return Intl.message(
      'please input search content',
      name: 'search_content_hint',
      desc: 'search_content_hint',
    );
  }

  String get want_to_see{
    return Intl.message(
      ' want',
      name: 'want_to_see',
      desc: 'want_to_see',
    );
  }

  String get no_scare{
    return Intl.message(
      'no scare',
      name: 'no_scare',
      desc: 'no_scare',
    );
  }

  String get top_250{
    return Intl.message(
      'TOP250',
      name: 'top_250',
      desc: 'top_250',
    );
  }

  String get all{
    return Intl.message(
      'all',
      name: 'all',
      desc: 'all',
    );
  }

  String get other_billboard{
    return Intl.message(
      'other billboard',
      name: 'other_billboard',
      desc: 'other_billboard',
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