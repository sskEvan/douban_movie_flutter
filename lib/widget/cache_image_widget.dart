import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/widget/common_loading_widget.dart';
import 'package:flutter/cupertino.dart';

/**
 * 图片加载组件
 */
class CacheImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double radius;

  CacheImageWidget(
      {Key key, @required this.url, this.fit = BoxFit.cover, this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: CachedNetworkImage(
              fit: fit,
              imageUrl: url,
              placeholder: (context, url) => CommonLoadingWidget(),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageHelper.wrapAssets(("error_image.png"))),
            ),
          )
        : Center(
            child: Image.asset(ImageHelper.wrapAssets("image_error.png"),
                fit: BoxFit.scaleDown),
          );
  }
}
