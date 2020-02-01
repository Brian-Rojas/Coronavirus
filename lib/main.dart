// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import './map.dart';
import './data.dart';

import './widgets/btn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronovirus',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(194, 56, 55, 1.0),
        accentColor: Color.fromRGBO(69, 79, 99, 1.0),
        backgroundColor: Colors.white,
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
    Navigator.pushNamed(ctx, '/data');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/hero.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 50),
            child: Text(
              'Coronovirus',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 50,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                // fontFamily: 'Lobster',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Data is currently updated every hour. Not 100% accurate.',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 15,
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
