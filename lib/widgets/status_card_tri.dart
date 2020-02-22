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
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: SizeConfig.safeBlockVertical * 10,
      // height: 90,
      // margin: EdgeInsets.only(top: 50,),
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
