import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/page/billboard_page.dart';
import 'package:douban_movie_flutter/page/mine_page.dart';
import 'package:douban_movie_flutter/page/projection_page.dart';
import 'package:flutter/material.dart';

/**
 * 首页索引页
 */
List<Widget> pages = [
  ProjectionPage(),
  BillboardPage(),
  MinePage()
];

class IndexPage extends StatefulWidget {

  IndexPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }

}

class _IndexState extends State<IndexPage> {
  DateTime _lastPressedTime;
  var _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedTime = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
            itemBuilder: (context, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
          },
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.palette),
              title: Text(DouBanLocalizations.of(context).projection),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text(DouBanLocalizations.of(context).billboard),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(DouBanLocalizations.of(context).mine),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        )
    );
  }
}
