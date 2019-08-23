import 'package:flutter/material.dart';

import 'package:aferica_flutter_components/aferica_flutter_components.dart';

import 'pages/ImagePreview.dart';
import 'pages/Timeline.dart';
import 'pages/Dialog.dart';
import 'pages/ButtonTag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'aferica_flutter_components'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTag(
            text: 'Color -- 主题',
            type: 'success',
            size: 'big',
//            hairline: true,
            radius: 0,
            onClick: () {
              showGeneralDialog(
                context: context,
                barrierLabel: "你好",
                barrierDismissible: true,
                transitionDuration: Duration(milliseconds: 100),
                pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                  return Center(
                    child: Material(
                      child: Container(
                        color: Colors.black.withOpacity(animation.value),
                        child: Text("我是一个可变的"),
                      ),
                    ),
                  );
                },
                barrierColor: Colors.black,
              );
            },
          ),
          BlankRow(),
          ButtonTag(
            text: 'Button And Tag -- 按钮和标签',
            type: 'success',
            size: 'big',
//            hairline: true,
            radius: 0,
            onClick: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => ButtonTagPage()));
            },
          ),
          BlankRow(),
          ButtonTag(
            text: 'Image -- 图片',
            type: 'success',
            size: 'big',
//            hairline: true,
            radius: 0
          ),
          BlankRow(),
          ButtonTag(
            text: 'ExceptionMessage -- 异常信息',
            type: 'success',
            size: 'big',
//            hairline: true,
            radius: 0
          ),
          BlankRow(),
          ButtonTag(
            text: 'Dialog -- 弹框',
            type: 'default',
            size: 'big',
//            hairline: true,
            radius: 0,
            onClick: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => DialogPage()));
            },
          ),
          BlankRow(),
          ButtonTag(
            text: 'ImagePreview -- 图片预览',
            type: 'default',
            size: 'big',
//            hairline: true,
            radius: 0,
            onClick: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => ImagePreviewPage()));
            },
          ),
          BlankRow(),
          ButtonTag(
            text: 'Timeline -- 时间线',
            type: 'default',
            size: 'big',
//            hairline: true,
            radius: 0,
            onClick: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => TimelinePage()));
            },
          )
        ],
      ),
    );
  }
}
