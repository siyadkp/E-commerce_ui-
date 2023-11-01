import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String userNmae;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  double rewardPoints;

  UserModel(
      {required this.userNmae,
      required this.phoneNumber,
      required this.rewardPoints});
}
