import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:ecommerce_ui/controller/getx/home_controller/home_controller.dart';
import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:get/get.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController());
    Get.put<CartController>(CartController());
  }
}
