import 'package:flutter/material.dart';

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
    return Center(
      child: Container(
        // color: Colors.amber,
        width: MediaQuery.of(context).size.width - 30,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 200,
        child: Center(
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Five new cases in the US',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '8 Nov',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        'https://www.bing.com/th?id=ON.9340BCB612C8B89DAD29E549ADC48051&pid=News',
                        fit: BoxFit.cover,
                        height: 70,
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
