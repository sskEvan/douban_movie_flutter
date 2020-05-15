import 'package:douban_movie_flutter/provider/locale_provider.dart';
import 'package:douban_movie_flutter/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => LocaleProvider()),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),

];
