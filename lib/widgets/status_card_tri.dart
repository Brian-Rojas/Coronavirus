import 'package:coronavirus_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusCardTri extends StatelessWidget {
  final int firstVal;
  final int secondVal;
  final int thirdVal;
  final String firstLbl;
  final String secondLbl;
  final String thirdLbl;

  StatusCardTri({
    this.firstLbl = "Cases",
    this.firstVal = 0,
    this.secondLbl = "Deaths",
    this.secondVal = 0,
    this.thirdLbl = "Regions",
    this.thirdVal = 0,
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight(double size) {
      if (size <= 540) {
        //nuxus one
        return SizeConfig.safeBlockVertical * 14;
      } else if (size <= 690) {
        //pixel
        return SizeConfig.safeBlockVertical * 13;
      } else if (size <= 780) {
        //pixel 2 xl
        return SizeConfig.safeBlockVertical * 11;
      } else {
        //one plus 6t
        return SizeConfig.safeBlockVertical * 10;
      }
    }

    SizeConfig().init(context);
    double size = MediaQuery.of(context).size.height;
    print("Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio}");
    print("size: ${MediaQuery.of(context).size}");
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: deviceHeight(size),

      // height: (size <= 800)
      //     ? SizeConfig.safeBlockVertical * 14
      //     : SizeConfig.safeBlockVertical * 10,

      child: Center(
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  children: <Widget>[
                    Text(
                      firstVal.toString(),
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).accentTextTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                      ),
                    ),
                    Text(
                      firstLbl,
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).textTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      secondVal.toString(),
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).accentTextTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                      ),
                    ),
                    Text(
                      secondLbl,
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).textTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      thirdVal.toString(),
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).accentTextTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                      ),
                    ),
                    Text(
                      thirdLbl,
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).textTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
