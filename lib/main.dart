import 'package:flutter/material.dart';
import 'package:media_player/screens/more_routes.dart';
import 'package:media_player/screens/search.dart';
import 'package:media_player/screens/tracks.dart';

import 'values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryGrey, splashColor: primaryGrey),
      home: MyHomePage(title: 'Flutter Media player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// here add a condition to check which widget should appear
  Widget bodyWidget = Container();

  _bottomNavItem(IconData icon, Widget screen) {
    return InkWell(
      child: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ),
      onTap: () {
        setState(() {
          bodyWidget = screen;
        });
//        Navigator.of(context)
//            .push(MaterialPageRoute(builder: (context) => screen));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchList()));
                    }),
              ],
            ),
          )
        ],
        leading: Icon(Icons.album),
      ),
      // todo replace body Center with custom widget
      body: bodyWidget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            color: primaryGrey,
          ),
          child: Icon(
            Icons.play_circle_filled,
          ),
        ),
        elevation: 5.0,
//        mini: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryGrey,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _bottomNavItem(Icons.queue_music, tracksScreen()),
              _bottomNavItem(Icons.album, tracksScreen()),
              Container(
                height: 35,
              ),
              _bottomNavItem(Icons.video_library, tracksScreen()),
              _bottomNavItem(Icons.menu, MoreItems()),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
//        notchMargin: 8.5,
      ),
    );
  }

}
