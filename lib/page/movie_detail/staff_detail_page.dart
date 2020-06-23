import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/staff_detail_vo.dart';
import 'package:douban_movie_flutter/provider/staff_detail_provider.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/common_section_widget.dart';
import 'package:douban_movie_flutter/widget/movie_item_widget2.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:douban_movie_flutter/widget/common_empty_widget.dart';
import 'package:douban_movie_flutter/widget/common_error_widget.dart';
import 'package:douban_movie_flutter/widget/expandable_text.dart';
import 'package:douban_movie_flutter/widget/skeleton/staff_detail_skeleton.dart';
import 'package:douban_movie_flutter/widget/view_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class StaffDetailPage extends StatefulWidget {
  final String id;

  StaffDetailPage(this.id, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StaffDetailState();
  }
}

class _StaffDetailState extends State<StaffDetailPage> {
  StaffDetailVo _staffDetailVo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            DouBanLocalizations.of(context).staff_info,
            style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87)),
          ),
          backgroundColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.white),
          leading: IconButton(
            icon: Icon(Icons.close, color: ThemeHelper.wrapDarkColor(context, Colors.black87)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ViewStateWidget<StaffDetailProvider>(
          provider: StaffDetailProvider(context),
          onProviderReady: (provider) async {
            await provider.initData(arguments: widget.id);
          },
          builder: (context, StaffDetailProvider provider, child) {
            if (provider.isBusy) {
              return StaffDetailSkeleton();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData());
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError, onPressed: provider.initData);
            }
            _staffDetailVo = provider.staffDetailVo;
            return _buildBody(context);
            //return StaffDetailSkeleton();
          },
        ));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
          height: ScreenUtil.height,
          color: ThemeHelper.wrapDarkBackgroundColor(context, Colors.white),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(context),
              _buildIntronduce(context),
              SizedBox(height: 15),
              Offstage(
                offstage: _staffDetailVo.works == null ||
                    _staffDetailVo.works.length == 0,
                child: _buildSection(
                    title: DouBanLocalizations.of(context).movie,
                    action: DouBanLocalizations.of(context).all,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteName.celebrityWorksPage,
                          arguments: _staffDetailVo.id);
                    }),
              ),
              Offstage(
                offstage: _staffDetailVo.works == null ||
                    _staffDetailVo.works.length == 0,
                child: SizedBox(height: 10),
              ),
              _buildWorks(),
              Offstage(
                  offstage: _staffDetailVo.works == null ||
                      _staffDetailVo.works.length == 0,
                  child: SizedBox(height: 15)),
              Offstage(
                  offstage: _staffDetailVo.photos == null ||
                      _staffDetailVo.photos.length == 0,
                  child: _buildSection(
                      title: DouBanLocalizations.of(context).photo,
                      action: DouBanLocalizations.of(context).all,
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteName.photoListPage,
                            arguments: [
                              'celebrity/${_staffDetailVo.id}/photos',
                              1000
                            ]);
                      })),
              SizedBox(height: 10),
              _buildPhotoes(),
              SizedBox(height: 30),
            ],
          )),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CacheImageWidget(
            url: _staffDetailVo.avatars.medium,
            radius: 5,
            width: 100,
            height: 130,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _staffDetailVo.name,
                    style: TextStyle(
                        color: ThemeHelper.wrapDarkColor(context, Colors.black),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    _staffDetailVo.nameEn,
                    style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    _staffDetailVo.bornPlace,
                    style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    width: 100,
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: ThemeHelper.wrapDarkColor(context, Colors.white),
                        size: 16,
                      ),
                      label: Text(
                        DouBanLocalizations.of(context).follow,
                        style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.white), fontSize: 16),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showToast(
                            "${DouBanLocalizations.of(context).follow}${_staffDetailVo.name}",
                            context: context);
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget _buildIntronduce(BuildContext context) {
    return Container(
        width: ScreenUtil.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              '${DouBanLocalizations.of(context).birthday}:  ${_staffDetailVo.birthday}',
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 6),
            Text(
              '${DouBanLocalizations.of(context).sex}:  ${_staffDetailVo.gender}',
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 6),
            Text(
              '${DouBanLocalizations.of(context).more_chinese_name}:  ${_getString(_staffDetailVo.aka)}',
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 15),
            ),
            SizedBox(height: 6),
            Text(
              '${DouBanLocalizations.of(context).more_english_name}:  ${_getString(_staffDetailVo.akaEn)}',
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 15),
            ),
            SizedBox(height: 6),
            ExpandableText(
              text:
                  '${DouBanLocalizations.of(context).summary}: ${_staffDetailVo.summary.isEmpty ? DouBanLocalizations.of(context).none : _staffDetailVo.summary.isEmpty}',
              maxLines: 4,
              style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 15),
              expand: false,
            ),
          ],
        ));
  }

  String _getString(List<String> data) {
    if (data == null || data.length == 0) {
      return DouBanLocalizations.of(context).none;
    }
    StringBuffer sb = StringBuffer();
    data.forEach((it) {
      sb.write(it);
      sb.write(",  ");
    });
    return sb.toString().substring(0, sb.length - 3);
  }

  Widget _buildSection({String title, String action, VoidCallback onTap}) {
    return CommonSection(
      title: title,
      action: action,
      titleStyle: TextStyle(
          color: ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 18, fontWeight: FontWeight.bold),
      actionStyle: TextStyle(
        color: ThemeHelper.wrapDarkColor(context, Colors.black45),
        fontSize: 15,
      ),
      onTap: onTap,
    );
  }

  Widget _buildWorks() {
    return Offstage(
      offstage:
          _staffDetailVo.works == null || _staffDetailVo.works.length == 0,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_staffDetailVo.works.length, (index) {
              MovieItemVo item = _staffDetailVo.works[index].movieItemVo;
              return MovieItemWidget2(movieItemVo: item);
            }),
          ),
      ),
    );
  }

  Widget _buildPhotoes() {
    var itemWidth = (ScreenUtil.width - 60) / 4;
    var itemHeight = itemWidth * 4 / 3;
    return Offstage(
        offstage:
            _staffDetailVo.photos == null || _staffDetailVo.photos.length == 0,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_staffDetailVo.photos.length, (index) {
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: itemWidth,
                      height: itemHeight,
                      child: CacheImageWidget(
                        url: _staffDetailVo.photos[index].cover,
                        radius: 5,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              }),
            )));
  }
}
