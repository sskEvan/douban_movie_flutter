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
      'Skip',
      name: 'skip',
      desc: 'skip',
    );
  }

  String get projection {
    return Intl.message(
      'Projection',
      name: 'projection',
      desc: 'projection',
    );
  }

  String get billboard {
    return Intl.message(
      'Billboard',
      name: 'billboard',
      desc: 'billboard',
    );
  }

  String get mine {
    return Intl.message(
      'Mine',
      name: 'mine',
      desc: 'mine',
    );
  }

  String get showing_projection {
    return Intl.message(
      'Showing Projection',
      name: 'showing_projection',
      desc: 'showing_projection',
    );
  }

  String get upcoming_projection {
    return Intl.message(
      'Upcoming Projection',
      name: 'upcoming_projection',
      desc: 'upcoming_projection',
    );
  }

  String get network_poor_tip {
    return Intl.message(
      'Network poor,please check the network connection',
      name: 'network_poor_tip',
      desc: 'network_poor_tip',
    );
  }

  String get load_data_failed_tip {
    return Intl.message(
      'Load data falied, please refresh',
      name: 'load_data_failed_tip',
      desc: 'load_data_failed_tip',
    );
  }

  String get error_code {
    return Intl.message(
      'Error code',
      name: 'error_code',
      desc: 'error_code',
    );
  }

  String get empty_data_tip {
    return Intl.message(
      'Empty data,please refresh',
      name: 'empty_data_tip',
      desc: 'empty_data_tip',
    );
  }

  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: 'refresh',
    );
  }

  String get buy{
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: 'buy',
    );
  }

  String get seen{
    return Intl.message(
      'Seen',
      name: 'seen',
      desc: 'seen',
    );
  }

  String get cancel{
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'cancel',
    );
  }

  String get search_content_hint{
    return Intl.message(
      'Please input search content',
      name: 'search_content_hint',
      desc: 'search_content_hint',
    );
  }

  String get want_to_see{
    return Intl.message(
      ' Want',
      name: 'want_to_see',
      desc: 'want_to_see',
    );
  }

  String get no_scare{
    return Intl.message(
      'No scare',
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
      'All',
      name: 'all',
      desc: 'all',
    );
  }

  String get other_billboard{
    return Intl.message(
      'Other Billboard',
      name: 'other_billboard',
      desc: 'other_billboard',
    );
  }

  //短评
  String get comment{
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: 'comment',
    );
  }

  //影评
  String get reviews{
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: 'reviews',
    );
  }

  //影评详情
  String get reviews_detail{
    return Intl.message(
      'Reviews Detail',
      name: 'reviews_detail',
      desc: 'reviews',
    );
  }

  //的影评
  String get somebody_reviews{
    return Intl.message(
      '\'s Reviews',
      name: 'somebody_reviews',
      desc: 'somebody_reviews',
    );
  }

  //电影
  String get movie{
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: 'movie',
    );
  }

  //全部影视
  String get all_movie{
    return Intl.message(
      'All Movie',
      name: 'all_movie',
      desc: 'all_movie',
    );
  }

  //关注
  String get follow{
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: 'follow',
    );
  }

  //有用
  String get useful{
    return Intl.message(
      'Useful',
      name: 'useful',
      desc: 'useful',
    );
  }

  //回复
  String get reply{
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: 'reply',
    );
  }

  //保存
  String get save{
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'save',
    );
  }

  //保存成功
  String get save_success{
    return Intl.message(
      'Save success',
      name: 'save_success',
      desc: 'save_success',
    );
  }

  //保存失败
  String get save_failed{
    return Intl.message(
      'Save failed',
      name: 'save_failed',
      desc: 'save_failed',
    );
  }


  //去开启
  String get go_to_open{
    return Intl.message(
      'Go To Open',
      name: 'go_to_open',
      desc: 'go_to_open',
    );
  }

  //提示
  String get tip{
    return Intl.message(
      'Tip',
      name: 'tip',
      desc: 'tip',
    );
  }

  //您当前没有存储文件到本地的权限
  String get no_storage_permission_tip{
    return Intl.message(
      'You currently do not have permission to store files locally',
      name: 'no_storage_permission_tip',
      desc: 'no_storage_permission_tip',
    );
  }

  //相册
  String get photo{
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: 'photo',
    );
  }

  //全部照片
  String get all_photo{
    return Intl.message(
      'All Photo',
      name: 'all_photo',
      desc: 'all_photo',
    );
  }

  //影人信息
  String get staff_info{
    return Intl.message(
      'Staff Information',
      name: 'staff_info',
      desc: 'staff_info',
    );
  }

  //出生日期
  String get birthday{
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: 'birthday',
    );
  }

  //性别
  String get sex{
    return Intl.message(
      'Sex',
      name: 'sex',
      desc: 'sex',
    );
  }

  //更多外文名
  String get more_english_name{
    return Intl.message(
      'More english name',
      name: 'more_english_name',
      desc: 'more_english_name',
    );
  }

  //更多外文名
  String get more_chinese_name{
    return Intl.message(
      'More chinese name',
      name: 'more_chinese_name',
      desc: 'more_chinese_name',
    );
  }

  //简介
  String get summary{
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: 'summary',
    );
  }

  //暂无
  String get none{
    return Intl.message(
      'None',
      name: 'none',
      desc: 'none',
    );
  }

  //豆瓣电影TOP250
  String get douban_movie_top250{
    return Intl.message(
      'Douban Movie Top250',
      name: 'douban_movie_top250',
      desc: 'douban_movie_top250',
    );
  }

  //豆瓣电影本周口碑榜
  String get douban_movie_word_of_mouth{
    return Intl.message(
      'Douban movie word of mouth',
      name: 'douban_movie_word_of_mouth',
      desc: 'douban_movie_word_of_mouth',
    );
  }

  //豆瓣电影新片榜
  String get douban_movie_new_movie_list{
    return Intl.message(
      'Douban New Movie List',
      name: 'douban_movie_new_movie_list',
      desc: 'douban_movie_new_movie_list',
    );
  }

  //豆瓣电影北美票房榜
  String get douban_movie_us_box_office{
    return Intl.message(
      'Douban Movie Us Box 0ffice',
      name: 'douban_movie_us_box_office',
      desc: 'douban_movie_us_box_office',
    );
  }

  //搜索内容不能为空
  String get search_content_no_empty{
    return Intl.message(
      'Search content no empty',
      name: 'search_content_no_empty',
      desc: 'search_content_no_empty',
    );
  }

  //最近搜索
  String get recently_search{
    return Intl.message(
      'Recently Search',
      name: 'recently_search',
      desc: 'recently_search',
    );
  }

  //小朋友,你是不是有很多问号？因为豆瓣开放api搜索接口以及不能访问拉～～～
  String get search_error_tip{
    return Intl.message(
      'Search error!',
      name: 'search_error_tip',
      desc: 'search_error_tip',
    );
  }

  //收藏
  String get collect{
    return Intl.message(
      'Collect',
      name: 'collect',
      desc: 'collect',
    );
  }

  //豆瓣评分
  String get douban_score{
    return Intl.message(
      'Douban Score',
      name: 'douban_score',
      desc: 'douban_score',
    );
  }

  //职员表
  String get staff_list{
    return Intl.message(
      'Staff List',
      name: 'staff_list',
      desc: 'staff_list',
    );
  }

  //导演
  String get director{
    return Intl.message(
      'Director',
      name: 'director',
      desc: 'director',
    );
  }

  //编剧
  String get writer{
    return Intl.message(
      'Writer',
      name: 'writer',
      desc: 'writer',
    );
  }

  //剧照&预告片
  String get stills_and_trailers{
    return Intl.message(
      'Stills & Trailers',
      name: 'stills_and_trailers',
      desc: 'stills_and_trailers',
    );
  }

  //所属频道
  String get channel{
    return Intl.message(
      'Channel',
      name: 'channel',
      desc: 'channel',
    );
  }

  //收起
  String get pack_up{
    return Intl.message(
      'Pack Up',
      name: 'pack_up',
      desc: 'pack_up',
    );
  }

  //展开
  String get open{
    return Intl.message(
      'Open',
      name: 'open',
      desc: 'open',
    );
  }

  //多语言
  String get multilingual{
    return Intl.message(
      'Multilingual',
      name: 'multilingual',
      desc: 'multilingual',
    );
  }

  //黑夜模式
  String get night_mode{
    return Intl.message(
      'Night Mode',
      name: 'night_mode',
      desc: 'night_mode',
    );
  }

  //白天模式
  String get day_mode{
    return Intl.message(
      'Day Mode',
      name: 'day_mode',
      desc: 'day_mode',
    );
  }

  //主题色彩
  String get theme_color{
    return Intl.message(
      'Theme Color',
      name: 'theme_color',
      desc: 'theme_color',
    );
  }

  //关于
  String get about{
    return Intl.message(
      'about',
      name: 'about',
      desc: 'about',
    );
  }

  //检查更新
  String get check_update{
    return Intl.message(
      'Check Update',
      name: 'check_update',
      desc: 'check_update',
    );
  }

  //跟随系统
  String get follow_system{
    return Intl.message(
      'Follow System',
      name: 'follow_system',
      desc: 'follow_system',
    );
  }

  //中文
  String get chinese{
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: 'chinese',
    );
  }

  //英文
  String get english{
    return Intl.message(
      'English',
      name: 'english',
      desc: 'english',
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