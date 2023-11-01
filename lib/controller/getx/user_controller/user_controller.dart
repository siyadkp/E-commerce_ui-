import 'package:ecommerce_ui/controller/database_functions/user_db_functions/user_db_functions.dart';
import 'package:ecommerce_ui/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double userRewardPointes = 0;

class UserController extends GetxController {
  // Text controllers for user input fields
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  UserModel? user;

  // Method to handle user login
  Future<void> userLogin() async {
    // Create a new user data model
    final userData = UserModel(
      userNmae: userName.text,
      phoneNumber: phoneNumber.text,
      rewardPoints: 1000,
    );

    // Insert the user data into the database
    UserDB.insertUserData(userData);

    // Retrieve the user data from the database
    user = await UserDB.getUserData();
  }

  // Method to update user data
  Future<void> userDataUpdate(double rewardPoints) async {
    // Create a user data model with updated information
    final userData = UserModel(
      userNmae: userName.text,
      phoneNumber: phoneNumber.text,
      rewardPoints: rewardPoints,
    );

    // Update the user data in the database
    UserDB.insertUserData(userData);

    // Retrieve the user data from the database
    user = await UserDB.getUserData();
  }

  // Method to update user's reward points
  Future<void> updateUserRewardPoints(double redeemedRewardPoints) async {
    // Calculate the new reward points after redemption
    final currentRewardPoints = user?.rewardPoints ?? 0;
    final afterRedeemUserPoints = currentRewardPoints - redeemedRewardPoints;

    // Create a user data model with updated reward points
    final userData = UserModel(
      userNmae: user!.userNmae,
      phoneNumber: user!.phoneNumber,
      rewardPoints: afterRedeemUserPoints,
    );

    // Update the user data in the database
    UserDB.insertUserData(userData);

    // Retrieve the user data from the database and update the controller
    user = await UserDB.getUserData();
    update();
  }

  // Method to retrieve user data
  Future<void> getUserData() async {
    user = await UserDB.getUserData();
  }

  // Method to load user data into the controller for UI display
  Future<void> controllerDataLoading() async {
    userName = TextEditingController(text: user?.userNmae);
    phoneNumber = TextEditingController(text: user?.phoneNumber);
  }
}
