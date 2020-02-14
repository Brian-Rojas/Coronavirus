import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronavirus_app/geo_utility.dart';
import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'models/markers.dart';
import 'models/region_status.dart';
import 'models/regions.dart';
import 'widgets/status_card_tri.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  void getSums() {
    Firestore.instance.collection("totals").snapshots().listen((querySnapshot) {
      querySnapshot.documentChanges.forEach((change) {
        Provider.of<RegionStatus>(context, listen: false)
            .setCases(change.document['cases'] as int);
        Provider.of<RegionStatus>(context, listen: false)
            .setDeaths(change.document['deaths'] as int);
        Provider.of<RegionStatus>(context, listen: false)
            .setRecoveries(change.document['recoveries'] as int);
        Provider.of<RegionStatus>(context, listen: false)
            .setRegions(change.document['countries'] as int);
      });
    });
  }

  Future<void> getCordsLocally(DocumentSnapshot document) async {
    GeoUtility geo = new GeoUtility();
    var countries = Provider.of<Markers>(context).getCountries;
    if (Provider.of<Markers>(context, listen: false)
        .getCountries
        .containsKey(document.documentID)) {
      if (Provider.of<Markers>(context, listen: false)
              .getCountries[document.documentID] ==
          false) {
        Future<LatLng> cords = geo.findCords(document.documentID);
        cords.then((value) {
          Provider.of<Markers>(context, listen: false).addMarker(
            document.documentID,
            value,
            deaths: Provider.of<Regions>(context, listen: false)
                .getRegions[document.documentID]
                .getDeaths,
            cases: Provider.of<Regions>(context, listen: false)
                .getRegions[document.documentID]
                .getCases,
            // deaths: document['dead'],
            // cases: document['infected'],
          );
          Provider.of<Markers>(context, listen: false)
              .getCountries[document.documentID] = true;
        });
        cords.catchError((error) {
          print("Error $error");
        });
      }
      print("${document.documentID} already stored.");
    }
  }

  void storeCountriesLocally(DocumentSnapshot document) {
    Provider.of<Markers>(context, listen: false)
        .getCountries[document.documentID] = false;
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    storeCountriesLocally(document);
    getCordsLocally(document);
    getSums();
    var regions = Provider.of<Regions>(context, listen: false);
    if (regions.getRegions.containsKey(document.documentID)) {
      print("Regions has ${document.documentID} so updating instead.");
      regions.updateRegion(
        document.documentID,
        new Region(
          document.documentID,
          cases: document['infected'],
          recoveries: document['recovered'],
          deaths: document['dead'],
        ),
      );
    } else {
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
      // color: Colors.red,
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
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                Container(
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
                      // Provider.of<Markers>(context, listen: false)
                      //     .clearMarkers();
                      return new ListView(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        children: snapshot.data.documents.map((document) {
                          return _buildListItem(context, document);
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
