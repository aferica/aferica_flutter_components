import 'package:flutter/material.dart';

import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class LineAndPoint extends StatelessWidget{

  final Color lineColor;
  final Color pointColor;
  final double lineWidth;
  final double pointRadius;

  LineAndPoint({
    Key key,
    this.lineColor,
    this.pointColor,
    this.lineWidth,
    this.pointRadius,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: MyColor.grayDark),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: pointColor ?? MyColor.grayDark,
                radius: pointRadius ?? 5.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}