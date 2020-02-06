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
  int recoveries = 0;

  void getSums() {
    Firestore.instance
        .collection("totals")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        cases = snapshot.documents[0]['cases'] as int;
        deaths = snapshot.documents[0]['deaths'] as int;
        regions = snapshot.documents[0]['countries'] as int;
        recoveries = snapshot.documents[0]['recoveries'] as int;
      });
      // snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return TableItem(
      country: document.documentID,
      deaths: document['dead'],
      cases: document['infected'],
      imageUrl: "https://" + document['flag'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          StatusCardTri(
            firstVal: cases,
            secondVal: deaths,
            thirdLbl: "Recoveries",
            thirdVal: recoveries,
          ),
          TableTitle(),
          Container(
              // color: Colors.transparent,
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height - 283,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('locations')
                    .orderBy("infected", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  getSums();
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        _buildListItem(context, snapshot.data.documents[index]),
                  );
                },
              )),
        ],
      ),
    );
  }
}
