import 'package:ecommerce_ui/view/welcome/screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Set the status bar color
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-commerce',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.green,
              appBarTheme: AppBarTheme(color: Colors.green),
            ),
            home: const ScreenWelcome()));
  }
}
