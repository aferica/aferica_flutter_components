import 'package:flutter/material.dart';
import 'package:aferica_flutter_components/aferica_flutter_components.dart';

class Cell extends StatelessWidget {

  // 标题
  final String title;
  // 右侧内容值
  final String value;
  // 是否是大号
  final bool isBig;
  // 显示下边框，默认显示
  final bool border;
  // 自定义左侧图标，不传不显示
  final IconData leftIcon;
  // 显示右侧图标
  final bool showRightIcon;
  // 自定义右侧图标，默认向右箭头
  final IconData rightIcon;
  // 左侧留白宽度
  final double leftBlank;

  // 点击事件
  final VoidCallback onClick;

  Cell({
    Key key,
    this.title,
    this.value,
    this.isBig = false,
    this.border = true,
    this.leftIcon,
    this.onClick,
    this.showRightIcon = false,
    this.rightIcon,
    this.leftBlank = 10.0
  }):super(key: key);

  List<Widget> _buildCellContent(double width) {
    List<Widget> content = [];

    List<Widget> leftContent = [];
    List<Widget> rightContent = [];

    double size = isBig ? 36 : 28;

    leftContent.add(SizedBox(width: 8,));
    if (leftIcon != null) {
      leftContent.add(Icon(leftIcon, size: size * 0.75,));
      leftContent.add(SizedBox(width: 8,));
    }
    leftContent.add(SizedBox(
      width: width * 0.3,
      child: Text(title, style: TextStyle(fontSize: size * 0.6), )
    ));

    rightContent.add(SizedBox(
      width: width * 0.45,
      child: Text(value, style: TextStyle(color: MyColor.grayDark, fontSize: size * 0.6,), textAlign: TextAlign.right,)
    ));
    if (showRightIcon || rightIcon != null) {
      rightContent.add(SizedBox(width: 8,));
      rightContent.add(Icon(rightIcon ?? Icons.chevron_right, size: size, color: MyColor.grayDark,));
    }
    rightContent.add(SizedBox(width: 8,));

    content.add(Row(crossAxisAlignment: CrossAxisAlignment.center, children: leftContent,));
    content.add(Row(crossAxisAlignment: CrossAxisAlignment.center, children: rightContent,));

    return content;
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return InkWell(
      onTap: onClick,
      child: Container(
//        color: MyColor.white,
        width: width,
        alignment: Alignment.center,
//        margin: EdgeInsets.only(left: leftBlank),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
          color: MyColor.white,
          border: Border(
            bottom: BorderSide(color: MyColor.borderColor),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildCellContent(width),
        ),
      ),
//      customBorder: Border(
//        bottom: BorderSide(
//          color: MyColor.green,
//          width: 1.0
//        )
//      ),
    );
  }
}