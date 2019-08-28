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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BlankRow(),
            Text('按钮类型'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  size: 'normal',
                  text: 'default',
                  type: 'default',
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'success',
                  type: 'success',
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'info',
                  type: 'info',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  size: 'normal',
                  text: 'danger',
                  type: 'danger',
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'error',
                  type: 'error',
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'custom',
                  type: 'custom',
                  bgColor: Colors.black87
                ),
              ],
            ),
            BlankRow(),
            Text('按钮大小'),
            ButtonTag(
              size: 'big',
              text: 'big',
              type: 'success',
            ),
            ButtonTag(
              size: 'small',
              text: 'small',
              type: 'danger',
            ),
            ButtonTag(
              size: 'normal',
              text: 'normal',
              type: 'success',
            ),
            BlankRow(),
            Text('边框按钮'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  size: 'normal',
                  text: 'default',
                  type: 'default',
                  hairline: true,
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'success',
                  type: 'success',
                  hairline: true,
                ),
                ButtonTag(
                  size: 'normal',
                  text: 'info',
                  type: 'info',
                  hairline: true,
                ),
              ],
            ),
            BlankRow(),
            Text('圆角按钮'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  text: '5.0 radius',
                  type: 'success',
                  radius: 5.0,
                ),
                ButtonTag(
                  text: '10.0 radius',
                  type: 'success',
                  radius: 10.0,
                ),
                ButtonTag(
                  text: '18.0 radius',
                  type: 'info',
                  radius: 18.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  text: '5.0 radius',
                  type: 'success',
                  radius: 5.0,
                  hairline: true,
                ),
                ButtonTag(
                  text: '10.0 radius',
                  type: 'success',
                  radius: 10.0,
                  hairline: true,
                ),
                ButtonTag(
                  text: '18.0 radius',
                  type: 'info',
                  radius: 18.0,
                  hairline: true,
                ),
              ],
            ),
            BlankRow(),
            Text('禁用按钮'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  text: '5.0 radius',
                  type: 'success',
                  radius: 5.0,
                  disabled: true,
                ),
                ButtonTag(
                  text: '18.0 radius',
                  type: 'info',
                  radius: 18.0,
                  disabled: true,
                ),
                ButtonTag(
                  text: '18.0 radius',
                  type: 'info',
                  radius: 18.0,
                  hairline: true,
                  disabled: true,
                ),
              ],
            ),
            BlankRow(),
            Text('图标按钮'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTag(
                  text: '左侧图标',
                  type: 'success',
                  icon: Icons.info,
                ),
                ButtonTag(
                  text: '左侧图标',
                  type: 'info',
                  radius: 18.0,
                  hairline: true,
                  icon: Icons.info,
                ),
                ButtonTag(
                  text: '右侧图标',
                  type: 'info',
                  hairline: true,
                  icon: Icons.info,
                  rightIcon: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}