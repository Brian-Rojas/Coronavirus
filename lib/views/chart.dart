import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/region_status.dart';
import '../models/regions.dart';
import '../widgets/status_card_tri.dart';

class Chart extends StatelessWidget {
  void _getSums(BuildContext context) {
    Firestore.instance.collection("totals").snapshots().listen((querySnapshot) {
      querySnapshot.documentChanges.forEach((change) {
        Provider.of<RegionStatus>(context, listen: false)
            .setCases(change.document['cases']);
        Provider.of<RegionStatus>(context, listen: false)
            .setDeaths(change.document['deaths']);
        Provider.of<RegionStatus>(context, listen: false)
            .setRecoveries(change.document['recoveries']);
        Provider.of<RegionStatus>(context, listen: false)
            .setRegions(change.document['countries']);
      });
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    _getSums(context);
    var regions = Provider.of<Regions>(context, listen: false);
    if (regions.getRegions.containsKey(document.documentID)) {
      print("Regions has ${document.documentID} so updating instead.");
      regions.updateRegion(document.documentID, document['infected'],
          document['dead'], document['recovered']);
    } else {
      print("Added new region ${document.documentID}");
      regions.addRegion(
          region: document.documentID,
          cases: document['infected'],
          recoveries: document['recovered'],
          deaths: document['dead']);
    }
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
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          StatusCardTri(
            firstVal:
                Provider.of<RegionStatus>(context, listen: false).getCases,
            secondVal:
                Provider.of<RegionStatus>(context, listen: false).getDeaths,
            thirdLbl: "Recoveries",
            thirdVal:
                Provider.of<RegionStatus>(context, listen: false).getRecoveries,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 20),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(12.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                TableTitle(),
                RefreshIndicator(
                  child: Container(
                    // color: Colors.yellow,
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height - 283,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('locations')
                          .orderBy("infected", descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return const Text('Loading...');
                        return new ListView(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          children: snapshot.data.documents.map((document) {
                            return _buildListItem(context, document);
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  onRefresh: _handleRefresh,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<Null> _handleRefresh() async {
  await new Future.delayed(new Duration(milliseconds: 500));
}
