import 'package:coronavirus_app/controllers/geocoder.dart';
import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../models/markers.dart';
import '../models/region_status.dart';
import '../models/regions.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  Geocoder geoCoder;
  String _new;

  void _getRegions() {
    geoCoder = Geocoder();
    Provider.of<Markers>(context, listen: false).clearMarkers();
    Provider.of<Regions>(context, listen: false)
        .getRegions
        .forEach((_, region) {
      var markers = Provider.of<Markers>(context, listen: false);
      if (markers.getMarkerWithId(region.region) == null) {
        var newCords = geoCoder.findCords(region.region);

        newCords.then((onValue) {
          markers.addMarker(
            region.region,
            cases: region.cases,
            deaths: region.deaths,
            recoveries: region.recoveries,
            cords: onValue,
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    geoCoder = new Geocoder();
    rootBundle.loadString('assets/map_styles/new.json').then((string) {
      _new = string;
    });
  }

  void setMapStyle() {
    mapController.setMapStyle(_new);
  }

  static final CameraPosition _nearChina = CameraPosition(
    target: LatLng(21.4669223, 92.1321944),
    zoom: 2,
  );

  @override
  Widget build(BuildContext context) {
    if (mapController != null) {
      setMapStyle();
      _getRegions();
    }

    return Consumer<Markers>(builder: (context, markers, _) {
      return Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _nearChina,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              setMapStyle();
              _getRegions();
            },
            markers: Set.from(markers.getMarkers),
            compassEnabled: false,
            myLocationEnabled: false,
            trafficEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            tiltGesturesEnabled: false,
            indoorViewEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(1, 10),
          ),
          Positioned(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: StatusCardTri(
                  firstVal: Provider.of<RegionStatus>(context, listen: false)
                      .getCases,
                  secondVal: Provider.of<RegionStatus>(context, listen: false)
                      .getDeaths,
                  thirdVal: Provider.of<RegionStatus>(context, listen: false)
                      .getRegions,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
