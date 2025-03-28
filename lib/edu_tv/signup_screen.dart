import 'package:bus_tracking/edu_tv/colors.dart';
import 'package:bus_tracking/edu_tv/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  // final SignupController controller = Get.put(SignupController());
  bool hasUpperAndLowerCase(String text) {
    RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).+$');
    return regex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appBackground,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: deepBlue),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.06),
            Text(
              'Sign Up',
              style: GoogleFonts.openSans(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stay connected',
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: appBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
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
                              // child: Form(
                              //   key: controller.formKey,
                              //   child: Column(
                              //     children: [
                              //       customTextField(
                              //           hint: "First Name",
                              //           controller:
                              //               controller.firstnameController,
                              //           validator: controller.validateText,
                              //           isPass: false,
                              //           keyboardtype: TextInputType.name),
                              //       customTextField(
                              //           hint: "Last Name",
                              //           controller: controller.lastnameController,
                              //           validator: controller.validateText,
                              //           isPass: false,
                              //           keyboardtype: TextInputType.name),
                              //       customTextField(
                              //           hint: "Username",
                              //           controller: controller.usernameController,
                              //           validator: controller.validateText,
                              //           isPass: false,
                              //           keyboardtype: TextInputType.name),
                              //       customTextField(
                              //         hint: "Email",
                              //         controller: controller.emailController,
                              //         validator: controller.validateEmail,
                              //         keyboardtype: TextInputType.emailAddress,
                              //         isPass: false,
                              //       ),
                              //       customTextField(
                              //         hint: "Phone",
                              //         controller: controller.phoneController,
                              //         validator: controller.validateText,
                              //         keyboardtype: TextInputType.phone,
                              //         isPass: false,
                              //       ),
                              //       customTextField(
                              //           hint: "Password",
                              //           controller: controller.passwordController,
                              //           validator: controller.validatePassword,
                              //           isPass: true,
                              //           keyboardtype: TextInputType.text),
                              //       customTextField(
                              //           hint: "Confirm Password",
                              //           controller:
                              //               controller.confirmpasswordController,
                              //           validator: controller.validatePassword,
                              //           isPass: true,
                              //           keyboardtype: TextInputType.text),
                              //     ],
                              //   ),
                              // ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            // customButton(deepBlue, "Sign Up").onTap(() {
                            //   // controller.submitForm();
                            // }),
                            SizedBox(height: screenHeight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ? ',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'Sign In',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ).onTap(() {
                                  Get.back();
                                }),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
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
