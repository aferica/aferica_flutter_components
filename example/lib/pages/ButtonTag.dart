import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class ButtonTagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonTag'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlankRow(),
            ButtonTag(
              size: 'big',
              text: 'big',
              hairline: true,
              type: 'success',
            ),
            BlankRow(),
            ButtonTag(
              size: 'small',
              text: 'small',
              type: 'success',
            ),
            BlankRow(),
            ButtonTag(
              size: 'normal',
              text: 'normal',
              type: 'success',
            ),
          ],
        ),
      ),
    );
  }
}