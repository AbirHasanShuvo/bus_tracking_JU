import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customsquareButton(onTap, text, fontsize, color, context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: fontsize,
          ),
        ),
      ),
    ),
  );
}
