import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton(buttonColor, title) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 50),
    height: 50,
    decoration: BoxDecoration(
        color: buttonColor, borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Text(
      title,
      style: GoogleFonts.openSans(
          fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),
    )),
  );
}
