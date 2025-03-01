import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers with ChangeNotifier {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> markers;
  Map<Marker, LatLng> markerInfo;
  int count = 0;

  Markers() {
    markers = Set();
    markerInfo = Map<Marker, LatLng>();
    _loadIcon();
    notifyListeners();
  }

  void _loadIcon() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/marker.png',
    );
  }

  void addMarker(
    String country, {
    int cases = 0,
    int deaths = 0,
    int recoveries = 0,
    LatLng cords,
  }) {
    if (cords == null) {
      return;
    }
    Marker mark = Marker(
      markerId: MarkerId(
        country,
      ),
      position: cords,
      icon: pinLocationIcon,
      infoWindow: InfoWindow(
        title: country,
        snippet: 'Cases:$cases  Deaths:$deaths  Recoveries:$recoveries',
      ),
      onTap: () {},
    );

    if (markers.add(mark)) {
      markerInfo[mark] = cords;
      count += 1;
      print("Added new marker for $country with cords $cords");
      print("Sanity check markers: ${markers.length} vs $count");
      notifyListeners();
    } else {
      print("Marker $country already existed so not added.");
    }
  }

  Marker getMarkerWithId(String id) {
    for (var mark in markers) {
      print("MARKER WITH ID ${mark.markerId.value}");
      if (mark.markerId.value == id) {
        return mark;
      }
      return null;
    }
  }

  void clearMarkers() {
    print("MARKERS CLEARED!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    markers.clear();
    count = 0;
    notifyListeners();
  }

  Set<Marker> get getMarkers => markers;
  int get getCount => count;
}
