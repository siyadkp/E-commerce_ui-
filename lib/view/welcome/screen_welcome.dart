import 'package:ecommerce_ui/view/login/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/images/images.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Images.appLogo,
                  width: 150, // Adjust the width as needed
                ),
              ),
              const Text(
                'E-Mart',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 39, 105, 42),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, right: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Get.to(ScreenLogin());
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.green[800]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
