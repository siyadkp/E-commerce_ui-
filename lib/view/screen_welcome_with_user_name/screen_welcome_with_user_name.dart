import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce_ui/widgets/buttons/buttons.dart';
import 'package:sizer/sizer.dart';
import '../../res/images/images.dart';
import '../../widgets/custom_appbar/custom_appBar.dart';

class ScreenWelcomeWithUserName extends StatelessWidget {
  const ScreenWelcomeWithUserName({super.key});

  // Private method to build the welcome message -------------------------------
  Widget _buildWelcomeMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<UserController>(builder: (userController) {
            return Text(
              'Hi ${userController.user?.userNmae},',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            );
          }),
          const Text(
            'Welcome to E-Mart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 10),
          const Text(
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
      appBar: customAppBar(height: 2.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeMessage(),
            LottieBuilder.asset(
              KImages.serviceLottie,
            ),
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
                    Get.offNamedUntil(AppRoutes.itemScanning, (route) => true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
