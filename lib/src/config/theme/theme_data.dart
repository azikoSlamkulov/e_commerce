import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Colors.red,
  // colorScheme: const ColorScheme.dark().copyWith(
  //   primary: const Color(0xffff6d63),
  //   brightness: Brightness.light,
  // ),

  // colorScheme: ColorScheme.fromSeed(
  //   primary: const Color(0xffff6d63),
  //   seedColor: const Color(0xffff6d63), // FF6D63
  //   brightness: Brightness.light,
  // ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    shadowColor: Colors.black,
    elevation: 3,
  ),

  scaffoldBackgroundColor: Colors.white,

  // textTheme: TextTheme(
  //   titleLarge: TextStyle(
  //     fontSize: 24.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   titleMedium: TextStyle(
  //     fontSize: 20.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodySmall: TextStyle(
  //     fontSize: 13.sp,
  //     color: Colors.black87,
  //   ),
  //   labelMedium: TextStyle(
  //     fontSize: 14.sp,
  //     color: Colors.white,
  //   ),
  // ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(5.0),
      // ),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      //minimumSize: Size.infinite,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: const Color(0xFF0A0E21),
  // ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  //brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color(0xFF0A0E21),
    seedColor: const Color(0xFF0A0E21),
    brightness: Brightness.dark,
  ),

  // textTheme: TextTheme(
  //   titleLarge: TextStyle(
  //     fontSize: 24.sp,
  //     color: Colors.white,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   titleMedium: TextStyle(
  //     fontSize: 20.sp,
  //     color: Colors.white,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodySmall: TextStyle(
  //     fontSize: 13.sp,
  //     color: Colors.white,
  //   ),
  //   labelMedium: TextStyle(
  //     fontSize: 14.sp,
  //     color: Colors.white,
  //   ),
  // ),
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Colors.white,
  //   shadowColor: Colors.black,
  //   elevation: 3,
  // ),

  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     minimumSize: MaterialStateProperty.all(const Size(double.infinity, 36)),
  //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //       (states) => const Color(0xffff6d63),
  //     ),
  //     foregroundColor: MaterialStateProperty.resolveWith<Color>(
  //       (states) => Colors.white,
  //     ),
  //     shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
  //       (_) {
  //         return const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(3)),
  //         );
  //       },
  //     ),
  //     textStyle: MaterialStateTextStyle.resolveWith(
  //       (states) => TextStyle(
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   ),
  // ),

  // appBarTheme: AppBarTheme(color: const Color(0xFF0A0E21)),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: const Color(0xFF0A0E21),
  // ),
);



//Theme.of(context).colorScheme.primary,
