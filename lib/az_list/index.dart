import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'package:aferica_flutter_components/my_image/index.dart';

class AZList extends StatefulWidget {
  final List data;
  final String keyName;
  final bool toast;
  final String avatar;

  AZList({
    Key key,
    this.data,
    this.keyName,
    this.toast,
    this.avatar
  }): assert(data != null && data.length > 0, '列表数据data不能为空'),
      assert(keyName != null && keyName.isNotEmpty, '缺少key'),
      super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AZListState(data: this.data, keyName: this.keyName, toast: this.toast, avatar: this.avatar);
  }
}

class AZListState extends State<AZList> {
  List data;
  String keyName;
  List keyList = [];
  List<int> keyIndex = [];
  bool toast;
  String avatar;

  AZListState({
    Key key,
    this.data,
    this.keyName,
    this.toast,
    this.avatar
  });

  ScrollController _dataController = new ScrollController();
  ScrollController _keyController = new ScrollController();

  int currentKeyIndex = 0;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();

    getKeyFromData();

    toast = toast ?? false;

    _keyController.addListener(() {
      print(_keyController.offset);
    });

    _dataController.addListener(() {
      print(_dataController.offset);
//      int index = _dataController.offset ~/ 30;
//      String currentKey = data[index][keyName] ?? '';
//      setState(() {
//        currentKeyIndex = keyList.indexOf(currentKey);
//      });
    });
  }

  getKeyFromData() {
    Set keySet = new Set();
    for(int i = 0; i< data.length; i++) {
      print(data[i]);
      String keyValue = data[i][keyName] ?? '';
      if (!keySet.contains(keyValue)) {
        keySet.add(keyValue);
        keyIndex.add(i);
        keyList.add(keyValue);
      }
    }
    print(keyList);
    print(keyIndex);
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
              itemCount: data.length,
              itemExtent: 60.0,
              itemBuilder: (BuildContext _content,int i){
                if(i < data.length) {
                  if (avatar != null && avatar != '') {
                    return ListTile(
                      leading: CircleAvatar(child: ClipOval(child: MyNetWorkImage(src: data[i][avatar]),)),
                      title: Text(data[i]['name']),
                      onTap: () {
                        Navigator.of(context).pop(data[i]);
                      },
                    );
                  } else {
                    return ListTile(
                      title: Text(data[i]['name']),
                      onTap: () {
                        Navigator.of(context).pop(data[i]);
                      },
                    );
                  }
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
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  border: new Border.all(width: 0.4, color: Theme.of(context).dividerColor),
                  color: Theme.of(context).canvasColor
                ),
                child: ListView.builder(
                  itemCount: keyList.length,
                  itemExtent: 30.0,
                  itemBuilder: (BuildContext _content,int i){
                    if(i < data.length) {
                      String text = keyList[i].toString();
                      if (i == currentKeyIndex) {
                        return Container(
                          height: 30.0,
                          padding: EdgeInsets.all(2.0),
                          child: CircleAvatar(child: Text(text.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),),
                        );
                      }
                      return GestureDetector(
                        child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                        onTap: () {
                          setState(() {
                            currentKeyIndex = i;
                          });
                          if (toast) {
                            showToast(
                              text,
                              textStyle: TextStyle(fontSize: 46, fontWeight: FontWeight.w600),
                              textPadding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
                              position: ToastPosition.center
                            );
                          }
                          _dataController.jumpTo(keyIndex[i] * 60.0);
                        },
                      );
                    }
                    return null;
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}