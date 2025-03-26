import 'package:bus_tracking/edu_tv/colors.dart';
import 'package:bus_tracking/edu_tv/customButton.dart';
import 'package:bus_tracking/edu_tv/customTextField.dart';
import 'package:bus_tracking/edu_tv/signin_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: appBackground,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: deepBlue),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.06),
            Text(
              'Login',
              style: GoogleFonts.openSans(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Welcome here',
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: appBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 0.3),
                                    offset: Offset(0, 10),
                                    //this offset makes more realistic
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    customTextField(
                                      hint: "Email/Phone",
                                      controller:
                                          controller.emailphoneController,
                                      isPass: false,
                                      validator: controller.validateText,
                                      keyboardtype: TextInputType.text,
                                    ),
                                    customTextField(
                                      hint: "Password",
                                      controller: controller.passwordController,
                                      isPass: true,
                                      validator: controller.validateText,
                                      keyboardtype: TextInputType.text,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Forgot password?',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            customButton(deepBlue, "Sign In").onTap(() {
                              // Get.to(() => Home());
                              controller.submitForm();
                            }),
                            SizedBox(height: screenHeight * 0.02),
                            customButton(secondaryColor, "Register").onTap(() {
                              // Get.to(() => SignupScreen(), transition: Transition.rightToLeft);
                            }),
                            SizedBox(height: screenHeight * 0.03),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   googleIcon,
                                  //   width: 50,
                                  //   height: 30,
                                  // ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Text(
                                    'Sign In With Google',
                                    style: GoogleFonts.openSans(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
