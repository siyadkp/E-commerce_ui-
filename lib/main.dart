import 'package:ecommerce_ui/controller/getx/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'controller/database_functions/database_connection/database_connection.dart';
import 'controller/getx/getx_binding/getx_binding.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DataBaseConnection.dataBaseConnection();
  final HomeController dabaseCURDfunctionController = Get.put(HomeController());
  dabaseCURDfunctionController.getAllProductDataFromApi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBind(),
        title: 'E-Mart',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.green,
        ),
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
