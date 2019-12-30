import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AZList extends StatefulWidget {
  final List data;
  final List keys;

  AZList({
    Key key,
    this.data,
    this.keys
  }):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AZListState(data: this.data, keys: this.keys);
  }
}

class AZListState extends State<AZList> {
  List data;
  List keys;

  AZListState({
    Key key,
    this.data,
    this.keys
  });

  String currentKey = 'A';

  @override
  void initState() {
    super.initState();

    if (data == null) {
      data = [];
    }

    if (keys == null) {
      keys = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext _content,int i){
              if(i < data.length) {
                return ListTile(
                  title: Text('aa'),
                );
              }
              return null;
            },
          ),
          Positioned(
            width: 40,
            right: 10,
            top: 20,
            bottom: 20,
            child: Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: new Border.all(width: 0.4, color: Theme.of(context).dividerColor),
              ),
              child: Column(
                children: keys.map((text) => _buildKeyListItem(text)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyListItem(text) {
    if (text == currentKey) {
      return Container(
        height: 40.0,
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),),
      );
    }
    return Expanded(
      child: GestureDetector(
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
        onTap: () {
          setState(() {
            currentKey = text;
          });
          Fluttertoast.showToast(
            msg: text,
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 46.0,
            backgroundColor: Theme.of(context).dividerColor,
            textColor: Theme.of(context).textTheme.title.color
          );
        },
      ),
    );
  }
}