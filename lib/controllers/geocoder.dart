import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'db.dart';

class Geocoder {
  DB db;

  Geocoder() {
    db = DB.instance;
  }

  Future<bool> readCsv() async {
    List<List<dynamic>> rowsAsListOfValues;

    rootBundle.loadString('assets/countries.csv').then((file) {
      rowsAsListOfValues = const CsvToListConverter(eol: '\n').convert(file);
      for (var row in rowsAsListOfValues) {
        var code;
        var lat;
        var lon;
        var name;
        int count = 0;
        for (var item in row) {
          int val = count % 4;
          switch (val) {
            case 0:
              code = item;
              break;
            case 1:
              lat = item;
              break;
            case 2:
              lon = item;
              break;
            default:
              name = item;
          }
          count += 1;
        }
        db.insertCountry(Country(code: code, lat: lat, lon: lon, name: name));
      }
    }).whenComplete(() {
      return true;
    }).catchError(() {
      return false;
    });

    return false;
  }

  Future<LatLng> findCords(String country) async {
    print("Running get cords on $country");
    try {
      LatLng cord;
      cord = await db.getCords(country);
      return cord;
    } catch (e) {
      return null;
    }
  }
}
