import 'dart:async';
import 'dart:developer';
import 'package:e_commerce/locator.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_bloc.dart';
import 'package:e_commerce/src/module/home/presention/logic/product_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          //create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
      ],
      child: await builder(),
    ),
  );
}
