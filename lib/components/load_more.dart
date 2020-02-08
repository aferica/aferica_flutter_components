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

  LoadMore({
    Key key,
    this.type = LoadMoreType.loading,
    this.icon,
    this.showIcon = true,
    this.text = '正在加载中...'
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (icon == null && type == LoadMoreType.loading) {
      icon = SpinKitFadingCircle(
        size: 20,
        color: Theme.of(context).disabledColor,
      );
    }

    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Text(text, style: Theme.of(context).textTheme.caption,)
        ],
      ),
    );
  }
}