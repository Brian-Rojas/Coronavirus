import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  @override
  void initState() {
    super.initState();

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
  }

  void setMapStyle() {
    mapController.setMapStyle(_light);
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
          cases: '1111',
          deaths: '331',
        )),
      ],
    );
  }
}
