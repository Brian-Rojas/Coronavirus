import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'marquee.dart';

class NewsArticle extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final Image image;

  NewsArticle(
      {@required this.title,
      @required this.date,
      @required this.description,
      this.image});

  @override
  Widget build(BuildContext context) {
    String convertDateFromString(String strDate) {
      DateTime dateGiven = DateTime.parse(strDate).toLocal();
      return formatDate(
          dateGiven, [mm, '/', dd, '/', yy, ' ', hh, ':', nn, ' ', am]);
    }

    return Center(
      child: Container(
        // color: Colors.amber,
        width: MediaQuery.of(context).size.width - 30,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 242,
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
                          child: Image.network(
                            'https://www.bing.com/th?id=ON.9340BCB612C8B89DAD29E549ADC48051&pid=News',
                            height: 50,
                            // width: 100.0,
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
                          // Text(
                          //   title.substring(0, 29),
                          //   style: TextStyle(
                          //     color: Theme.of(context).accentColor,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
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
                  height: 100,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Center(
                    child: Text(
                      'When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.',
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
                    onTap: () {
                      print("Clicked article 1");
                    },
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
