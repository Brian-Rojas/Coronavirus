import 'package:coronavirus_app/models/markers.dart';
import 'package:coronavirus_app/models/region_status.dart';
import 'package:coronavirus_app/models/regions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'controllers/db.dart';

import 'views/chart.dart';
import 'views/map.dart';
import 'views/news.dart';
import 'views/about.dart';
import 'controllers/geocoder.dart';

Geocoder geo;
bool loaded = false;

void main() {
  geo = Geocoder();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  void initState() {
    geo.readCsv().then((val) {
      setState(() {
        loaded = val;
      });
    });
    super.initState();
  }

  static const Color primary = Color.fromRGBO(205, 118, 114, 1.0);
  static const Color accent = Color.fromRGBO(69, 79, 99, 1.0);
  static const Color bg = Colors.white;
  DB db = DB.instance;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Chart(),
    Map(),
    News(),
    About(),
  ];

  void onTabTapped(int index) {
    if (index == 1) {
      print("On maps tab");
      if (!loaded) {
        geo.readCsv().then((val) {
          setState(() {
            loaded = val;
          });
        });
      }
    }
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
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primary,
          accentColor: accent,
          backgroundColor: bg,
          textTheme: TextTheme(
            headline: GoogleFonts.openSans(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            title: GoogleFonts.openSans(
              fontSize: 26,
              color: Colors.grey,
            ),
            subhead: GoogleFonts.openSans(
              fontSize: 22,
              color: Colors.grey,
            ),
            display1: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.grey,
            ),
            display2: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.grey,
            ),
            display3: GoogleFonts.openSans(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          accentTextTheme: TextTheme(
            headline: GoogleFonts.openSans(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: accent,
            ),
            title: GoogleFonts.openSans(
              fontSize: 26,
              color: accent,
            ),
            subhead: GoogleFonts.openSans(
              fontSize: 22,
              color: accent,
            ),
            display1: GoogleFonts.openSans(
              fontSize: 14,
              color: accent,
            ),
            display2: GoogleFonts.openSans(
              fontSize: 16,
              color: accent,
            ),
            display3: GoogleFonts.openSans(
              fontSize: 18,
              color: accent,
            ),
          ),
          primaryTextTheme: TextTheme(
            headline: GoogleFonts.openSans(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: primary,
            ),
            title: GoogleFonts.openSans(
              fontSize: 26,
              color: primary,
            ),
            subhead: GoogleFonts.openSans(
              fontSize: 22,
              color: primary,
            ),
            display1: GoogleFonts.openSans(
              fontSize: 14,
              color: primary,
            ),
            display2: GoogleFonts.openSans(
              fontSize: 16,
              color: primary,
            ),
            display3: GoogleFonts.openSans(
              fontSize: 18,
              color: primary,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.map),
                title: new Text(
                  'Map',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.rss_feed),
                title: new Text(
                  'News',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.announcement),
                title: new Text(
                  'About',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
