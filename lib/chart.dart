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
  int cases = 0;
  int deaths = 0;
  int regions = 0;

  void getSums() {
    Firestore.instance
        .collection("totals")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        cases = snapshot.documents[0]['cases'] as int;
        deaths = snapshot.documents[0]['deaths'] as int;
        regions = snapshot.documents[0]['countries'] as int;
      });
      // snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

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
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          StatusCardTri(
            cases: cases,
            deaths: deaths,
            regions: regions,
          ),
          TableTitle(),
          Container(
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height - 283,
              width: double.infinity,
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('locations')
                    .orderBy("infected", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  getSums();
                  return ListView.builder(
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
