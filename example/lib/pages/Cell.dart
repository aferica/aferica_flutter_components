import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class CellPage extends StatelessWidget {
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
            Cell(
              title: '单元',
              value: '内容',
              showRightIcon: true,
              leftBlank: 10.0,
              leftIcon: Icons.location_on,
            ),
            Cell(
              title: '单元，测试内容过长对显示的影响',
              value: '内容，测试内容过长对显示的影响',
//              showRightIcon: true,
              leftBlank: 10.0,
//              leftIcon: Icons.people,
            ),
            Cell(
              title: '单元',
              value: '内容',
//              showRightIcon: true,
              leftBlank: 10.0,
//              leftIcon: Icons.people,
            ),
            Cell(
              title: '单元',
              value: '内容',
//              showRightIcon: true,
              isBig: true,
//              leftIcon: Icons.people,
            ),
            Cell(
              title: '单元',
              value: '内容',
              showRightIcon: true,
              leftBlank: 10.0,
              leftIcon: Icons.star,
            )
          ],
        ),
      ),
    );
  }
}
