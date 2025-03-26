import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SigninController extends GetxController {
  final TextEditingController emailphoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>(); // Form Key for validation

  var errorText = RxString('');

  //auth
  var isLoggedIn = false.obs;
  String? accessToken;

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  //login function

  Future<bool> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("https://admin.edubd.tv/api/v1/login"),
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data["status"] == 1) {
          accessToken = data["accessToken"];
          String userJson = jsonEncode(data["user"]); // Convert user to JSON

          // Securely store token and user data
          await storage.write(key: "accessToken", value: accessToken);
          await storage.write(key: "user", value: userJson);

          isLoggedIn.value = true;
          // Get.offAllNamed("/home"); // Navigate to Home Screen
          return true;
        } else {
          Get.snackbar("Error", data["message"]);
        }
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", "$e+Something went wrong");
    }

    return false;
  }

  // Check Login Status
  Future<void> checkLoginStatus() async {
    accessToken = await storage.read(key: "accessToken");

    if (accessToken != null) {
      isLoggedIn.value = true;
      // Get.to(() => Home(), transition: Transition.rightToLeft);
      print('success');
    } else {}
  }

  // Logout Function
  Future<void> logout() async {
    try {
      await storage.delete(key: "accessToken");
      await storage.delete(key: "user");

      isLoggedIn.value = false;

      // Ensure UI updates before navigating
      await Future.delayed(Duration(milliseconds: 300));
      await clearSharedPreferences();

      // Get.offAll(() => SigninScreen()); // Clear navigation stack
    } catch (e) {
      Get.snackbar("Error", "Logout failed. Please try again.");
    }
  }

  // Function to clear SharedPreferences data
  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear all data in SharedPreferences
    await prefs.clear();
  }

  // Get User Details
  Future<Map<String, dynamic>?> getUserDetails() async {
    String? userJson = await storage.read(key: "user");
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    if (value.length < 3) {
      return "Must be at least 3 characters long";
    }

    return null;
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      // registerUser();
      bool success = await login(
        emailphoneController.text,
        passwordController.text,
      );
      if (success) {
        print("success");
      }
    }
  }

  @override
  void onClose() {
    emailphoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
