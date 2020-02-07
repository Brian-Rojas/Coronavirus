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
    return Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 0),
      // padding: EdgeInsets.only(left: 15, right: 15),
      height: 50,
      child: Center(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              getShadow(),
            ],
          ),
          child: Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  color: lblBGColor,
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
                          child: imageUrl != null
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
                        width: 128,
                        child: MarqueeWidget(
                          direction: Axis.horizontal,
                          child: Text(
                            country,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  height: 20,
                  color: lblBGColor,
                  child: Center(
                    child: Text(
                      cases.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: lblColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  height: 20,
                  color: lblBGColor,
                  child: Center(
                    child: Text(
                      deaths.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: lblColor,
                      ),
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
