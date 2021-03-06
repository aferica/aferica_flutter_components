import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyNetWorkImage extends StatelessWidget {
  /// src: 图片地址
  /// src: image's src
  final String src;
  /// width: 图片宽度度
  /// width: image's width
  final double width;
  /// height: 图片高度
  /// height: image's height
  final double height;
  /// height: 图片最小高度
  /// height: image's min height
  final double minHeight;
  /// fit: 图片适配方式
  /// fit: image adaptation method
  final BoxFit fit;
  /// error: 自定义错误提示
  /// error: custom error widget
  final Widget error;
  /// placeholder: 自定义加载动画
  /// placeholder: custom placeholder
  final Widget placeholder;
  /// loadingColor: 加载动画颜色（placeholder不为空时无效）
  /// loadingColor: loading's color(it is Invalid when placeholder is not empty)
  final Color loadingColor;
  /// 点击事件
  final VoidCallback onClick;
  /// httpHeaders
  final Map<String, String> headers;


  MyNetWorkImage({
    Key key,
    @required this.src,
    this.width,
    this.height,
    this.minHeight,
    this.fit = BoxFit.cover,
    this.error,
    this.placeholder,
    this.loadingColor,
    this.onClick,
    this.headers
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      constraints: BoxConstraints(
        minHeight: minHeight ?? height ?? MediaQuery.of(context).size.width / 16 * 9,
      ),
      child: GestureDetector(
        onTap: onClick,
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: src,
          width: width,
          height: height,
          httpHeaders: headers ?? {},
          placeholder: (context, url) => placeholder ?? Center(
            child: SpinKitWave(
              color: loadingColor ?? Colors.deepOrange,
              size: 20.0,
            ),
          ),
          errorWidget: (context, url, err) => Center(
            child: error ?? Image.asset(
              'static/images/no_find.jpg',
              package: 'aferica_flutter_components',
              width: width != null && width> 0 ? width / 2 : 200,
              height: height != null && height > 0 ? height / 2 : 200,
            )
          ),
        ),
      ),
    );
  }
}