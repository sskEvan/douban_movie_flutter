import 'package:douban_movie_flutter/model/locale_model.dart';
import 'package:douban_movie_flutter/model/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,

];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => LocaleModel()),
  ChangeNotifierProvider(create: (_) => ThemeModel()),

];