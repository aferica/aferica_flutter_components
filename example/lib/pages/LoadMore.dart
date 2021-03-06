import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class LoadMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LoadMore'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: LoadMore(),
            ),
            Divider(),
            LoadMore(text: '请稍等...',),
            Divider(),
            LoadMore(height: 60,),
            Divider(),
            LoadMore(
              type: LoadMoreType.noDate,
            )
          ],
        ),
      ),
    );
  }
}
