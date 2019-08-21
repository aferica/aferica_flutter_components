import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class Timeline extends StatelessWidget {
  /// src: 日期
  /// src: date
  final String date;
  /// child
  final Widget child;
  final Color lineColor;
  final Color pointColor;
  final double lineWidth;
  final double pointRadius;
  final bool showHeader;

  Timeline({
    Key key,
    this.date,
    @required this.child,
    this.lineColor,
    this.pointColor,
    this.lineWidth,
    this.pointRadius,
    this.showHeader = true
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
                left: BorderSide(color: MyColor.grayDark, width: 2.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(date, style: TextStyle(color: MyColor.grayDark),),
                child
              ],
            ),
          ),
        ),
        Positioned(
            top: 10.0,
            left: 10.0,
            child:
//            IconButton(
//              iconSize: 20,
//              icon: Icon(Icons.access_time, size: 16.0, color: MyColor.green,),
//            )
            CircleAvatar(
              backgroundColor: MyColor.green,
              radius: 10.0,
              child: Icon(Icons.access_time, size: 20.0, color: Colors.white,),
            )
        )
      ],
    );
  }
}