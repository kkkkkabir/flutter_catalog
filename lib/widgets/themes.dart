import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      canvasColor: creamColor,
      primaryColorLight: darkBluishColor,
      highlightColor: Vx.green600,
      primaryColor: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryTextTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Vx.gray500, fontSize: 12),
          headline1: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey.shade600, fontSize: 18)),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Vx.black)),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
          .copyWith(secondary: darkBluishColor));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      highlightColor: Vx.green400,
      primaryColor: Colors.white,
      cardColor: darkModeColor,
      canvasColor: Colors.black,
      primaryTextTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Vx.gray500, fontSize: 12),
          headline1: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey.shade600, fontSize: 18)),
      primaryColorLight: lightBluishColor,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Vx.white)),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white));

  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
  static Color darkModeColor = Color(0xff212121);
  static Color creamColor = Color(0xfff5f5f5);
}
