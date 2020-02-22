import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronavirus_app/util/size_config.dart';
import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/region_status.dart';
import '../models/regions.dart';
import '../widgets/status_card_tri.dart';

class Chart extends StatelessWidget {
  Widget _buildStatusCard(BuildContext context, DocumentSnapshot document) {
    Provider.of<RegionStatus>(context, listen: false)
        .setCases(document.data['cases']);
    Provider.of<RegionStatus>(context, listen: false)
        .setDeaths(document.data['deaths']);
    Provider.of<RegionStatus>(context, listen: false)
        .setRecoveries(document.data['recoveries']);
    Provider.of<RegionStatus>(context, listen: false)
        .setRegions(document.data['countries']);
    return new StatusCardTri(
      firstVal: Provider.of<RegionStatus>(context, listen: false).getCases,
      secondVal: Provider.of<RegionStatus>(context, listen: false).getDeaths,
      thirdLbl: "Recoveries",
      thirdVal: Provider.of<RegionStatus>(context, listen: false).getRecoveries,
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
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
    SizeConfig().init(context);
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SafeArea(
            child: Container(
                // color: Colors.red,
                ),
          ),
          // Grabs
          Container(
            // color: Colors.amber,
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('totals').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return StatusCardTri(
                    firstVal: 0,
                    firstLbl: '?',
                    secondVal: 0,
                    secondLbl: '?',
                    thirdVal: 0,
                    thirdLbl: '?',
                  );
                return _buildStatusCard(
                  context,
                  snapshot.data.documents.first,
                );
              },
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              // color: Colors.red,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              // margin: EdgeInsets.symmetric(horizontal: 10), //chart margin sides
              // color: Colors.red,
              // decoration: new BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: new BorderRadius.circular(12.0),
              //   boxShadow: <BoxShadow>[
              //     new BoxShadow(
              //       color: Colors.grey.withOpacity(0.1),
              //       blurRadius: 4.0, // has the effect of softening the shadow
              //       spreadRadius:
              //           2.0, // has the effect of extending the shadow
              //     ),
              //   ],
              // ),
              child: Column(
                children: <Widget>[
                  TableTitle(),
                  Expanded(
                    child: RefreshIndicator(
                      child: Container(
                        // color: Colors.yellow,
                        margin:
                            EdgeInsets.only(bottom: 0), // for the curb add 10
                        alignment: Alignment.topCenter,
                        height: SizeConfig.safeBlockVertical * 70,
                        width: MediaQuery.of(context).size.width,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('locations')
                              .orderBy("infected", descending: true)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData)
                              return const Text('Loading...');
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
                  ),
                ],
              ),
            ),
          ),
          // SafeArea(
          //   child: Container(),
          // ),
        ],
      ),
    );
  }
}

Future<Null> _handleRefresh() async {
  await new Future.delayed(new Duration(milliseconds: 500));
}
