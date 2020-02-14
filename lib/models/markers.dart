import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Markers with ChangeNotifier {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> markers;
  Map<String, bool> countries;
  int count = 0;

  Markers() {
    markers = Set();
    countries = Map<String, bool>();
    loadIcon();
    // clearMarkers();
  }

  void loadIcon() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 5),
      'assets/images/marker-circle.png',
    );
  }

  void addMarker(String country, LatLng cords,
      {int cases = 0, int deaths = 0}) {
    if (cords != null) {
      Marker mark = Marker(
        markerId: MarkerId(
          count.toString(),
        ),
        position: cords,
        icon: pinLocationIcon,
        infoWindow: InfoWindow(
            title: country, snippet: 'Cases: $cases Deaths: $deaths'),
        onTap: () {},
      );
      if (markers.add(mark)) {
        count += 1;
        print("Added new marker for $country with cords $cords");
        print("Sanity check markers: ${markers.length} vs $count");
      } else {
        print("Marker $country already existed so not added.");
      }
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

  void removeMarkerWithId(int id) {
    if (id > count || id < 0) {
      // can't be in there
      return null;
    } else {
      try {
        markers.elementAt(id);
        notifyListeners();
      } catch (e) {
        print("Error deleting marker at id $id because $e");
      }
    }
  }

  void clearMarkers() {
    print("MARKERS CLEARED!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    markers.clear();
    count = 0;
    countries.clear();
    notifyListeners();
  }

  Set<Marker> get getMarkers => markers;
  Map<String, bool> get getCountries => countries;
  int get getCount => count;
}
