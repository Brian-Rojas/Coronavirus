import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GeoUtility {
  Future<LatLng> findCords(String country) async {
    print("Country len ${country.length}");
    if (country.length > 1) {
      print("Running get cords on $country");
      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(country);
      // print(placemark.first.position);
      LatLng cord = new LatLng(placemark.first.position.latitude,
          placemark.first.position.longitude);
      print("$country found $cord");
      return cord;
    } else {
      return null;
    }
  }
}
