import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';

class MyFullTheme {
  static Color? kPrimary = const Color(0xFF489FB5);

  static Color? kPrimaryLight = Vx.hexToColor("#B8D4D8");
  static Color? kPrimaryDark = Vx.hexToColor("#16697A");

  static Color? kWhite = Vx.hexToColor("#F7F4F3");
  static Color? kBlack = Vx.hexToColor("#071013");
  static Color? kGray = Vx.hexToColor("#EBEBEB");
  static Color? kGrayDark = Vx.hexToColor("#0B191E");

  static Color? kSecondary = Vx.hexToColor("#F38068");
  static Color? kSecondaryLight = Vx.hexToColor("#EFC5BA");
  static Color? kSecondaryDark = Vx.hexToColor("#F55D3E");

  static String? fontFamily = GoogleFonts.poppins().fontFamily;

  static int fontSize = 36;
  static double kElevation = 2;
  static BorderRadius bRadiusSmall = BorderRadius.circular(12);
  static BorderRadius bRadiusMedium = BorderRadius.circular(20);
  static BorderRadius bRadiusBig = BorderRadius.circular(28);
  static EdgeInsets kPaddingSmall() => const EdgeInsets.all(8);
  static EdgeInsets kPaddingBig() => const EdgeInsets.all(16);

  static ShapeBorder? roundedRect({int i = 0}) {
    if (i == 0) {
      return RoundedRectangleBorder(borderRadius: bRadiusSmall);
    } else if (i == 1) {
      return RoundedRectangleBorder(borderRadius: bRadiusMedium);
    } else if (i == 2) {
      return RoundedRectangleBorder(borderRadius: bRadiusBig);
    }
  }

  static FloatingActionButtonThemeData fatd() => FloatingActionButtonThemeData(
      extendedIconLabelSpacing: 32,
      extendedPadding: kPaddingBig(),
      backgroundColor: kSecondaryLight,
      shape: roundedRect(),
      foregroundColor: kSecondaryDark);

  static CardTheme cardTheme(BuildContext context, bool isDark) => CardTheme(
      color: isDark ? kGrayDark : kGray,
      shape: roundedRect(i: 1),
      shadowColor: isDark ? kSecondaryLight : kSecondaryDark,
      elevation: 0);

  static AppBarTheme appBarTheme(BuildContext context, bool isDark) =>
      AppBarTheme(
          backgroundColor: isDark ? kBlack : kWhite,
          elevation: 0,
          titleTextStyle: textTheme(context, isDark).headline6,
          iconTheme:
              IconThemeData(color: isDark ? kPrimaryLight : kPrimaryDark),
          systemOverlayStyle: uiOverlay(context, isDark));

  static SystemUiOverlayStyle uiOverlay(BuildContext context, bool isDark) =>
      SystemUiOverlayStyle(
        statusBarColor: isDark ? kBlack : kWhite,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? kBlack : kWhite,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      );

  static ThemeData light(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      fontFamily: fontFamily,
      primaryColor: kPrimary,
      primaryColorLight: kPrimaryLight,
      primaryColorDark: kPrimaryDark,
      indicatorColor: kSecondaryLight!.withOpacity(0.4),
      selectedRowColor: kSecondaryLight,
      secondaryHeaderColor: kSecondary,
      scaffoldBackgroundColor: kWhite,
      canvasColor: kGray,
      progressIndicatorTheme: progressTD(),
      textTheme: textTheme(context, false),
      textSelectionTheme: selectionTD(context, false),
      floatingActionButtonTheme: fatd(),
      inputDecorationTheme: inputTD(context, false),
      cardTheme: cardTheme(context, false),
      appBarTheme: appBarTheme(context, false));

  static ThemeData dark(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      primaryColor: kPrimary,
      primaryColorLight: kPrimaryLight,
      primaryColorDark: kPrimaryDark,
      indicatorColor: kSecondary!.withOpacity(0.4),
      secondaryHeaderColor: kSecondary,
      selectedRowColor: kSecondaryLight,
      scaffoldBackgroundColor: kBlack,
      canvasColor: kGrayDark,
      progressIndicatorTheme: progressTD(),
      textTheme: textTheme(context, true),
      textSelectionTheme: selectionTD(context, true),
      inputDecorationTheme: inputTD(context, true),
      floatingActionButtonTheme: fatd(),
      cardTheme: cardTheme(context, true),
      appBarTheme: appBarTheme(context, true));

  static ProgressIndicatorThemeData progressTD() => ProgressIndicatorThemeData(
      circularTrackColor: kPrimaryLight, color: kPrimary);

  static InputDecorationTheme inputTD(BuildContext context, bool isDark) =>
      InputDecorationTheme(
          fillColor: isDark ? kPrimaryLight : kPrimaryDark,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: textTheme(context, isDark).headline6);

  static TextSelectionThemeData selectionTD(
          BuildContext context, bool isDark) =>
      TextSelectionThemeData(
          cursorColor: isDark ? kSecondaryLight : kSecondaryDark);

  static TextTheme textTheme(BuildContext c, bool isDark) => TextTheme(
        headline3: TextStyle(
            color: kPrimary, fontSize: 48, fontWeight: FontWeight.w900),
        headline4: TextStyle(
            color: kPrimary, fontSize: 36, fontWeight: FontWeight.w900),
        headline5: TextStyle(
            color: kSecondaryDark, fontSize: 20, fontWeight: FontWeight.w600),
        headline6: TextStyle(
            color: isDark ? kPrimaryLight : kPrimaryDark,
            fontSize: 20,
            fontWeight: FontWeight.w800),
        button: TextStyle(
            color: isDark ? kSecondary : kSecondaryDark,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      );
}
