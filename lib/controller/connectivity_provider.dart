import 'dart:async';

import 'package:blood_donation/services/connectivity_services/internet_service.dart';
import 'package:flutter/material.dart';

class InternetConnectivityProvider extends ChangeNotifier {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final InternetConnectivityServices _connectivityServices =
      InternetConnectivityServices();

  Future getInternetConnectivity(BuildContext context) async {
    _connectivityServices.getConnectivity(context);
    isDeviceConnected = _connectivityServices.isDeviceConnected;
    isAlertSet = _connectivityServices.isAlertSet;
    subscription = _connectivityServices.subscription;
  }
   notifyListeners();
}
