import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyNetWorkImage extends StatelessWidget {
  final String src;
  final double width;
  final double height;
  final BoxFit fit;

  MyNetWorkImage({
    Key key,
    @required this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      fit: fit,
      imageUrl: src,
      width: width,
      height: height,
      placeholder: (context, url) => new Container(
        width: width,
        height: height,
        child: Center(
          child: SpinKitWave(
            color: Colors.deepOrange,
            size: 20.0,
          ),
        ),
      ),
      errorWidget: (context, url, error) => new Container(
        width: width,
        height: height,
        child: new Image.asset('static/images/404.jpg', fit: BoxFit.cover,),
      ),
    );
  }
}