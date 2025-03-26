import 'package:bus_tracking/edu_tv/colors.dart';
import 'package:bus_tracking/edu_tv/custom_square_button.dart';
import 'package:bus_tracking/edu_tv/otp_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({super.key, required this.phoneNumber});

  final phoneNumber;

  final OTPController controller = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        centerTitle: true,
        title: Text('OTP Verification', style: GoogleFonts.openSans()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Enter the OTP sent to your phone', style: GoogleFonts.lato()),
            SizedBox(height: 10),
            Text(phoneNumber, style: GoogleFonts.openSans()),
            SizedBox(height: 20),
            Center(child: Pinput(length: 4, onChanged: controller.updateOtp)),
            SizedBox(height: 20),
            customsquareButton(
              () async {
                await controller.verifyOtp(phoneNumber, controller.otp.value);
              },
              'Verify OTP',
              14.0,
              deepBlue,
              context,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
