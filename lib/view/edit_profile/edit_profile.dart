import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../routes/routes.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/custom_appbar/custom_appBar.dart';
import '../../widgets/text_form_field/text_form_field.dart';

class ScreenEditUserProfile extends StatelessWidget {
  ScreenEditUserProfile({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Build the header section
  Widget _buildHeader() {
    return const Text(
      'Edit Profile',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  // Build the content section
  Widget _buildContent(context) {
    final userController = Get.put(UserController());
    userController.controllerDataLoading();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeader(),
          SizedBox(
            height: 6.h,
          ),
          TextFormFieldWidget(
            title: 'User name',
            hintText: 'Enter your username',
            controller: userController.userName,
          ),
          TextFormFieldWidget(
            title: 'Phone number',
            hintText: 'Enter your Phone number',
            controller: userController.phoneNumber,
          ),
          SizedBox(
            height: 6.h,
          ),
          KButtons.elevatedButton(
            text: 'Update',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Update user data and show a success message
                userController
                    .userDataUpdate(userController.user!.rewardPoints);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User profile updated'),
                  ),
                );
                // Navigate back to the welcome screen
                Get.toNamed(AppRoutes.welcomeWithUserName);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          KButtons.outlineButton(
            text: 'Go to Back',
            height: 12,
            width: 85,
            onPressed: () => Get.back(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: _buildContent(context),
    );
  }
}
