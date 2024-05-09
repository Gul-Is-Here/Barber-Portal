import 'package:barber_portal/const/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barber_portal/screens/Auth_Screens/splash_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(107, 153, 64, 6),
);
var dColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(107, 153, 64, 6),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Barber Portal',
      darkTheme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: dColorScheme.onPrimaryContainer,
              foregroundColor: Colors.white),
          cardTheme: const CardTheme().copyWith(
            color: dColorScheme.primaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: dColorScheme.onPrimaryContainer,
                backgroundColor: dColorScheme.primaryContainer),
          ),
          textTheme: const TextTheme().copyWith(
              bodyLarge: GoogleFonts.poppins(
                  fontSize: 16,
                  color: dColorScheme.primaryContainer,
                  fontWeight: FontWeight.bold),
              bodyMedium: GoogleFonts.lato(
                  fontSize: 14,
                  color: dColorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.bold),
              bodySmall: GoogleFonts.lato(
                  fontSize: 12,
                  color: dColorScheme.primaryContainer,
                  fontWeight: FontWeight.bold),
              titleMedium: GoogleFonts.lato(
                  fontSize: 12,
                  color: dColorScheme.primaryContainer,
                  fontWeight: FontWeight.bold),
              titleLarge: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              titleSmall:
                  GoogleFonts.lato(fontSize: 14, color: darkBlueColor))),
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 18),
            backgroundColor: greenColor,
            foregroundColor: Colors.white),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: kColorScheme.onPrimaryContainer,
              backgroundColor: kColorScheme.primaryContainer,
              textStyle: Theme.of(context).textTheme.bodyLarge),
        ),
        textTheme: const TextTheme().copyWith(
          bodyLarge: GoogleFonts.poppins(
              fontSize: 15,
              color: kColorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.lato(
              fontSize: 14,
              color: kColorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold),
          bodySmall: GoogleFonts.lato(
              fontSize: 13, color: darkBlueColor, fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.lato(
            fontSize: 14,
            color: darkBlueColor,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.lato(
            fontSize: 12,
            color: darkBlueColor,
          ),
          titleLarge: GoogleFonts.lato(
            fontSize: 18,
            color: darkBlueColor,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
