import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Regions with ChangeNotifier {
  Map<String, Region> regions;

  Regions() {
    regions = Map<String, Region>();
  }

  void addRegion({
    @required String region,
    @required int cases,
    @required int recoveries,
    @required int deaths,
  }) {
    regions[region] = new Region(region,
        cases: cases, recoveries: recoveries, deaths: deaths);
    notifyListeners();
  }

  void updateRegion(
      String region, int newCases, int newDeaths, int newRecoveries,
      {LatLng cords}) {
    regions[region].setCases = newCases;
    regions[region].setDeaths = newDeaths;
    regions[region].setRecoveries = newRecoveries;
    regions[region].setCords = cords;
    notifyListeners();
  }

  Map<String, Region> get getRegions => regions;
}

class Region with ChangeNotifier {
  String region;
  int cases;
  int deaths;
  int recoveries;
  LatLng cords;

  Region(String region,
      {this.cases = 0, this.deaths = 0, this.recoveries = 0, this.cords}) {
    this.region = region;
    notifyListeners();
  }

  set setCases(int value) {
    cases = value;
    notifyListeners();
  }

  set setDeaths(int value) {
    deaths = value;
    notifyListeners();
  }

  set setRecoveries(int value) {
    recoveries = value;
    notifyListeners();
  }

  set setCords(LatLng value) {
    cords = value;
    notifyListeners();
  }

  int get getCases => cases;
  int get getDeaths => deaths;
  int get getRecoveries => recoveries;
  LatLng get getCords => cords;
}
