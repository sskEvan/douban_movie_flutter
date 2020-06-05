import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/**
 * 搜索框组件
 */
class SearchWidget extends StatefulWidget {
  VoidCallback onCancel;
  ValueChanged<String> onSearch;

  SearchWidget({Key key, this.onCancel, this.onSearch}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchWidgetState();
  }
}

class SearchWidgetState extends State<SearchWidget> with TickerProviderStateMixin {
  bool _offstageCancelText = true;
  double _searchTextFiledWidth;
  AnimationController _animationController;
  Animation<double> _widthAnimation;
  TextEditingController _textEditingController;
  String _keyword = "";

  @override
  void initState() {
    super.initState();
    _searchTextFiledWidth = ScreenUtil.width - 36;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    final CurvedAnimation curve =
        CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
    _widthAnimation =
        Tween(begin: ScreenUtil.width - 36, end: ScreenUtil.width - 112)
            .animate(curve)
              ..addListener(() {
                _searchTextFiledWidth = _widthAnimation.value;
                debugPrint(
                    '_searchTextFiledWidth=${_searchTextFiledWidth},ScreenUtil.width=${ScreenUtil.width}');
                if (_searchTextFiledWidth == ScreenUtil.width - 112) {
                  _offstageCancelText = false;
                }
                setState(() {});
              });
    _animationController.forward();

    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xFFF7F7F7),
              ),
              child: Container(
                  width: _searchTextFiledWidth,
                  child: TextField(
                    onSubmitted: widget.onSearch,
                    controller: _textEditingController,
                    autofocus: true,
                    minLines: 1,
                    enableInteractiveSelection: false,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText:
                          DouBanLocalizations.of(context).search_content_hint,
                      contentPadding: EdgeInsets.all(0),
                      icon: Icon(Icons.search),
                      alignLabelWithHint: true,
                      helperStyle: TextStyle(fontSize: 16),

                      //打开enabledBorder focusedBorde: 为了让文本居中
                      enabledBorder: OutlineInputBorder(
                        /*边角*/
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.transparent, //边线颜色为白色
                          width: 1, //边线宽度为2
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent, //边框颜色为白色
                          width: 1, //宽度为5
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  )),
            ),
            Offstage(
              offstage: _offstageCancelText,
              child: GestureDetector(
                onTap: widget.onCancel,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: 44,
                  child: new Text(
                    DouBanLocalizations.of(context).cancel,
                    style: new TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  setKeyword({String keyword}) {
    _keyword = keyword;
    _textEditingController.value = _textEditingController.value.copyWith(
      text: _keyword,
      selection:
      TextSelection(baseOffset: _keyword.length, extentOffset: _keyword.length),
      composing: TextRange.empty,
    );
  }

}
