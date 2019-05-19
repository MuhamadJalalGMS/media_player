import 'package:flutter/material.dart';

class MoreItems extends StatelessWidget {
  List<String> _list;
  TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    // initialize List
    initList();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          children: _buildList(),
        ),
      ),
    );
  }

  List<dynamic> _buildList() {
    return _list
        .map((routeName) => ListTile(
              title: Text(routeName, style: _style,),
              // handle list click listener
              onTap: () {},
            ))
        .toList();
  }

  // initialize List
  initList() {
    _list = List();
    _list.add('Photo');
    _list.add('Downloads');
    _list.add('About [ArtistName]');
    _list.add('About us');
    _list.add('Log out');
  }
}
