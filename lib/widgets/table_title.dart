import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coronavirus_app/util/size_config.dart';

class TableTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color lblColor = Theme.of(context).accentColor;
    final Color lblBGColor = Colors.transparent;

    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 50,
      height: SizeConfig.safeBlockVertical * 6,
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
                        style: GoogleFonts.openSans(
                          color:
                              Theme.of(context).accentTextTheme.display2.color,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    color: lblBGColor,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    child: Center(
                      child: Text(
                        'CASES',
                        style: GoogleFonts.openSans(
                          color:
                              Theme.of(context).accentTextTheme.display2.color,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    color: lblBGColor,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    child: Center(
                      child: Text(
                        'DEATHS',
                        style: GoogleFonts.openSans(
                          color:
                              Theme.of(context).accentTextTheme.display2.color,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        textScaleFactor: 1.0,
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
