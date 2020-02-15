import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './data.dart';

import './widgets/btn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color primary = Color.fromRGBO(194, 56, 55, 1.0);
  static const Color accent = Color.fromRGBO(69, 79, 99, 1.0);
  static const Color bg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus',
      theme: ThemeData(
        primaryColor: primary,
        accentColor: accent,
        backgroundColor: bg,
        textTheme: TextTheme(
          headline: GoogleFonts.montserrat(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          title: GoogleFonts.montserrat(
            fontSize: 26,
            color: Colors.grey,
          ),
          subhead: GoogleFonts.montserrat(
            fontSize: 22,
            color: Colors.grey,
          ),
          display1: GoogleFonts.montserrat(
            fontSize: 14,
            color: Colors.grey,
          ),
          display2: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.grey,
          ),
          display3: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        accentTextTheme: TextTheme(
          headline: GoogleFonts.montserrat(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: accent,
          ),
          title: GoogleFonts.montserrat(
            fontSize: 26,
            color: accent,
          ),
          subhead: GoogleFonts.montserrat(
            fontSize: 22,
            color: accent,
          ),
          display1: GoogleFonts.montserrat(
            fontSize: 14,
            color: accent,
          ),
          display2: GoogleFonts.montserrat(
            fontSize: 16,
            color: accent,
          ),
          display3: GoogleFonts.montserrat(
            fontSize: 18,
            color: accent,
          ),
        ),
        primaryTextTheme: TextTheme(
          headline: GoogleFonts.montserrat(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: primary,
          ),
          title: GoogleFonts.montserrat(
            fontSize: 26,
            color: primary,
          ),
          subhead: GoogleFonts.montserrat(
            fontSize: 22,
            color: primary,
          ),
          display1: GoogleFonts.montserrat(
            fontSize: 14,
            color: primary,
          ),
          display2: GoogleFonts.montserrat(
            fontSize: 16,
            color: primary,
          ),
          display3: GoogleFonts.montserrat(
            fontSize: 18,
            color: primary,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/data': (context) => Data(),
        // '/map': (context) => Map(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _data(ctx) {
    Navigator.pushReplacementNamed(ctx, "/data");
    // Navigator.pushNamed(ctx, '/data');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/hero.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2 / 3,
          ),
          Container(
            // color: Colors.yellow,
            height: MediaQuery.of(context).size.height / 16,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 32),
            child: Text(
              'Coronavirus',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: MediaQuery.of(context).size.height / 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                // fontStyle: FontStyle.italic,
                decoration: TextDecoration.none,
                // fontFamily: 'Lobster',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            // color: Colors.green,
            height: MediaQuery.of(context).size.height / 16,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Data is currently updated every hour. Not 100% accurate.',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: MediaQuery.of(context).size.height / 44,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                // fontFamily: 'Lobster',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Btn(_data, 'Continue'),
        ],
      ),
    );
  }
}
