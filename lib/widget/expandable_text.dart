import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 可伸缩文本组件
 */
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  bool expand;

  ExpandableText(
      {this.text, this.maxLines, this.style, this.expand: false, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpandableState(
        text: text, maxLines: maxLines, style: style, expand: expand);
  }
}

class ExpandableState extends State<ExpandableText> {
  final String text;
  final int maxLines;
  final TextStyle style;
  bool expand;

  ExpandableState({this.text, this.maxLines, this.style, this.expand: false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: text ?? '', style: style);
      final textPainter = TextPainter(
          text: span, maxLines: maxLines, textDirection: TextDirection.ltr);

      textPainter.layout(maxWidth: size.maxWidth);

      if (textPainter.didExceedMaxLines) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            expand
                ? Text(text ?? '', style: style)
                : Text(text ?? '',
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: style),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  expand = !expand;
                });
              },
              child: Container(
                padding: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(expand ? DouBanLocalizations.of(context).pack_up : DouBanLocalizations.of(context).open,
                        style: TextStyle(
                            fontSize: style != null ? style.fontSize : 14,
                            color: style != null
                                ? style.color.withAlpha(100)
                                : Color(0xAAFFFFFF))),
                    Icon(
                        expand
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: style != null
                            ? style.color.withAlpha(100)
                            : Color(0xAAFFFFFF),
                        size: style != null ? style.fontSize + 4 : 18)
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return Text(text ?? '', style: style);
      }
    });
  }
}
