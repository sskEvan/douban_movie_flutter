import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/provider/locale_provider.dart';
import 'package:douban_movie_flutter/provider/theme_provider.dart';
import 'package:douban_movie_flutter/service/provider_manager.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/service/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

main() async {
  ///Provider如果与Listenable/一起使用，现在抛出Stream。
  ///考虑使用ListenableProvider/ StreamProvider代替。
  ///或者可以通过设置Provider.debugCheckInvalidValueType 为null这样来禁用此异常
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();

  runApp(DouBanApp());

  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class DouBanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: providers,
        child: Consumer2<ThemeProvider, LocaleProvider>(
            builder: (context, themeModel, localeModel, child) {
          return RefreshConfiguration(
              hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
              child: MaterialApp(
                theme: themeModel.themeData(),
                darkTheme: themeModel.themeData(platformDarkMode: true),
                locale: localeModel.locale,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  // 本地化的代理类
                  DouBanLocalizations.delegate,
                  //下拉刷新
                  RefreshLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                //这句必须加上,否则切换语言后不会自动刷新
                supportedLocales: DouBanLocalizations.delegate.supportedLocales,
                onGenerateRoute: Router.generateRoute,
                initialRoute: RouteName.splash,
              ));
        }),
      ),
      radius: 5,
    );
  }
}
