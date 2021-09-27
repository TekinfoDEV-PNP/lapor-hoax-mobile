import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color grey200 = Color(0xFFA6A6A6);
final Color grey500 = Color(0xFF979797);
final Color orangeBlaze = Color(0xFFF96C00);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.inter(
    fontSize: 93,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.inter(
    fontSize: 58,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.inter(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      height: 0.5),
  bodyText1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.inter(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

var mainTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: myTextTheme,
  primaryTextTheme: myTextTheme,
  dividerColor: grey500,
  // outlined button
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        primary: Colors.black, onSurface: Colors.black),
  ),
  // elevated button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: orangeBlaze,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    ),
  ),
  // navigation
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: grey200,
  ),

  inputDecorationTheme: InputDecorationTheme(),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
);
