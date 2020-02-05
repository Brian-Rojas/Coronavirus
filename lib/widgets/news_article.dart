import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:url_launcher/url_launcher.dart';

import 'marquee.dart';

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
        width: MediaQuery.of(context).size.width - 30,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 300,
        child: Center(
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(12.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: image != null
                              ? Image.network(
                                  image,
                                  height: 50,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 200.0,
                            child: MarqueeWidget(
                              direction: Axis.horizontal,
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              convertDateFromString(date),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: 155,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Center(
                    child: Text(
                      description,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: TextStyle(
                          fontSize: 15, color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _launchURL(url),
                    child: Container(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text(
                              "Read More",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Theme.of(context).accentColor,
                            ),
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
      ),
    );
  }
}
