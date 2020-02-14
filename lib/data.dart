import 'package:coronavirus_app/models/markers.dart';
import 'package:coronavirus_app/models/region_status.dart';
import 'package:coronavirus_app/models/regions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chart.dart';
import 'map.dart';
import 'news.dart';
import 'about.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Chart(),
    Map(),
    News(),
    About(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Markers()),
        ChangeNotifierProvider(create: (_) => RegionStatus()),
        ChangeNotifierProvider(create: (_) => Regions()),
      ],
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(
                'Home',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: new Text(
                'Map',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.rss_feed),
              title: new Text(
                'News',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.announcement),
              title: new Text(
                'About',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
