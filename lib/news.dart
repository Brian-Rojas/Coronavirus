import 'package:flutter/material.dart';
import 'widgets/news_article.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'News',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 45,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsArticle(),
            NewsArticle(),
            NewsArticle(),
            NewsArticle(),
            NewsArticle(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: NewsArticle(),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   color: Colors.white,
    //   height: double.infinity,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         NewsArticle(),
    //         NewsArticle(),
    //         NewsArticle(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
