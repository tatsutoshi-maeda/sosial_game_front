import 'package:flutter/material.dart';

import 'gacha.dart';
import 'box.dart';
import 'reduxsample.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static MyHomePage home = new MyHomePage();
  static Box box = new Box();
  static Gacha gacha = new Gacha();
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    home,
    box,
    gacha,
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
        automaticallyImplyLeading: false,
        leading: Column(
          children: <Widget>[
            Text('なまえ'),
            Text('Rank'),
            Text('999',style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: <Widget>[
          Column(
            children: <Widget>[
              Text('次ランクまで：' + 'aaa' +'                    ' ),
              Text('Act：' + 'aaa' + '                    '),
            ],
          ),
          Column(
            children: <Widget>[
              Text('Gold：' + 'aaa' + '  '),
              Text('ishi：' + 'aaa' + '  '),
            ],
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
            icon: Icon(Icons.folder_shared_rounded),
            title: Text('Box'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_outlined),
            title: Text('ガチャ'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}