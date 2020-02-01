import 'package:coronavirus_app/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/dark.json').then((string) {
      _mapStyle = string;
    });
  }

  static final CameraPosition _nearChina = CameraPosition(
    target: LatLng(21.4669223, 92.1321944),
    zoom: 2,
  );

  String _mapStyle;

  @override
  Widget build(BuildContext context) {
    if (mapController != null) {
      mapController.setMapStyle(_mapStyle);
    }

    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _nearChina,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController.setMapStyle(_mapStyle);
          },
          compassEnabled: false,
          myLocationEnabled: true,
          trafficEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: true,
          tiltGesturesEnabled: false,
        ),
        Positioned(
            child: StatusCard(
          cases: '1111',
          deaths: '331',
        )),
      ],
    );
  }
}
