import 'package:coronavirus_app/controllers/geocoder.dart';
import 'package:coronavirus_app/widgets/status_card_tri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../controllers/geo_utility.dart';
import '../models/markers.dart';
import '../models/region_status.dart';
import '../models/regions.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  GeoUtility geo;
  Geocoder geoCoder;
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

  void _currentLocation() async {
    final GoogleMapController controller = mapController;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 5,
      ),
    ));
  }

  void _getRegions() {
    geoCoder = Geocoder();
    Provider.of<Markers>(context, listen: false).clearMarkers();
    Provider.of<Regions>(context, listen: false)
        .getRegions
        .forEach((_, region) {
      // print(region.region);
      var markers = Provider.of<Markers>(context, listen: false);
      if (markers.getMarkerWithId(region.region) == null) {
        var newCords = geoCoder.findCords(region.region);

        newCords.then((onValue) {
          print("making a marker brian with cords $onValue");
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
    geo = new GeoUtility();
    geoCoder = new Geocoder();
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
      _getRegions();
    }

    return Consumer<Markers>(builder: (context, markers, _) {
      // print("Markers found $markers");
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
            myLocationEnabled: true,
            trafficEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            tiltGesturesEnabled: false,
            indoorViewEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(1, 10),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.white,
              onPressed: _currentLocation,
              child: Icon(Icons.my_location),
              mini: true,
            ),
          ),
          Positioned(
            child: SafeArea(
              // minimum: EdgeInsets.only(top: 50),
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
