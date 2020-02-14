import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'models/markers.dart';
import 'models/region_status.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  String _light;
  String _dark;
  String _black;
  String _retro;
  String _blue;
  String _normal;
  String _new;
  var marks = Markers();

  getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission(); //to lunch location permission popup
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // getLocationPermission();

    rootBundle.loadString('assets/map_styles/dark.json').then((string) {
      _dark = string;
    });

    rootBundle.loadString('assets/map_styles/light.json').then((string) {
      _light = string;
    });

    rootBundle.loadString('assets/map_styles/normal.json').then((string) {
      _normal = string;
    });

    rootBundle.loadString('assets/map_styles/black.json').then((string) {
      _black = string;
    });

    rootBundle.loadString('assets/map_styles/retro.json').then((string) {
      _retro = string;
    });

    rootBundle.loadString('assets/map_styles/blue.json').then((string) {
      _blue = string;
    });

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
    // var mapData = Provider.of<Markers>(context);
    // print(mapData.getMarkers.first.position);
    if (mapController != null) {
      setMapStyle();
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
            },
            markers: markers.getMarkers,
            compassEnabled: false,
            myLocationEnabled: true,
            trafficEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: true,
            tiltGesturesEnabled: false,
          ),
          Positioned(
              child: StatusCardTri(
            firstVal:
                Provider.of<RegionStatus>(context, listen: false).getCases,
            secondVal:
                Provider.of<RegionStatus>(context, listen: false).getDeaths,
            thirdVal:
                Provider.of<RegionStatus>(context, listen: false).getRegions,
          )),
        ],
      );
    });
  }
}
