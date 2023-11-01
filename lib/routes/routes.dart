import 'package:ecommerce_ui/view/edit_profile/edit_profile.dart';
import 'package:ecommerce_ui/view/home/screen_home.dart';
import 'package:ecommerce_ui/view/login/screen_login.dart';
import 'package:ecommerce_ui/view/payment/screen_payment.dart';
import 'package:ecommerce_ui/view/screen_welcome_with_user_name/screen_welcome_with_user_name.dart';
import 'package:ecommerce_ui/view/splash/screen_splash.dart';
import 'package:ecommerce_ui/view/welcome/screen_welcome.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define constants for route names
  static const splash = '/';
  static const welcome = '/welcome';
  static const login = '/login';
  static const welcomeWithUserName = '/welcome_with_username';
  static const editUserProfile = '/edit_userprofile';
  static const itemScanning = '/item_scanning';
  static const payment = '/payment';

  // Create a list of GetPage objects to configure your routes
  static final List<GetPage> routes = [
    GetPage(name: splash, page: () => const ScreenSplash()),
    GetPage(name: welcome, page: () => const ScreenWelcome()),
    GetPage(name: login, page: () => ScreenLogin()),
    GetPage(
        name: welcomeWithUserName,
        page: () => const ScreenWelcomeWithUserName()),
    GetPage(name: editUserProfile, page: () => ScreenEditUserProfile()),
    GetPage(name: itemScanning, page: () => ScreenHome()),
    GetPage(name: payment, page: () => ScreenPayment()),
  ];
}
