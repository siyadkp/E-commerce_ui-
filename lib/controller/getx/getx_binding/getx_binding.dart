import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:ecommerce_ui/controller/getx/home_controller/home_controller.dart';
import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:get/get.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
