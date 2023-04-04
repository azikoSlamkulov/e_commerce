import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../test/redirect/redirect_view.dart';
import 'routes/app_router.dart';
import '../auth/presentation/logic/auth_bloc.dart';

Future initialization(BuildContext? context) async {
  /// Load resources
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          //title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            //canvasColor: Colors.transparent,
          ),
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        );
      },
    );
  }
}
