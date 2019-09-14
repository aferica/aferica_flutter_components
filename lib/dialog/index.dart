import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/button_tag/index.dart';

class LoadingDialog extends StatelessWidget {
  // 主标题
  final String title;
  //
  final String description;

  LoadingDialog({
    Key key,
    this.title = '正在加载，请稍等...',
    this.description = '初始化中，可能会导致加载一段时间，请耐心等待'
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.8,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.64 + 100,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0.0),
                height: MediaQuery.of(context).size.width * 0.64,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage('static/gifs/loading.gif',),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              Container(
                height: 60,
                child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    height: 2.0
                  )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
