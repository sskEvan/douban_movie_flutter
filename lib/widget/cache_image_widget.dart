import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 图片加载组件
 */
class CacheImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double radius;
  final double width;
  final double height;

  CacheImageWidget(
      {Key key,
      @required this.url,
      this.fit = BoxFit.cover,
      this.radius = 0,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null && url.isNotEmpty
        ? SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: CachedNetworkImage(
                  fit: fit,
                  imageUrl: url,
                  placeholder: (context, url) => CommonLoadingWidget(),
                  errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Container(
                            color: Color(0xffeeeeee),
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImageHelper.wrapAssets(("error_image.png")),
                              width: width * 0.5,
                              height: width * 0.5,
                            )),
                      )),
            ))
        : SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Container(
                    color: Color(0xffeeeeee),
                    alignment: Alignment.center,
                    child: Image.asset(
                      ImageHelper.wrapAssets(("error_image.png")),
                      width: width * 0.5,
                      height: width * 0.5,
                    ))));
  }
}
