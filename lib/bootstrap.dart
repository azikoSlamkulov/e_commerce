import 'dart:async';
import 'dart:developer';

import 'lib.dart';

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
        /// Auth
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
        ),

        /// Admin
        BlocProvider<ProducBloc>(create: (context) => sl<ProducBloc>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<BagBloc>(create: (context) => sl<BagBloc>()),
        BlocProvider<FavoritesBloc>(create: (context) => sl<FavoritesBloc>()),
        BlocProvider<CounterCubit>(create: (context) => sl<CounterCubit>()),
        BlocProvider<SortToggleBtnCubit>(
            create: (context) => sl<SortToggleBtnCubit>()),

        BlocProvider<CategoryToggleBtnCubit>(
          create: (context) => sl<CategoryToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),

        // BlocProvider<TypeToggleBtnCubit>(
        //     create: (context) => sl<TypeToggleBtnCubit>()),

        /// Shop
        // //BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        // BlocProvider<OrientationCubit>(
        //     create: (context) => sl<OrientationCubit>()),
        // BlocProvider<SortToggleButtonCubit>(
        //   create: (context) => sl<SortToggleButtonCubit>(),
        // ),
        // BlocProvider<MultipleToogleBtnCubit>(
        //     create: (context) => sl<MultipleToogleBtnCubit>()),

        //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
        //BlocProvider<TabBarCubit>(create: (context) => sl<TabBarCubit>()),
      ],
      child: await builder(),
    ),
  );
}
