import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/module/auth/presentation/logic/auth_bloc.dart';
import 'src/module/auth/presentation/logic/auth_event.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
        ),
        // BlocProvider<TestBloc>(create: (context) => TestBloc()),
        // //BlocProvider<UserBloc>(create: (context) => sl<UserBloc>()),
        // BlocProvider<TimerCubit>(create: (context) => TimerCubit()),
        // BlocProvider<PasswordCubit>(create: (context) => PasswordCubit()),
      ],
      child: await builder(),
    ),
  );

  // await runZonedGuarded(
  //   () async {
  //     await BlocOverrides.runZoned(
  //       //() async => runApp(await builder()),
  //       () async => runApp(
  //         MultiBlocProvider(
  //           providers: [
  //             BlocProvider<AuthBloc>(
  //               create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
  //             ),
  //             BlocProvider<TestBloc>(create: (context) => TestBloc()),
  //             //BlocProvider<UserBloc>(create: (context) => sl<UserBloc>()),
  //             BlocProvider<TimerCubit>(create: (context) => TimerCubit()),
  //           ],
  //           child: await builder(),
  //         ),
  //       ),
  //       blocObserver: AppBlocObserver(),
  //     );
  //   },
  //   (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  // );
}
