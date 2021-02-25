import 'package:flutter/material.dart';

import 'like.dart';
import 'post.dart';
import 'reduxsample.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static MyHomePage home = new MyHomePage();
  static Mypost mypost = new Mypost();
  static Like like = new Like();
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    home,
    mypost,
    like,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(Icons.home), // TODO: SVGファイル表示したい
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          SizedBox(
            width: 44,
            child: FlatButton(
              child: Icon(Icons.search),
              onPressed: () {
                // TODO
              },
            ),
          ),
          SizedBox(
            width: 44,
            child: FlatButton(
              child: Icon(Icons.more_vert),
              onPressed: () {
                // TODO
              },
            ),
          ),
        ],
      ),
//      body: HomeApp(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office),
            title: Text('My post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text('Like'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}