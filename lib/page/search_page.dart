import 'dart:convert';

import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/search_keyword_vo.dart';
import 'package:douban_movie_flutter/service/storage_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchPage> {
  final String _kHistoryKeywords = 'kHistoryKeywords';
  bool _offstageHistoryKeywordTags = false;
  List<String> _keywordList = [];
  final GlobalKey<SearchWidgetState> searchKey = GlobalKey<SearchWidgetState>();

  @override
  void initState() {
    super.initState();
    _fetchHistoryKeywords();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SearchWidget(
              key: searchKey,
              onCancel: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.of(context).pop();
              },
              onSearch: (keyword) {
                _search(keyword);
              }),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: <Widget>[
              _buildHistoryKeywordTags(),
              _buildSearchResult(context)
            ],
          ),
        ));
  }

  void _search(String keyword) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (keyword.isEmpty) {
      showToast(DouBanLocalizations.of(context).search_content_no_empty);
    } else {
      _saveHistoryKeyword(keyword);
      _offstageHistoryKeywordTags = true;
      setState(() {});
    }
  }

  void _fetchHistoryKeywords() {
    String historyKeywordsJson =
        StorageManager.sharedPreferences.getString(_kHistoryKeywords) ?? '';
    if (historyKeywordsJson != null && historyKeywordsJson.isNotEmpty) {
      Map map = json.decode(historyKeywordsJson);
      _keywordList = SearchKeywordVo.fromJson(map).keywords;
    }
  }

  void _saveHistoryKeyword(String keyword) {
    List<String> newKeywordList = [];
    bool exist = false;
    _keywordList.forEach((it) {
      if (it.compareTo(keyword) == 0) {
        exist = true;
      }
      if (!exist) {
        newKeywordList.add(it);
      }
    });
    newKeywordList.add(keyword);
    SearchKeywordVo searchKeywordVo =
        new SearchKeywordVo(keywords: newKeywordList);
    var newKeywordsJson = json.encode(searchKeywordVo);
    StorageManager.sharedPreferences
        .setString(_kHistoryKeywords, newKeywordsJson);
  }

  void _clearHistoryKeywords() {
    StorageManager.sharedPreferences.remove(_kHistoryKeywords);
    _keywordList = [];
    setState(() {});
  }

  Widget _buildHistoryKeywordTags() {
    return Offstage(
      offstage: _offstageHistoryKeywordTags || _keywordList.length == 0,
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    DouBanLocalizations.of(context).recently_search,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  InkWell(
                    onTap: () {
                      _clearHistoryKeywords();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      size: 22,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: List.generate(
                  _keywordList.length,
                  (index) => GestureDetector(
                      onTap: () {
                        searchKey.currentState
                            .setKeyword(keyword: _keywordList[index]);
                        _search(_keywordList[index]);
                      },
                      child: Chip(
                          label: Text(
                        _keywordList[index],
                        style: TextStyle(fontSize: 14),
                      ))),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildSearchResult(BuildContext context) {
    return Offstage(
      offstage: !_offstageHistoryKeywordTags,
      child: CommonEmptyWidget(
        message: DouBanLocalizations.of(context).search_error_tip,
        onPressed: () {
          showToast('不要挣扎拉～～～');
        },
      ),
    );
  }
}
