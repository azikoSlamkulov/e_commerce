import 'package:e_commerce/src/module/app/navbar/root_layout.dart';
import 'package:e_commerce/src/module/home/presention/views/mobile_home_view_ver_two.dart';
import 'package:e_commerce/src/module/home/presention/views/tablet_sale_view.dart';
import 'package:e_commerce/src/module/onboarding/onboarding_view.dart';
import 'package:e_commerce/src/module/app/routes/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/logic/auth_bloc.dart';

import '../../auth/presentation/logic/auth_state.dart';
import '../../auth/presentation/views/password_recovery.dart';
import '../../auth/presentation/views/sign_in_vew.dart';
import '../../auth/presentation/views/sign_up_view.dart';
import '../../bag/mobile_bag_viwe.dart';
import '../../bag/tablet_bag_viwe.dart';
import '../../favorites/mobile_favorites_viwe.dart';
import '../../favorites/tablet_favorites_viwe.dart';
import '../../home/presention/views/mobile_home_view.dart';
import '../../home/presention/views/mobile_sale_view.dart';
import '../../home/presention/views/tablet_home_view.dart';
import '../../home/presention/views/tablet_home_view_ver_two.dart';
import '../../profile/presentation/views/mobile_profile_viwe.dart';
import '../../profile/presentation/views/tablet_profile_viwe.dart';
import '../../../util/app_constants/colors/app_colors.dart';
import '../../../util/app_widgets/progress/progress.dart';

import '../../shop/pesentation/views/categories/mobile_categories_viwe.dart';
import '../../shop/pesentation/views/categories/tablet_categories_viwe.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: APP_PAGE.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: APP_PAGE.loading.toPath,
        name: APP_PAGE.loading.toName,
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.black,
          body: Center(
            child: progressIndicator.circularProgress(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.onBoarding.toPath,
        name: APP_PAGE.onBoarding.toName,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: APP_PAGE.signUp.toPath,
        name: APP_PAGE.signUp.toName,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: APP_PAGE.signIn.toPath,
        name: APP_PAGE.signIn.toName,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: APP_PAGE.passwordRecovery.toPath,
        name: APP_PAGE.passwordRecovery.toName,
        builder: (context, state) => PasswordRecoveryView(),
      ),
      // GoRoute(
      //     path: APP_PAGE.home_2.toPath,
      //     name: APP_PAGE.home_2.toName,
      //     pageBuilder: (context, state) {
      //       final allSortedProducts = ProductEntity.(state.params['allSortedProducts']!);
      //       return HomeView(
      //         allSortedProducts: allSortedProducts,
      //       );
      //     }
      //     //final allSortedProducts = APP_PAGE.home_2(state.params['allSortedProducts']!);
      //     ),
      // Bottom Nav Bar
      GoRoute(
        path: APP_PAGE.home.toPath,
        name: APP_PAGE.home.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            mobile: MobileHomeView(),
            tablet: TabletHomeView(),
          ),
        ),
        routes: [
          GoRoute(
            path: APP_PAGE.homeVerTwo.toPath,
            name: APP_PAGE.homeVerTwo.toName,
            builder: (context, state) => const RootLayout(
              key: _scaffoldKey,
              currentIndex: 0,
              mobile: MobileHomeViewVerTwo(),
              tablet: TabletHomeViewVerTwo(),
            ),
          ),
          GoRoute(
            path: APP_PAGE.sale.toPath,
            name: APP_PAGE.sale.toName,
            builder: (context, state) => const RootLayout(
              key: _scaffoldKey,
              currentIndex: 0,
              mobile: MobileSaleView(),
              tablet: TabletSaleView(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: APP_PAGE.shop.toPath,
        name: APP_PAGE.shop.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            mobile: MobileCategoriesView(),
            tablet: TabletCategoriesView(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.bag.toPath,
        name: APP_PAGE.bag.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            //child: BagViwe(),
            mobile: MobileBagViwe(),
            tablet: TabletBagViwe(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.favorites.toPath,
        name: APP_PAGE.favorites.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            //child: FavoritesViwe(),
            mobile: MobileFavoritesViwe(),
            tablet: TabletFavoritesViwe(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.profile.toPath,
        name: APP_PAGE.profile.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 4,
            //child: ProfileViwe(),
            mobile: MobileProfileViwe(),
            tablet: TabletProfileViwe(),
          ),
        ),
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          state.extra.toString(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ),

    // Redirect
    // redirect: (state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final passwordRecoveryLocation =
    //       state.subloc == APP_PAGE.passwordRecovery.toPath;
    //   //final errorLocation = state.subloc == APP_PAGE.error.toPath;

    //   final isLoading = authBloc.state is LoadingState;
    //   final isAuthenticated = authBloc.state is AuthenticatedState;
    //   final isUnAuthenticated = authBloc.state is UnAuthenticatedState;
    //   final isOpenSignUp = authBloc.state is OpenSignUpState;
    //   final isOpenSignIn = authBloc.state is OpenSignInState;
    //   final isOpenPasswordRecovery =
    //       authBloc.state is OpenPasswordRecoveryState;

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //   } else if (isOpenSignUp) {
    //     log('2');
    //     return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   } else if (isOpenSignIn) {
    //     log('3');
    //     return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   } else if (isOpenPasswordRecovery) {
    //     log('4');
    //     return passwordRecoveryLocation
    //         ? null
    //         : APP_PAGE.passwordRecovery.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     return null;
    //   }
    // },
  );
}
