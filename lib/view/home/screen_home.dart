import 'package:ecommerce_ui/controller/getx/home_controller/home_controller.dart';
import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../res/fonts/fonts.dart';
import '../../res/images/images.dart';
import '../../widgets/custom_appbar/custom_appBar.dart';
import 'products_view_builder/products_view_builder.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  // Create instances of controllers using GetX
  final HomeController homeController = Get.put(HomeController());

  // Private method to build the header section
  Widget _buildHeader() {
    return Container(
      height: 20.h,
      width: double.infinity,
      color: Colors.teal[900],
      child: GetBuilder<UserController>(
        builder: (userController) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      userController.user?.userNmae ?? '',
                      style: KFonts.poppins(
                          color: Colors.white,
                          fontSize: 6.w,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.editUserProfile);
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 8.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 120,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Reward points',
                    style: KFonts.poppins(color: Colors.white, fontSize: 4.w),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    KImages.coinLottie,
                    width: 40,
                  ),
                  Text(
                    userRewardPointes.toString(),
                    style: KFonts.poppins(
                        color: Colors.white,
                        fontSize: 10.w,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(color: const Color.fromARGB(255, 0, 77, 64)),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const ProductListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
