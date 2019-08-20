import 'package:flutter/material.dart';

import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class ImagePreviewPage extends StatelessWidget {

  final List<String> images = [
    'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWl0oUkmIKEkcAAGPjZqsIeMAALxGgBh0CEAAY-l439.jpg',
    'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWV0oUkCIO_ERAADsT22VbBgAALxGQM2JycAAOxn178.jpg',
    'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWl0oUkmIKEkcAAGPjZqsIeMAALxGgBh0CEAAY-l439.jpg',
    'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWV0oUkCIO_ERAADsT22VbBgAALxGQM2JycAAOxn178.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 120.0,
          ),
          child: Column(
            children: images.map((image) {
              return new ConstrainedBox(
                  constraints: new BoxConstraints(
                  minHeight: MediaQuery.of(context).size.width / 2,
                ),
                child: MyNetWorkImage(
                  onClick: () {
                    int index = images.indexOf(image);
                    showGeneralDialog(
                      context: context,
                      barrierLabel: "你好",
                      barrierDismissible: true,
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return Center(
                          child: ImagePreview(imageSrc: images, defaultIndex: index,),
                        );
                      },
                      barrierColor: Colors.black,
                    );
//                    Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => ImagePreview(imageSrc: images, defaultIndex: index,)));
                  },
                  src: image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}