import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/colors.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
      useMaterial3: true,
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      // primaryColorDark: primaryColor,
      // primaryColor: primaryColor,
      // primaryIconTheme: const IconThemeData(grade: -25, weight: 100),
      textTheme: ThemeData.dark().textTheme.copyWith(
            displayMedium: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: kwhite,
            ),
            headlineMedium: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            headlineSmall: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            titleMedium: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: textSecondary,
            ),
            bodyMedium: const TextStyle(
              fontFamily: 'Poppins',
              color: textSecondary,
            ),
            bodySmall: const TextStyle(
              fontFamily: 'Poppins',
              color: textSecondary,
            ),
          )
      // textTheme: ThemeData.dark().textTheme.copyWith(
      //       displayLarge: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.bold,
      //           fontSize: 34,
      //           color: secondaryColor),
      //       displayMedium: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.bold,
      //           fontSize: 32,
      //           color: secondaryColor),
      //       displaySmall: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.w400,
      //           fontSize: 18,
      //           color: Colors.black),
      //       bodyLarge: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.normal,
      //           fontSize: 14,
      //           color: secondaryColor),
      //       bodyMedium: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.normal,
      //           fontSize: 14,
      //           color: Colors.black),
      //       bodySmall: const TextStyle(
      //           fontFamily: 'Lato',
      //           fontWeight: FontWeight.normal,
      //           fontSize: 20,
      //           color: secondaryColor),
      //     ),
      );
}
