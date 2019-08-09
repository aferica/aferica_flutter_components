import 'package:flutter/material.dart';

import 'MyColor.dart';

class ButtonTag extends StatelessWidget {
  // 按钮高度（有size时无效）
  final double height;
  // 按钮宽度（有size时无效）
  final double width;
  // 按钮大小，可选择有：big、small、normal、custom
  final String size;
  // 按钮类型，可选择有：default、success、info、danger、error、custom
  final String type;
  // 按钮背景色（有type时无效）
  final Color bgColor;
  // 是否细边框
  final bool hairline;
  // 是否不可用
  final bool disabled;
  // 圆角大小
  final double radius;
  // 文字
  final String text;
  // 文字大小(优先级最高)
  final double textSize;
  // 点击事件
  final VoidCallback onClick;

  ButtonTag({
    Key key,
    this.height,
    this.width,
    this.size = 'normal',
    this.type = 'default',
    this.bgColor,
    this.hairline = false,
    this.disabled = false,
    this.radius = 8.0,
    this.text,
    this.textSize,
    this.onClick
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = width;
    double containerHeight = height;
    double fontSize = 18.0;
    Color color = bgColor;
    Color borderColor;
    Color textColor = Colors.white;

    if (size == 'normal') {
      containerHeight = 40.0;
    } else if (size == 'big') {
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = 50.0;
      fontSize = 18.0;
    } else if (size == 'small') {
      containerWidth = 60.0;
      containerHeight = 30.0;
      fontSize = 14.0;
    }

    if (type == 'default') {
      color = MyColor.white;
      textColor = MyColor.textColor;
    } else if (type == 'success') {
      color = MyColor.green;
    } else if (type == 'info') {
      color = MyColor.blue;
    } else if (type == 'danger') {
      color = MyColor.orange;
    } else if (type == 'error') {
      color = MyColor.red;
    }

    if (disabled) {
      color = const Color(0xffbbbec4);
    }

    borderColor = color;
    if (hairline) {
      textColor = type == 'default'? Colors.black38 : color;
      borderColor = type == 'default'? Colors.black38 : color;
      color = Colors.white;
    }

    if (textSize != null) {
      fontSize = textSize;
    }

    // TODO: implement build
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(
            color: borderColor
          ),
        ),
        child: Center(
          child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}