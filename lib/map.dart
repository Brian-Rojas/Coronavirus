import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  Set<Marker> _markers = {};
  String _light;
  String _dark;
  String _black;
  String _retro;
  String _blue;
  String _normal;
  String _new;
  int cases;
  int deaths;
  int regions;

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

  findCoordinateOf(String region, {int cases = 0, int deaths = 0}) async {
    var addresses = await Geocoder.local.findAddressesFromQuery(region);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
    var markerIdVal = _markers.length;
    String mar = markerIdVal.toString();
    final MarkerId markerId = MarkerId(mar);
    print(markerIdVal);
    setState(() {
      _markers.add(
        Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: markerId,
          position: LatLng(
            first.coordinates.latitude,
            first.coordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: region,
            snippet: 'Cases: $cases, Deaths: $deaths',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        ),
      );
      // print(_markers);
    });
  }

  Future<void> getTotalValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cases = prefs.getInt('cases') ?? 0;
      deaths = prefs.getInt('deaths') ?? 0;
      regions = prefs.getInt('regions') ?? 0;
    });
    print(prefs.getString('United States'));
  }

  void loadMapStyles() {
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

  @override
  void initState() {
    super.initState();

    getTotalValues();

    loadMapStyles();

    // getLocationPermission();
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

    // findCoordinateOf("China");
    // findCoordinateOf("Singapore");
    // findCoordinateOf("United States");

    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _nearChina,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            setMapStyle();
            getTotalValues();
          },
          markers: _markers,
          compassEnabled: false,
          myLocationEnabled: true,
          trafficEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: true,
          tiltGesturesEnabled: false,
        ),
        Positioned(
          child: StatusCardTri(
            firstVal: cases,
            secondVal: deaths,
            thirdLbl: "Regions",
            thirdVal: regions,
          ),
        ),
      ],
    );
  }
}
