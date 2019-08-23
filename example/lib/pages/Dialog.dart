import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class DialogPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Column(
        children: <Widget>[
          BlankRow(),
          ButtonTag(
            size: 'normal',
            type: 'success',
            text: '成功提示',
            onClick: () {

            },
          )
        ],
      ),
    );
  }
}