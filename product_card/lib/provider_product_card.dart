import 'dart:math';

import 'package:flutter/material.dart';

class ProviderProductCard with ChangeNotifier {
  int _totalVegetable = 0;
  bool _notifOn = false;

  void incTotalVegetable() {
    _totalVegetable++;
    _updateNotifStatus();
    notifyListeners();
  }

  void decTotalVegetable() {
    _totalVegetable--;
    _totalVegetable = max(0, _totalVegetable);
    _updateNotifStatus();
    notifyListeners();
  }

  void _updateNotifStatus() {
    if (_totalVegetable > 4) {
      _notifOn = true;
    } else {
      _notifOn = false;
    }
  }

  int getTotalVeg(){
    return _totalVegetable;
  }

  bool getNotif(){
    return _notifOn;
  }
}
