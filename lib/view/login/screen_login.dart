import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../res/texts/texts.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/text_form_field/text_form_field.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  // Create an instance of the UserController using GetX -----------------------
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Private method to create the app logo image -------------------------------
  Widget _buildAppNameText() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: KText.applicationName,
    );
  }

  // Private method to create the login button ---------------------------------
  Widget _buildLoginButton(context) {
    return KButtons.elevatedButton(
        text: 'Login',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            userController.userLogin();
            Get.toNamed(AppRoutes.welcomeWithUserName);
          }
        });
  }

  // Private method to create the "Logim" text and button ----------------------
  Widget _buildSignUpTextAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Are you admin?',
          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Login as Admin',
            style: TextStyle(
              fontSize: 3.2.w,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppNameText(),
                TextFormFieldWidget(
                  title: 'User name',
                  hintText: 'Enter your username',
                  controller: userController.userName,
                ),
                TextFormFieldWidget(
                  title: 'Phone number',
                  hintText: 'Enter your Phone number',
                  controller: userController.phoneNumber,
                  keyboardType: TextInputType.phone,
                ),
                _buildLoginButton(context),
                _buildSignUpTextAndButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
