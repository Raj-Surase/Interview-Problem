// lib/constants.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightReddish = Color.fromARGB(255, 252, 130, 143);
const Color offWhite = Color(0xFFFAFAFA);
const Color darkGrey = Color(0xFF212121);
const Color lightGrey = Color.fromARGB(255, 211, 211, 211);
const Color lightBlue = Color.fromARGB(255, 217, 232, 255);

enum Screen { chat, home, profile }

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

TextStyle bigText({Color color = Colors.white}) => GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: color,
    );

TextStyle heading1({Color color = Colors.white}) => GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color,
    );

TextStyle smallText({Color color = Colors.white}) => GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );

TextStyle buttonText({Color color = Colors.white}) => GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
