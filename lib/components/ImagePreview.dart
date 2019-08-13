import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';

import 'MyImage.dart';

class ImagePreview extends StatefulWidget {

  final List<String> imageSrc;

  final int defaultIndex;

  ImagePreview({
    Key key,
    @required this.imageSrc,
    this.defaultIndex = 0,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagePreviewState(imageSrc: this.imageSrc, defaultIndex: this.defaultIndex);
  }
}

class ImagePreviewState extends State<ImagePreview> {

  List<String> imageSrc;

  int defaultIndex;

  ImagePreviewState({
    Key key,
    this.imageSrc,
    this.defaultIndex
  });

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            height: height,
            width: width,
            color: Colors.black,
            child: Center(
              child: GestureDetector(
                onHorizontalDragEnd: (e) {
                  if(e.velocity.pixelsPerSecond.dx > 0) {
                    setState(() {
                      defaultIndex = defaultIndex > 0 ? defaultIndex - 1 : imageSrc.length - 1;
                    });
                  }
                  if(e.velocity.pixelsPerSecond.dx < 0) {
                    setState(() {
                      defaultIndex = defaultIndex < imageSrc.length - 1 ? defaultIndex + 1 : 0;
                    });
                  }
                },
                child: DragScaleContainer(
                  doubleTapStillScale: true,
                  child: MyNetWorkImage(
                    src: imageSrc[defaultIndex],
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            right: 0.0,
            left: 0.0,
            height: 40.0,
            child: new Text(
              (defaultIndex + 1).toString() + ' / ' + imageSrc.length.toString(),
              style: new TextStyle(
                fontSize: 16.0,
                fontFamily: 'serif',
                color: Colors.white,

              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}