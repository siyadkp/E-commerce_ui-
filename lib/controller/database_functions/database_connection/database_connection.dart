import 'package:ecommerce_ui/model/user_model/user_model.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../model/product_model/product_model.dart';

class DataBaseConnection {
  static dataBaseConnection() async {
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    if (!Hive.isAdapterRegistered(ProductModelAdapter().typeId)) {
      Hive.registerAdapter(ProductModelAdapter());
    }
    await Hive.openBox<UserModel>('user');
    await Hive.openBox<ProductModel>('products');
  }
}
