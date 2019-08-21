import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class TimelinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('时间线'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 120.0,
          ),
          child: Column(
            children: <Widget>[
              Timeline(
                date: '2019-08-21 11:47',
                child: Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyNetWorkImage(
                        src: 'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWl0oUkmIKEkcAAGPjZqsIeMAALxGgBh0CEAAY-l439.jpg',
                      )
                    ],
                  ),
                ),
              ),
              Timeline(
                date: '2019-08-20 10:00',
                child: Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyNetWorkImage(
                        src: 'http://desk.fd.zol-img.com.cn/t_s960x600c5/g2/M00/0D/0E/ChMlWV0oUkCIO_ERAADsT22VbBgAALxGQM2JycAAOxn178.jpg',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}