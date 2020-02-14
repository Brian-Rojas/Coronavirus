import 'package:flutter/material.dart';

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

  void updateRegion(String region, Region data) {
    regions[region].setCases = data.getCases;
    regions[region].setDeaths = data.getDeaths;
    regions[region].setRecoveries = data.getRecoveries;
    notifyListeners();
  }

  Map<String, Region> get getRegions => regions;
}

class Region {
  String region;
  int cases;
  int deaths;
  int recoveries;

  Region(String region,
      {this.cases = 0, this.deaths = 0, this.recoveries = 0}) {
    this.region = region;
  }

  set setCases(int value) {
    cases = value;
  }

  set setDeaths(int value) {
    deaths = value;
  }

  set setRecoveries(int value) {
    recoveries = value;
  }

  int get getCases => cases;
  int get getDeaths => deaths;
  int get getRecoveries => recoveries;
}
