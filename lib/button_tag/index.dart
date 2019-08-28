import 'package:flutter/material.dart';

import 'package:aferica_flutter_components/theme/color.dart';

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
  // 圆角大小
  double padding;
  // 文字
  final String text;
  // 文字大小(优先级最高)
  final double textSize;
  // 点击事件
  final VoidCallback onClick;
  // 图标
  final IconData icon;
  // 图标是否在右侧
  final bool rightIcon;

  ButtonTag({
    Key key,
    this.height,
    this.width,
    this.size = 'normal',
    this.type = 'default',
    this.bgColor,
    this.hairline = false,
    this.disabled = false,
    this.radius = 2.0,
    this.padding = 10.0,
    this.text,
    this.textSize,
    this.onClick,
    this.icon,
    this.rightIcon = false
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = width ?? 36.0;
    double containerHeight = height ?? 36.0;
    double fontSize = 18.0;
    Color color = bgColor;
    Color borderColor;
    Color textColor = Colors.white;

    if (size == 'big') {
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = 50.0;
      fontSize = 16.0;
    } else if (size == 'small') {
      containerWidth = 20.0;
      containerHeight = 20.0;
      padding = 2.0;
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

    Widget _buildText() {
      if (icon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: rightIcon ? TextDirection.rtl : TextDirection.ltr,
          children: <Widget>[
            Icon(icon, color: textColor, size: containerHeight * 0.67,),
            const SizedBox(width: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        );
      }
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      );
    }

    Widget _buildContainer() {
      if (size == 'big') {
        return Container(
          padding: EdgeInsets.all(0),
          width: containerWidth,
          height: containerHeight,
          child: Center(
            child: _buildText(),
          ),
        );
      }

      if (size == 'small') {
        return _buildText();
      }

      return Container(
        padding: EdgeInsets.all(0),
        child: _buildText(),
      );
    }

    return RawMaterialButton(
      elevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      splashColor: color,
      fillColor: color,
      child: _buildContainer(),
      padding: EdgeInsets.only(left: padding, right: padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
          color: borderColor
        ),
      ),
      constraints: BoxConstraints(minWidth: size == 'small'? 20 : 88, minHeight: size == 'small'? 20 : 36),
      onPressed: onClick ?? () {
        print('you click this ' + text + ' button');
      },
    );


  }
}