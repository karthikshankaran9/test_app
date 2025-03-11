import 'package:flutter/material.dart';

class DrinkTrackerProvider with ChangeNotifier {
  int _drinks = 0;
  double _progress = 0.6;

  int get drinks => _drinks;
  double get progress => _progress;

  void increaseDrinks() {
    _drinks++;
    notifyListeners();
  }

  void decreaseDrinks() {
    if (_drinks > 0) _drinks--;
    notifyListeners();
  }
}
