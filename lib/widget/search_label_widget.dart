import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 搜索框组件
 */
class SearchLabelWidget extends StatelessWidget {
  VoidCallback onTap;

  SearchLabelWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 18),
            color: Color(0xFFF7F7F7),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(18),
//          color: Color(0xFFF7F7F7),
//        ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.black38,
                  size: 24,
                ),
                SizedBox(width: 16),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Text(
                    '${DouBanLocalizations.of(context).search_content_hint}',
                    style: TextStyle(
                        fontSize: 14,
                        textBaseline: TextBaseline.alphabetic,
                        color: Colors.black38),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
