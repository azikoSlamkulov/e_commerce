import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/admin_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/admin/admin_products/presentation/logic/big_image/big_image_cubit.dart';

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
        /// Theme
        BlocProvider<ThemeBloc>(
          create: (context) => sl<ThemeBloc>(),
        ),

        /// Auth
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
        ),

        /// Admin
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),

        /// Product
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<BagBloc>(create: (context) => sl<BagBloc>()),
        BlocProvider<FavoritesBloc>(create: (context) => sl<FavoritesBloc>()),
        BlocProvider<CounterCubit>(create: (context) => sl<CounterCubit>()),
        BlocProvider<BrandsBloc>(create: (context) => sl<BrandsBloc>()),
        BlocProvider<RatingAndReviewsBloc>(
          create: (context) => sl<RatingAndReviewsBloc>(),
        ),
        BlocProvider<RatingAndReviewsBloc>(
          create: (context) => sl<RatingAndReviewsBloc>(),
        ),
        BlocProvider<ImageCubit>(
          create: (context) => sl<ImageCubit>(),
        ),
        BlocProvider<BigImageCubit>(
          create: (context) => sl<BigImageCubit>(),
        ),
        BlocProvider<SortingBtnCubit>(
          create: (context) => sl<SortingBtnCubit>(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => sl<CounterCubit>(),
        ),

        /// Shop
        BlocProvider<OrientationCubit>(
            create: (context) => sl<OrientationCubit>()),
      ],
      child: await builder(),
    ),
  );
}
