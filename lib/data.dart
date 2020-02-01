import 'chart.dart';
import 'map.dart';
import 'package:flutter/material.dart';

import 'PlaceholderWidget.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Chart(Colors.red),
    Map(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.yellow)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Live Data'),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: new Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.rss_feed),
            title: new Text('News'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.announcement),
            title: new Text('About'),
          ),
        ],
      ),
    );
  }
}
