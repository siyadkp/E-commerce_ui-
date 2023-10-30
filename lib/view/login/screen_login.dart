import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../res/images/images.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/text_form_field/text_form_field.dart';
import '../screen_welcome_with_user_name/screen_welcome_with_user_name.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key});

  // Private method to create the app logo image
  Widget _buildAppLogo() {
    return Center(
      child: Image.asset(
        KImages.appLogo,
        width: 150, // Adjust the width as needed
      ),
    );
  }

  // Private method to create a text form field with a title and hint
  Widget _buildTextFormField(
      {required String title, required String hintText}) {
    return TextFormFieldStyle(
      title: title,
      hintText: hintText,
    );
  }

  // Private method to create the login button
  Widget _buildLoginButton() {
    return KButtons.elevatedButton(
      text: 'Login',
      onPressed: () => Get.to(const ScreenWelcomeWithUserName()),
    );
  }

  // Private method to create the "Sign up" text and button
  Widget _buildSignUpTextAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Are you a new User?',
          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign up',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAppLogo(),
          _buildTextFormField(
            title: 'User name',
            hintText: 'Enter your username',
          ),
          _buildTextFormField(
            title: 'Phone number',
            hintText: 'Enter your Phone number',
          ),
          _buildLoginButton(),
          _buildSignUpTextAndButton(),
        ],
      ),
    );
  }
}
