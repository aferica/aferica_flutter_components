import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {

  final Color color;
  final double size;

  Loading({
    Key key,
    this.color,
    this.size = 60.0
  }):super(key: key);

//  final String
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SpinKitCircle(
      color: color ?? Colors.deepOrange,
      size: size,
    );
  }
}