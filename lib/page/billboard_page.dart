import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillboardPage extends StatefulWidget {
  @override
  State<BillboardPage> createState() {
    return BillboardState();
  }
}

class BillboardState extends State<BillboardPage> {

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return new Scaffold(
      appBar: AppBar(
        title: Text(DouBanLocalizations.of(context).billboard),
      ),
      body: Center(
        child: Text(DouBanLocalizations.of(context).billboard),
      ),
    );
  }
}
