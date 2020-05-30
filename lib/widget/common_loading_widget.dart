import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child:  CircularProgressIndicator(
          backgroundColor: Color(0xAAEEEEEE),
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xAACCCCCC))),
    );
  }
}
