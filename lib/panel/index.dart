import 'package:flutter/material.dart';

class MoreInfoContainer extends StatelessWidget{

  final String title;

  final bool needMore;

  final String moreInfo;

  final bool showDivider;

  final Widget child;

  // 点击更多事件
  final VoidCallback onClickMore;

  MoreInfoContainer({
    Key key,
    @required this.title,
    @required this.child,
    this.needMore = false,
    this.moreInfo = '更多...',
    this.showDivider= true,
    this.onClickMore
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 35,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: new Text(title, style: new TextStyle(fontSize: 14),),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 35,
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: new GestureDetector(
                  onTap: onClickMore,
                  child: new Text(
                    moreInfo,
                    textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 14, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
          showDivider ? Divider(height: 2.0, color: const Color(0xffDCDCDC),) : null,
          child
        ].where(notNull).toList(),
      ),
    );
  }

  bool notNull(Object o) => o != null;
}