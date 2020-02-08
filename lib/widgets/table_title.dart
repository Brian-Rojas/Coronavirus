import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color lblColor = Theme.of(context).accentColor;
    final Color lblBGColor = Colors.transparent;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Center(
        child: Container(
          // color: Colors.red,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: lblBGColor,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Center(
                      child: Text(
                        'COUNTRY',
                        style: Theme.of(context).accentTextTheme.display3,
                      ),
                    ),
                  ),
                  Container(
                    color: lblBGColor,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    child: Center(
                      child: Text(
                        'CASES',
                        style: Theme.of(context).accentTextTheme.display3,
                      ),
                    ),
                  ),
                  Container(
                    color: lblBGColor,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    child: Center(
                      child: Text(
                        'DEATHS',
                        style: Theme.of(context).accentTextTheme.display3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
