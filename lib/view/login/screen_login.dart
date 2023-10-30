import 'package:ecommerce_ui/view/screen_welcome_with_user_name/screen_welcome_with_user_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../res/images/images.dart';
import '../../widgets/text_form_field/text_form_field.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Images.appLogo,
              width: 150, // Adjust the width as needed
            ),
          ),
          const TextFormFieldStyle(
              title: 'User name', hintText: 'Enter your username'),
          const TextFormFieldStyle(
              title: 'Phone number', hintText: 'Enter your Phone number'),
          SizedBox(
            width: 85.w,
            height: 12.w,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                Get.to(const ScreenWelcomeWithUserName());
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
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
                        color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
