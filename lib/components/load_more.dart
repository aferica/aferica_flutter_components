import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadMoreType {
  loading,
  noDate
}

class LoadMore extends StatelessWidget {

  /// 类型
  LoadMoreType type;
  /// 加载动画
  Widget icon;
  /// 是否显示图标
  bool showIcon;
  /// 提示文字
  String text;
  /// 高度
  double height;
  /// 大小
  double iconSize;
  /// 大小
  double fontSize;

  LoadMore({
    Key key,
    this.type = LoadMoreType.loading,
    this.icon,
    this.showIcon = true,
    this.text = '正在加载中...',
    this.height = 40.0,
    this.iconSize = 24,
    this.fontSize = 16
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (icon == null && type == LoadMoreType.loading) {
      icon = SpinKitFadingCircle(
        size: iconSize,
        color: Theme.of(context).disabledColor,
      );
    }

    if (text == '正在加载中...' && type == LoadMoreType.noDate) {
      text = '我是有底线的';
    }

    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          type == LoadMoreType.loading ? icon : Container(width: fontSize * 3, height: 1.0, color: Theme.of(context).disabledColor,),
          Container(
            padding: EdgeInsets.only(left: fontSize / 2, right: fontSize / 2),
            child: Text(text, style: TextStyle(
              color: Theme.of(context).disabledColor,
              fontSize: fontSize,
            ),),
          ),
          type == LoadMoreType.loading ? Text('') : Container(width: fontSize * 3, height: 1.0, color: Theme.of(context).disabledColor,),
        ],
      ),
    );
  }
}