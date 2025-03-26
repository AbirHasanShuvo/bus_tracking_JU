import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextField(
    //TextInputType.emailAddress
    {required String? hint,
    required controller,
    required isPass,
    required validator,
    required keyboardtype}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
    child: TextFormField(
      keyboardType: keyboardtype,
      validator: validator,
      style: GoogleFonts.lato(),
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            color: Colors.grey,
          ),
          border: InputBorder.none),
    ),
  );
}
