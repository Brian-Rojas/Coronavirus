import 'package:coronavirus_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'marquee.dart';

class TableItem extends StatelessWidget {
  final Color lblBGColor = Colors.white;
  final Color lblColor = Colors.grey;
  final bool shadowEnabled;
  final String country;
  final int cases;
  final int deaths;
  final String imageUrl;

  TableItem({
    this.shadowEnabled = true,
    this.country = "",
    this.cases = 0,
    this.deaths = 0,
    this.imageUrl,
  });

  BoxShadow getShadow() {
    if (this.shadowEnabled) {
      return new BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
      );
    }
    return new BoxShadow();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // color: Colors.red,
      // width: SizeConfig.safeBlockHorizontal * 1,
      height: SizeConfig.blockSizeVertical * 5.2,
      child: Center(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              getShadow(),
            ],
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // color: Colors.blue,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  // color: lblBGColor,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.0),
                          child: imageUrl != "https://"
                              ? Image.network(
                                  imageUrl,
                                  height: 13,
                                  alignment: Alignment.centerLeft,
                                )
                              : SizedBox(
                                  child: Icon(
                                    Icons.flag,
                                    color: Theme.of(context).accentColor,
                                    size: 20,
                                  ),
                                  height: 20,
                                  width: 20,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 30,
                        child: MarqueeWidget(
                          direction: Axis.horizontal,
                          child: Text(
                            country,
                            style: GoogleFonts.openSans(
                              color: Theme.of(context).accentColor,
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            textScaleFactor: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 25,
                  height: SizeConfig.blockSizeVertical * 5,
                  // color: lblBGColor,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      cases.toString(),
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).textTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                      textScaleFactor: 1.0,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 25,
                  height: SizeConfig.blockSizeVertical * 5,
                  // height: 20,
                  // color: lblBGColor,
                  // color: Colors.green,
                  child: Center(
                    child: Text(
                      deaths.toString(),
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).textTheme.display2.color,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
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
    );
  }
}
