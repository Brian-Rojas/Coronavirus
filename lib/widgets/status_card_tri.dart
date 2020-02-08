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
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 80,
      margin: EdgeInsets.only(top: 50,),
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
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      firstVal.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      firstLbl,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
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
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      secondLbl,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
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
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      thirdLbl,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
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
