import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    // Initiate the navigation process
    navigation();
  }

  // Function to handle the navigation logic
  navigation() async {
    final userController = Get.find<UserController>();
    await userController.getUserData();

    // Check if the user is logged in or not
    if (userController.user == null) {
      // Navigate to the welcome screen if the user is not logged in
      Get.offNamedUntil(AppRoutes.welcome, (route) => false);
    } else {
      // Navigate to the item scanning screen if the user is logged in
      Get.offNamedUntil(AppRoutes.itemScanning, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
