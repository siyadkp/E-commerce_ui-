import 'package:ecommerce_ui/view/edit_username/screen_edit_username.dart';
import 'package:ecommerce_ui/view/item_scanning/screen_item_scanning.dart';
import 'package:ecommerce_ui/view/login/screen_login.dart';
import 'package:ecommerce_ui/view/payment/screen_payment.dart';
import 'package:ecommerce_ui/view/welcome/screen_welcome.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define constants for route names
  static const welcome = '/welcome';
  static const login = '/login';
  static const editUserProfile = '/edit_userprofile';
  static const itemScanning = '/item_scanning';
  static const payment = '/payment';

  // Create a list of GetPage objects to configure your routes
  static final List<GetPage> routes = [
    GetPage(
        name: welcome, page: () => const ScreenWelcome()), // Welcome page route
    GetPage(name: login, page: () => const ScreenLogin()), // Login page route
    GetPage(
        name: editUserProfile,
        page: () => const ScreenEditUserProfile()), // Edit user profile route
    GetPage(
        name: itemScanning,
        page: () => const ScreenItemScanning()), // Item scanning page route
    GetPage(
        name: payment, page: () => const ScreenPayment()), // Payment page route
  ];
}
