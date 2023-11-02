import 'package:ecommerce_ui/routes/routes.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    // Initiate the navigation process
    AppRoutes.initialNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
