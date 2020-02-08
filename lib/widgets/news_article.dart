import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticle extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String url;
  final String image;

  NewsArticle({
    @required this.title,
    @required this.date,
    @required this.description,
    @required this.url,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    String convertDateFromString(String strDate) {
      DateTime dateGiven = DateTime.parse(strDate).toLocal();
      return formatDate(
          dateGiven, [mm, '/', dd, '/', yy, ' ', hh, ':', nn, ' ', am]);
    }

    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Center(
      child: Container(
        // color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 11),
        height: 250,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: new BoxDecoration(
            color: Colors.white,
            // shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(12.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  3.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          // decoration: new BoxDecoration(
          //   color: Colors.white,
          //   shape: BoxShape.rectangle,
          //   borderRadius: new BorderRadius.circular(12.0),
          //   boxShadow: <BoxShadow>[
          //     new BoxShadow(
          //       color: Colors.black12,
          //       blurRadius: 10.0,
          //       offset: new Offset(0.0, 10.0),
          //     ),
          //   ],
          // ),
          child: Column(
            children: <Widget>[
              //------------------- Headline Bar -------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //------------------- Photo -------------------
                  Container(
                    // color: Colors.yellow,
                    padding:
                        EdgeInsets.only(left: 10, top: 4, bottom: 4, right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: image != null
                          ? Image.network(
                              image,
                              height: 50,
                              width: 50,
                            )
                          : SizedBox(
                              child: Icon(
                                Icons.rss_feed,
                                color: Theme.of(context).accentColor,
                                size: 40,
                              ),
                              height: 50,
                              width: 50,
                            ),
                    ),
                  ),
                  //------------------- Headline -------------------
                  Container(
                    // color: Colors.yellow,
                    padding:
                        EdgeInsets.only(left: 5, top: 4, bottom: 4, right: 10),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 100 - 10,
                      child: AutoSizeText(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        minFontSize: 15,
                        // maxFontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              //------------------- Description -------------------
              Container(
                // color: Colors.red,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: AutoSizeText(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.normal,
                    ),
                    minFontSize: 13,
                  ),
                ),
              ),
              //------------------- Divider -------------------
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                ),
              ),
              //------------------- Bottom Of Card -------------------
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _launchURL(url),
                  child: Container(
                    // color: Colors.green,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          // color: Colors.yellow,
                          child: Text(
                            convertDateFromString(date),
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              // color: Colors.green,
                              margin: EdgeInsets.only(right: 5),
                              child: Text(
                                "Read More",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                // style: TextStyle(
                                //   color: Theme.of(context).accentColor,
                                //   fontSize: 16,
                                //   fontWeight: FontWeight.normal,
                                // ),
                              ),
                            ),
                            Container(
                              // color: Colors.blue,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.open_in_new,
                                size: 16,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
