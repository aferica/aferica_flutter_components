import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

class AZList extends StatefulWidget {
  final List<Map> data;
  final List keys;
  final bool toast;
  final Widget avatar;

  AZList({
    Key key,
    this.data,
    this.keys,
    this.toast,
    this.avatar
  }): assert(data != null && data.length > 0, '列表数据data不能为空'),
      assert(!data[0].containsKey("key"), '列表数据data格式不正确，缺少key'),
      super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AZListState(data: this.data, keys: this.keys, toast: this.toast);
  }
}

class AZListState extends State<AZList> {
  List data;
  List keys;
  bool toast;

  AZListState({
    Key key,
    this.data,
    this.keys,
    this.toast
  });

  ScrollController _dataController = new ScrollController();
  ScrollController _keyController = new ScrollController();

  int currentKeyIndex = 0;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();

    if (data == null) {
      data = [];
    }

    if (keys == null) {
      keys = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    }

    toast = toast ?? false;

    _keyController.addListener(() {
      print(_keyController.offset);
    });

    _dataController.addListener(() {
      print(_dataController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ListView.builder(
              controller: _dataController,
              itemCount: data.length * data.length * data.length * data.length,
              itemExtent: 60.0,
              itemBuilder: (BuildContext _content,int i){
                if(i < data.length * data.length * data.length * data.length) {
                  return ListTile(
                    leading: CircleAvatar(child: Text(data[i ~/ (data.length * data.length * data.length)], style: TextStyle(fontSize: 12),),),
                    title: Text('测试---' + i.toString()),
                  );
                }
                return null;
              },
            ),
          ),
          Positioned(
            width: 44,
            right: 10,
            top: 20,
            bottom: 20,
            child: Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                border: new Border.all(width: 0.4, color: Theme.of(context).dividerColor),
              ),
              child: Column(
                children: _buildKeyList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildKeyList() {
    List<Widget> keyList = [];
    keys.forEach((text) {
      int index = keys.indexOf(text);
      if (index == currentKeyIndex) {
        keyList.add(Container(
          height: 40.0,
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(child: Text(text, textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),),),
        ));
      } else {
        keyList.add(Expanded(
          child: GestureDetector(
            child: Text(
              text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
            onTap: () {
              setState(() {
                currentKeyIndex = index;
              });
              if (toast) {
                showToast(
                    text,
                    textStyle: TextStyle(
                        fontSize: 46, fontWeight: FontWeight.w600),
                    textPadding: EdgeInsets.only(
                        top: 20.0, left: 30.0, right: 30.0, bottom: 20.0)
                );
              }
              _dataController.jumpTo(index * 60.0 * keys.length * data.length * data.length);
            },
          ),
        ));
      }
    });
    return keyList;
  }
}