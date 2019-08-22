import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class Timeline extends StatelessWidget {
  /// src: 日期
  /// src: date
  final String date;
  /// child
  final Widget child;
  final Color lineColor;
  final Color pointBgColor;
  final Color pointIconColor;
  final double lineWidth;
  final double pointRadius;
  final bool showHeader;

  final TextStyle dateStyle;

  Timeline({
    Key key,
    this.date,
    @required this.child,
    this.lineColor,
    this.pointBgColor,
    this.pointIconColor,
    this.lineWidth = 2.0,
    this.pointRadius = 12.0,
    this.showHeader = true,
    this.dateStyle
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: Container(
            width: width - 30.0,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: lineColor ?? pointBgColor ?? MyColor.green, width: lineWidth),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(date, style: dateStyle ?? TextStyle(color: MyColor.grayDark, fontSize: 14, height: 1.2),),
                child
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 20.0 + lineWidth / 2 - pointRadius,
          child: CircleAvatar(
            backgroundColor: pointBgColor ?? lineColor ?? MyColor.green,
            radius: pointRadius,
            child: Icon(Icons.access_time, size: pointRadius * 2, color: pointIconColor ?? Colors.white,),
          )
        )
      ],
    );
  }
}