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

class CloseAppDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  CloseAppDialog({
    Key key,
    this.onConfirm
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return AssetGiffyDialog(
//      image: Image.asset('static/gifs/360430.gif', fit: BoxFit.cover,),
//      title: Text('确定要离开我吗？',
//        textAlign: TextAlign.center,
//        style: TextStyle(
//          fontSize: 22.0,
//          fontWeight: FontWeight.w600,
//          height: 3.0
//        )
//      ),
//      buttonOkText: Text('残忍离开', style: TextStyle(color: Colors.white),),
//      buttonCancelText: Text('哎呀，我开玩笑的呀', style: TextStyle(color: Colors.white),),
//      onOkButtonPressed: onConfirm,
//    );
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0.0),
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage('static/gifs/360430.gif'),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: Text('确定要离开我吗？',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        height: 2.0
                    )
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.4 - 2,
                    child: Center(
                      child: ButtonTag(
                        size: 'small',
                        type: 'success',
                        text: '留下',
                        onClick: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.4 - 2,
                    child: Center(
                      child: ButtonTag(
                        size: 'small',
                        type: 'danger',
                        text: '残忍离开',
                        onClick: onConfirm,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}