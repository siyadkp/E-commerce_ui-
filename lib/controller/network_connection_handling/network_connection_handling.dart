import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../getx/home_controller/home_controller.dart';
import '../getx/user_controller/user_controller.dart';

class InternetConnectionActivity {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Timer? _internetCheckTimer;

  // Function to handle the navigation logic
  static initialNavigation() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    final HomeController dabaseCURDfunctionController =
        Get.put(HomeController());
    final userController = Get.find<UserController>();
    await userController.getUserData();
    if (connectivityResult == ConnectivityResult.none) {
    } // Check if the user is logged in or not
    else if (userController.user == null) {
      await dabaseCURDfunctionController.getAllProductDataFromApi();
      // Navigate to the welcome screen if the user is not logged in
      Get.offNamedUntil(AppRoutes.welcome, (route) => false);
    } else {
      await dabaseCURDfunctionController.getAllProductDataFromApi();
      // Navigate to the item scanning screen if the user is logged in
      Get.offNamedUntil(AppRoutes.itemScanning, (route) => false);
    }
    startTimer();
  }

  static startInternetCheck() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.offNamedUntil(AppRoutes.noInternet, (route) => false);
    }
  }

  static startTimer() {
    const Duration checkInterval = Duration(seconds: 5);
    _internetCheckTimer = Timer.periodic(checkInterval, (Timer t) {
      InternetConnectionActivity.startInternetCheck();
    });
  }

  static void stopTimer() {
    if (_internetCheckTimer != null && _internetCheckTimer!.isActive) {
      _internetCheckTimer!.cancel();
    }
  }
}
