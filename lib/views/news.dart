import 'package:flutter/material.dart';
import '../widgets/news_article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class News extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return NewsArticle(
      title: document['name'],
      date: document['time'],
      description: document['desc'],
      image: document['image']['thumbnail']['contentUrl'],
      url: document['url'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Text(
            'News',
            style: Theme.of(context).accentTextTheme.headline,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('news')
              .orderBy("time", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          },
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }
}

Future<Null> _handleRefresh() async {
  await new Future.delayed(new Duration(milliseconds: 500));
  
}
