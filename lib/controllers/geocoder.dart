import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Geocoder {
  // var input;

  Geocoder() {
    // rootBundle.loadString('assets/countries.csv').then((file) {
    //   input = file;
    // });
  }

  Future<void> readCsv() async {
    // final input = new File('assets/countries.csv').openRead();
    final input = rootBundle
        .loadString('assets/countries.csv')
        .asStream()
        .transform(new CsvToListConverter())
        .toList()
        .then((value) {
      print(value);
    }).whenComplete(() {
      print("DoneDoneDoneDoneDoneDoneDoneDoneDoneDoneDoneDoneDoneDone");
    });
  }

  Future<LatLng> findCords(String country) async {
    if (country.length > 1) {
      print("Running get cords on $country");
      try {
        List<Placemark> placemark =
            await Geolocator().placemarkFromAddress(country);
        // print(placemark.first.position);
        LatLng cord = new LatLng(placemark.first.position.latitude,
            placemark.first.position.longitude);
        print("$country found $cord");
        return cord;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
