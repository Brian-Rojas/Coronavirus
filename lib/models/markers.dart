import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers with ChangeNotifier {
  Set<Marker> markers;
  int count = 0;

  Markers() {
    markers = Set();
  }

  void addMarker(String country, LatLng cords,
      {int cases = 0, int deaths = 0}) {
    Marker mark = new Marker(
      markerId: MarkerId(
        count.toString(),
      ),
      position: cords,
      infoWindow:
          InfoWindow(title: country, snippet: 'Cases: $cases Deaths: $deaths'),
      onTap: () {},
    );
    if (markers.add(mark)) {
      count += 1;
      print("Added new marker for $country with cords $cords");
      notifyListeners();
    }
  }

  Marker getMarkerWithId(int id) {
    if (id > count || id < 0) {
      return null;
    } else {
      return markers.elementAt(id);
    }
  }

  void clearMarkers() {
    markers.clear();
    count = 0;
    notifyListeners();
  }

  Set<Marker> get getMarkers => markers;
  int get getCount => count;
}
