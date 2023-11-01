import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';

class AnimatedGetStartedButton extends StatelessWidget {
  const AnimatedGetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
      onPressed: () => Get.offNamedUntil(AppRoutes.login, (route) => false),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Get Started'),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
