import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../res/images/images.dart';
import '../../res/texts/texts.dart';
import '../../widgets/buttons/animation_button/animation_button.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  // Private method to create the app logo image -------------------------------
  Widget _buildAppLogo() {
    return Center(
      child: Image.asset(KImages.appLogo, width: 45.w),
    );
  }

  // Private method to create the application name text ------------------------
  Widget _buildAppNameText() {
    return KText.applicationName;
  }

  // Private method to create the "Start" button -------------------------------
  Widget _buildStartButton() {
    return const AnimatedGetStartedButton();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAppLogo(),
                _buildAppNameText(),
                SizedBox(
                  height: 3.h,
                ),
                _buildStartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
