import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:flutter/material.dart';


class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return new Scaffold(
      appBar: AppBar(
        title: Text(DouBanLocalizations.of(context).mine),
      ),
      body: Center(
        child: Text(DouBanLocalizations.of(context).mine),
      ),
    );
  }
}
