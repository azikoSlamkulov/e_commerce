import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lib.dart';
import 'config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// Navigation 1.0
  // @override
  // Widget build(BuildContext context) {
  //   final router = AppRouter(context.watch<AuthBloc>()).router;

  //   return ScreenUtilInit(
  //     designSize: const Size(393, 851),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, child) {
  //       return MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         //title: 'Flutter Demo',
  //         theme: ThemeData(
  //           primarySwatch: Colors.blue,
  //           textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  //           //canvasColor: Colors.transparent,
  //         ),
  //         home: RedirectView(),
  //       );
  //     },
  //   );
  // }

  /// Navigation 2.0 (GoRouter)
  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      //designSize: const Size(375, 812),
      designSize: const Size(393, 851),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   primarySwatch: Colors.red,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          //   //canvasColor: Colors.transparent,
          // ),
          routerConfig: router,
        );
      },
    );
  }

  // Navigation 2.0 (GoRouter) with theme mode
  // @override
  // Widget build(BuildContext context) {
  //   final router = AppRouter(context.watch<AuthBloc>()).router;

  //   return ScreenUtilInit(
  //     designSize: const Size(393, 851),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, child) {
  //       return BlocBuilder<ThemeBloc, ThemeMode>(
  //         builder: (context, state) {
  //           return MaterialApp.router(
  //             debugShowCheckedModeBanner: false,
  //             theme: lightTheme,
  //             themeMode: state,
  //             darkTheme: darkTheme,
  //             routerConfig: router,
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: TestView(),
  //   );
  // }
}
