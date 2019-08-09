import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        child: MyNetWorkImage(
          src: imageSrc[defaultIndex],
          width: width,
          fit: BoxFit.fitWidth,
        ),
      ),
//      child: Center(
//        child: ListView.builder(
//          scrollDirection: Axis.horizontal,
//          padding: const EdgeInsets.all(0.0),
//          primary: false,
//          itemExtent: width,
//          //内容适配
//          shrinkWrap: true,
//          //item 数量
//          itemCount: imageSrc.length,
//          itemBuilder: (BuildContext _content,int i){
//            if(i < imageSrc.length) {
//              return GestureDetector(
//                onTap: () {
////                  Routes.router.navigateTo(context, '/japav/actor/info/${actors[i]['info'][0]['_id']}');
//                },
//                child: MyNetWorkImage(
//                  src: imageSrc[i],
//                  fit: BoxFit.fitWidth,
//                  width: width,
//                ),
//              );
//            }
//          },
//        ),
//      ),
    );
  }
}