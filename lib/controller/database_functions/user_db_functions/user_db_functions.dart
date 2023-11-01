import 'package:ecommerce_ui/model/user_model/user_model.dart';
import 'package:hive/hive.dart';
import '../../getx/user_controller/user_controller.dart';

class UserDB {
  static Box<UserModel> userDB = Hive.box<UserModel>('user');

  static Future<void> insertUserData(UserModel userData) async =>
      await userDB.put('user', userData);

  static Future<UserModel?> getUserData() async {
    final userData = userDB.get('user');
    if (userData == null) {
      return null;
    } else {
      userRewardPointes =
          double.parse(userData.rewardPoints.toStringAsFixed(2));

      return userData;
    }
  }
}
