import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
            backgroundColor: Color(0xAAEEEEEE),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xAACCCCCC))));
  }
}
