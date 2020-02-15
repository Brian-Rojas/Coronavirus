import 'package:flutter/material.dart';

class RegionStatus with ChangeNotifier {
  int cases;
  int regions;
  int deaths;
  int recoveries;

  RegionStatus() {
    cases = 0;
    regions = 0;
    deaths = 0;
    recoveries = 0;
    notifyListeners();
  }

  void setCases(int value) {
    cases = value;
    notifyListeners();
  }

  void setRegions(int value) {
    regions = value;
    notifyListeners();
  }

  void setDeaths(int value) {
    deaths = value;
    notifyListeners();
  }

  void setRecoveries(int value) {
    recoveries = value;
    notifyListeners();
  }

  int get getCases => cases;
  int get getRegions => regions;
  int get getDeaths => deaths;
  int get getRecoveries => recoveries;
}
