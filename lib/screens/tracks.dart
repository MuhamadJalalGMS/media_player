import 'package:flutter/material.dart';

import '../values.dart';

class tracksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _tracksState();
}

class _tracksState extends State<tracksScreen> {
  TextStyle _titleTextStyle = TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold,);
  TextStyle _subtitleTextStyle = TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold,);

  /// create a constructor and set its parameter to be a list of the tracks which
  /// was retrieved from the main screen
  /// @tracksList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrey,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => _listTileItem(),
        itemCount: 40,
      ),
    );
  }

  /// set an object of trackModel to _listTileItem() as a parameter
  _listTileItem() {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(5.0),
//      decoration: BoxDecoration(color: customWhite,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child:
                    /// use ImageNetwork instead of icon
                    Icon(
                  Icons.album,
                  color: Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Track Title',
                    style: _titleTextStyle,
                  ),
                  Text(
                    'Track Album',
                    style: _subtitleTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Align(
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }
}
