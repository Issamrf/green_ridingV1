import 'package:flutter/material.dart';
import 'package:green_riding/models/address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation = new Address();
  void updatePickupLocationAddress(Address pickUpAdress) {
    pickUpLocation = pickUpAdress;
    notifyListeners();
  }
}
