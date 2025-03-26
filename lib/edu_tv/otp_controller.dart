import 'package:bus_tracking/edu_tv/signin_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OTPController extends GetxController {
  var otp = ''.obs;
  var secondsRemaining = 30.obs;
  var isResendEnabled = false.obs;

  void updateOtp(String value) {
    otp.value = value;
  }

  Future<void> verifyOtp(String phone, String code) async {
    final String url =
        'https://admin.edubd.tv/api/v1/verify-otp/$phone?code=$code';

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // print('Success: $data');
        Get.snackbar("Congratulations!!", "you have  successfully registered");
        Get.offAll(() => SigninScreen());
      } else {
        print('Failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
