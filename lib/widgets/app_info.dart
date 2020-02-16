import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Text(
            'info',
            style: Theme.of(context).accentTextTheme.headline,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
