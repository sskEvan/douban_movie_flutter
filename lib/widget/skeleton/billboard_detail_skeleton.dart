import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'movie_item_skeleton.dart';
import 'skeleton.dart';

/**
 * 榜单详情页骨架组件
 */
class BillboardDetailSkeleton extends StatelessWidget {

  BillboardDetailSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Shimmer.fromColors(
            period: Duration(milliseconds: 1200),
            baseColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.grey[350]),
            highlightColor: ThemeHelper.wrapColor(context,
                darkModeColor: Colors.grey[700], lightModeColor: Colors.grey[200]),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  width: ScreenUtil.width,
                  height: 180,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: ScreenUtil.width * 0.6,
                    height: 20,
                    decoration: SkeletonDecoration(context: context),
                  ),
                ),

                Column(
                  children:  List.generate(6, (index) {
                    return Container(
                      child: MovieItemSkeleton(showIndexNumber: true),
                    );
                  }),
                ),

              ],
            )));
  }
}
