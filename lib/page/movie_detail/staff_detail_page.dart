import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/staff_detail_vo.dart';
import 'package:douban_movie_flutter/provider/staff_detail_provider.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/billboard_section_widget.dart';
import 'package:douban_movie_flutter/widget/billboard_top250_item_widget.dart';
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
            '影人信息',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: ViewStateWidget<StaffDetailProvider>(
          provider: StaffDetailProvider(context),
          onProviderReady: (provider) async {
            await provider.initData(widget.id);
          },
          builder: (context, StaffDetailProvider provider, child) {
            if (provider.isBusy) {
              return StaffDetailSkeleton();
            } else if (provider.isEmpty) {
              return CommonEmptyWidget(onPressed: provider.initData(widget.id));
            } else if (provider.isError) {
              return CommonErrorWidget(
                  error: provider.viewStateError,
                  onPressed: provider.initData(widget.id));
            }
            _staffDetailVo = provider.staffDetailVo;
            return _buildBody();
          },
        ));
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              _buildIntronduce(),
              SizedBox(height: 10),
              Offstage(
                offstage: _staffDetailVo.works == null ||
                    _staffDetailVo.works.length == 0,
                child: _buildSection(
                  title: '影视',
                  action: '全部',
                ),
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
                  child: SizedBox(height: 10)),
              Offstage(
                  offstage: _staffDetailVo.photos == null ||
                      _staffDetailVo.photos.length == 0,
                  child: _buildSection(
                    title: '相册',
                    action: '全部',
                  )),
              SizedBox(height: 10),
              _buildPhotoes(),
              SizedBox(height: 30),
            ],
          )),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 130,
            child: CacheImageWidget(
              url: _staffDetailVo.avatars.medium,
              radius: 5,
            ),
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
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    _staffDetailVo.nameEn,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    _staffDetailVo.bornPlace,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    width: 100,
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                      label: Text(
                        "关注",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showToast("关注${_staffDetailVo.name}", context: context);
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

  Widget _buildIntronduce() {
    return Container(
        width: ScreenUtil.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              '出生日期:  ${_staffDetailVo.birthday}',
              style: TextStyle(color: Colors.black87, fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 6),
            Text(
              '性别:  ${_staffDetailVo.gender}',
              style: TextStyle(color: Colors.black87, fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 6),
            Text(
              '更多外文名:  ${_getString(_staffDetailVo.aka)}',
              style: TextStyle(color: Colors.black87, fontSize: 15),
            ),
            SizedBox(height: 6),
            Text(
              '更多英文名:  ${_getString(_staffDetailVo.akaEn)}',
              style: TextStyle(color: Colors.black87, fontSize: 15),
            ),
            SizedBox(height: 6),
            ExpandableText(
              text:
                  '简介: ${_staffDetailVo.summary.isEmpty ? '暂无' : _staffDetailVo.summary.isEmpty}',
              maxLines: 4,
              style: TextStyle(color: Colors.black87, fontSize: 15),
              expand: false,
            ),
          ],
        ));
  }

  String _getString(List<String> data) {
    if (data == null || data.length == 0) {
      return '暂无';
    }
    StringBuffer sb = StringBuffer();
    data.forEach((it) {
      sb.write(it);
      sb.write(",  ");
    });
    return sb.toString().substring(0, sb.length - 3);
  }

  Widget _buildSection({String title, String action}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          child: Row(
            children: <Widget>[
              Text(
                action ?? '',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.black45,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildWorks() {
    return Offstage(
      offstage:
          _staffDetailVo.works == null || _staffDetailVo.works.length == 0,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Expanded(
          child: Row(
            children: List.generate(_staffDetailVo.works.length, (index) {
              MovieItemVo item = _staffDetailVo.works[index].movieItemVo;
              return BillboardTop250ItemWidget(movieItemVo: item);
            }),
          ),
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
