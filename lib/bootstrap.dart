import 'dart:async';
import 'dart:developer';
import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/product/product_bloc.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/tab_bar/tab_bar_cubit.dart';

import 'src/module/shop/presentation/logic/sort_toggle_btn/sort_toggle_btn_cubit.dart';
//import 'package:flutter/material.dart';
// import 'package:e_commerce/locator.dart';
// import 'package:e_commerce/src/module/auth/presentation/logic/auth_bloc.dart';
// import 'package:e_commerce/src/module/bag/presentation/logic/bloc/bag_bloc.dart';
// import 'package:e_commerce/src/module/bag/presentation/logic/counter_cubit/counter_cubit.dart';
// import 'package:e_commerce/src/module/shop/presentation/logic/categories_bloc/categories_bloc.dart';
// import 'package:e_commerce/src/module/shop/presentation/logic/shop_bloc/shop_bloc.dart';
// import 'package:e_commerce/src/module/shop/presentation/logic/sort_toggle_button_cubit/sort_toggle_button_cubit.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'src/module/auth/presentation/logic/auth_event.dart';
// import 'src/module/shop/presentation/logic/category_toggle_btn_cubit/category_toggle_btn_cubit.dart';
// import 'src/module/shop/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
// import 'src/module/shop/presentation/logic/product_bloc/product_bloc.dart';
// import 'src/module/shop/presentation/logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';

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
          //create: (context) => sl<AuthBloc>(),
        ),

        /// Admin
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<BagBloc>(create: (context) => sl<BagBloc>()),
        BlocProvider<CounterCubit>(create: (context) => sl<CounterCubit>()),
        BlocProvider<SortToggleBtnCubit>(
            create: (context) => sl<SortToggleBtnCubit>()),
        // BlocProvider<TypeToggleBtnCubit>(
        //     create: (context) => sl<TypeToggleBtnCubit>()),

        /// Shop
        // //BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        // BlocProvider<OrientationCubit>(
        //     create: (context) => sl<OrientationCubit>()),
        // BlocProvider<SortToggleButtonCubit>(
        //   create: (context) => sl<SortToggleButtonCubit>(),
        // ),
        BlocProvider<CategoryToggleBtnCubit>(
          create: (context) => sl<CategoryToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        // BlocProvider<MultipleToogleBtnCubit>(
        //     create: (context) => sl<MultipleToogleBtnCubit>()),

        //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
        //BlocProvider<TabBarCubit>(create: (context) => sl<TabBarCubit>()),
      ],
      child: await builder(),
    ),
  );
}
