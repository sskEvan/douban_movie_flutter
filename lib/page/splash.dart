import 'package:douban_movie_flutter/page/index_page.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/locale_model.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _countDownController;

  @override
  void initState() {
    _countDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countDownController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var date = '';
    LocaleModel localeModel = LocaleModel();
    if(localeModel.locale != null && localeModel.locale.countryCode == "US") {
      date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ',    ', DD]);
    }else {
      date = formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd, '日, ',]) + DataUtil.getWeekDay();
    }


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,  //闪屏页面底色是白色,将状态栏字体设置成黑色
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.05),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(ImageHelper.wrapAssets("splash_smile.png"),
                        width: 70, height: 70),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: (Text(
                        date,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.black38),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: (Text(
                        DouBanLocalizations.of(context).splash_meet,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.black38),
                      )),
                    )
                  ]),
            ),
            Align(
                alignment: Alignment(0.0, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      ImageHelper.wrapAssets("app_logo.png"),
                      width: 50,
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "豆瓣电影",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    )
                  ],
                )),
            Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black.withAlpha(100)),
                    child: CountDownWidget(
                        context: context,
                        animation: StepTween(begin: 3, end: 0)
                            .animate(_countDownController)),
                  ),
                ))
          ],
        )));
  }

  @override
  void dispose() {
    _countDownController.dispose();
    super.dispose();
  }
}

class CountDownWidget extends AnimatedWidget {
  final Animation<int> animation;

  CountDownWidget({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        forwardHomePage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;

    return InkWell(
      onTap: () {
        forwardHomePage(context);
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            (value == 0 ? '' : '$value | ') + DouBanLocalizations.of(context).skip,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

void forwardHomePage(context) {
  Navigator.of(context).pushReplacementNamed(RouteName.index);
}
