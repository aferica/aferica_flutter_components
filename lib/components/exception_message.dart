import 'package:flutter/material.dart';

class ExceptionMessage extends StatelessWidget {

  /// 异常提醒类型
  /// net 网络相关
  /// busy 业务繁忙
  /// find 未找到
  /// message 消息相关
  ///
  final String type;

  final String msg;

  final VoidCallback onClick;

  ExceptionMessage({
    Key key,
    this.type = 'error',
    this.msg,
    this.onClick
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    String excPic = '';
    String excMsg = '';
    if (msg == null) {
      if (type == 'net') {
        excMsg = '网络请求失败，请点击图片刷新';
      } else if (type == 'busy') {
        excMsg = '业务繁忙，请点击图片刷新';
      } else if (type == 'find') {
        excMsg = '什么都没有找到';
      } else if (type == 'message') {
        excMsg = '未收到任何信息';
      } else if (type == 'image') {
        excMsg = '图片加载失败';
      }
    } else {
      excMsg = msg;
    }
    if (type == 'net') {
      excPic = 'static/images/no_net.jpg';
    } else if (type == 'busy') {
      excPic = 'static/images/busy.jpg';
    } else if (type == 'find') {
      excPic = 'static/images/no_find.jpg';
    } else if (type == 'message') {
      excPic = 'static/images/no_msg.jpg';
    } else if (type == 'image') {
      excPic = 'static/images/no_image.png';
    } else {
      excPic = type;
    }

    // TODO: implement build
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Center(
                child: Image.asset(excPic, package: 'aferica_flutter_components',),
              ),
            ),
            Text(excMsg, style: TextStyle(
                fontSize: 14
            ),),
          ],
        ),
      ),
    );
  }
}