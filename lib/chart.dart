import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';

import 'widgets/status_card_tri.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return TableItem(
      country: document.documentID,
      deaths: document['dead'],
      cases: document['infected'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          StatusCardTri(),
          TableTitle(),
          Container(
              color: Colors.transparent,
              // color: Colors.yellow,
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height - 283,
              width: double.infinity,
              child: StreamBuilder(
                stream: Firestore.instance.collection('locations').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        _buildListItem(context, snapshot.data.documents[index]),
                  );
                },
              )),
        ],
      ),
      color: Colors.white,
    );
  }
}
