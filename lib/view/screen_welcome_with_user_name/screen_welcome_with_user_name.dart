import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce_ui/widgets/buttons/buttons.dart';
import '../../res/images/images.dart';
import '../edit_username/screen_edit_username.dart';
import '../item_scanning/screen_item_scanning.dart';

class ScreenWelcomeWithUserName extends StatelessWidget {
  const ScreenWelcomeWithUserName({Key? key});

  // Private method to build the welcome message
  Widget _buildWelcomeMessage() {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Siyad,',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'Welcome to E-Mart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            'Shop the latest trends and discover amazing deals.',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 176, 190, 197),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeMessage(),
          LottieBuilder.asset(KImages.serviceLottie),
          Center(
            child: KButtons.outlineButton(
              text: 'Edit Profile',
              onPressed: () => Get.toNamed(AppRoutes.editUserProfile),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: KButtons.elevatedButton(
              text: 'Go to Home',
              width: 53,
              height: 10,
              onPressed: () =>
                  Get.offNamedUntil(AppRoutes.itemScanning, (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
