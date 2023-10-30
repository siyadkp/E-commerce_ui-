import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../res/images/images.dart';
import '../../res/texts/texts.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  // Private method to create the app logo image
  Widget _buildAppLogo() {
    return Center(
      child: Image.asset(
        KImages.appLogo,
        width: 150,
      ),
    );
  }

  // Private method to create the application name text
  Widget _buildAppNameText() {
    return KText.applicationName;
  }

  // Private method to create the "Start" button
  Widget _buildStartButton() {
    return GestureDetector(
      onTap: () => Get.offNamedUntil(AppRoutes.login, (route) => false),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 26,
            child: Text(
              'Start',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_sharp,
            color: Color.fromARGB(255, 119, 168, 121),
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAppLogo(),
          _buildAppNameText(),
          SizedBox(
            height: 8.h,
          ),
          _buildStartButton(),
        ],
      ),
    );
  }
}
