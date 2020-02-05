import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
    if (mapController != null) {
      setMapStyle();
    }

    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _nearChina,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            setMapStyle();
          },
          compassEnabled: false,
          myLocationEnabled: true,
          trafficEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: true,
          tiltGesturesEnabled: false,
        ),
        Positioned(
            child: StatusCardTri(
          cases: 0,
          deaths: 0,
        )),
      ],
    );
  }
}
