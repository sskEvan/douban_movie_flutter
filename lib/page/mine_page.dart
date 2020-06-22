import 'dart:math';
import 'dart:ui';

import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/provider/locale_provider.dart';
import 'package:douban_movie_flutter/provider/theme_provider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/bottom_clipper.dart';
import 'package:douban_movie_flutter/widget/over_scroll_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

/**
 * 我的页面
 */
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil.height,
        color: ThemeHelper.wrapDarkBackgroundColor(context, Color(0xDDEFEFEF)),
        child: ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                _buildHeader(),
                _buildSettingItemList(context),
              ],
            ))));
  }

  Widget _buildHeader() {
    var width = ScreenUtil.width;
    var height = 280.0;

    return ClipPath(
        clipper: BottomClipper(),
        child: Stack(
          children: <Widget>[
            Image.asset(
              ImageHelper.wrapAssets("default_avator.jpeg"),
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.1,
              child:
                  Container(color: Colors.black, width: width, height: height),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 1.0),
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height - ScreenUtil.topSafeHeight,
                color: Colors.transparent,
                child: Container(
                    width: 102,
                    height: 102,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border:
                          new Border.all(width: 1, color: Color(0xffaaaaaa)),
                    ),
                    child: ClipOval(
                        child: Image.asset(
                      ImageHelper.wrapAssets("default_avator.jpeg"),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ))),
              ),
            ),
          ],
        ));
  }

  Widget _buildSettingItemList(BuildContext context) {
    var iconColor = Theme.of(context).accentColor;
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(
          color: ThemeHelper.wrapColor(context, lightModeColor: Colors.white, darkModeColor: Color(0XFF333333)),
          child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    DouBanLocalizations.of(context).multilingual,
                    style: TextStyle(),
                  ),
                  Text(
                    LocaleProvider.localeName(
                        Provider.of<LocaleProvider>(context).localeIndex,
                        context),
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              leading: Icon(
                Icons.public,
                color: iconColor,
              ),
              children: <Widget>[
                Wrap(
                  children: List.generate(LocaleProvider.localeValueList.length,
                      (index) {
                    var provider = Provider.of<LocaleProvider>(context);
                    return RadioListTile(
                      value: index,
                      onChanged: (index) {
                        provider.switchLocale(index);
                      },
                      groupValue: provider.localeIndex,
                      title: Text(LocaleProvider.localeName(index, context)),
                    );
                  }),
                )
              ]),
        ),
        SizedBox(height: 12),
        Container(
          color: ThemeHelper.wrapColor(context, lightModeColor: Colors.white, darkModeColor: Color(0XFF333333)),
          child: ListTile(
            title: Text(DouBanLocalizations.of(context).night_mode),
            onTap: () {},
            leading: Transform.rotate(
              angle: -pi,
              child: Icon(
                Theme.of(context).brightness == Brightness.light
                    ? Icons.brightness_5
                    : Icons.brightness_2,
                color: iconColor,
              ),
            ),
            trailing: CupertinoSwitch(
                activeColor: Theme.of(context).accentColor,
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  switchDarkMode(context);
                }),
          ),
        ),
        Divider(height: 1),
        Container(
          color: ThemeHelper.wrapColor(context, lightModeColor: Colors.white, darkModeColor: Color(0XFF333333)),
          child: ExpansionTile(
            title: Text(DouBanLocalizations.of(context).theme_color),
            leading: Icon(
              Icons.invert_colors,
              color: Theme.of(context).accentColor,
            ),
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(Colors.primaries.length, (index) {
                      return Material(
                          color: Colors.primaries[index],
                          child: InkWell(
                            onTap: () {
                              var provider = Provider.of<ThemeProvider>(context,
                                  listen: false);
                              // var brightness = Theme.of(context).brightness;
                              provider.switchTheme(
                                  color: Colors.primaries[index]);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                            ),
                          ));
                    })),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          color: ThemeHelper.wrapColor(context, lightModeColor: Colors.white, darkModeColor: Color(0XFF333333)),
          child: ListTile(
            title: Text(DouBanLocalizations.of(context).about),
            onTap: () {
              showToast('${DouBanLocalizations.of(context).about}...');
            },
            leading: Icon(
              Icons.create,
              color: iconColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
        Divider(height: 1),
        Container(
          color: ThemeHelper.wrapColor(context, lightModeColor: Colors.white, darkModeColor: Color(0XFF333333)),
          child: ListTile(
            title: Text(DouBanLocalizations.of(context).check_update),
            onTap: () {
              showToast('${DouBanLocalizations.of(context).check_update}...');
            },
            leading: Icon(
              Icons.cloud_download,
              color: iconColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  void switchDarkMode(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness ==
        Brightness.dark) {
      showToast("检测到系统为暗黑模式,已为你自动切换",position: ToastPosition.bottom);
    } else {
      Provider.of<ThemeProvider>(context,listen: false).switchTheme(
          userDarkMode:
          Theme.of(context).brightness == Brightness.light);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
