import 'dart:developer';

import 'package:e_commerce/src/module/app/root_layout.dart';
import 'package:e_commerce/src/routes/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../module/auth/presentation/logic/auth_bloc.dart';

import '../module/auth/presentation/logic/auth_state.dart';
import '../module/auth/presentation/views/password_recovery.dart';
import '../module/auth/presentation/views/sign_in_vew.dart';
import '../module/auth/presentation/views/sign_up_view.dart';
import '../module/bag/bag_viwe.dart';
import '../module/favorites/favorites_viwe.dart';
import '../module/home/presention/views/home_view.dart';
import '../module/profile/profile_viwe.dart';
import '../module/shop/shop_viwe.dart';
import '../util/app_constants/colors/app_colors.dart';
import '../util/app_widgets/progress/progress.dart';

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
        path: APP_PAGE.signIn.toPath,
        name: APP_PAGE.signIn.toName,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: APP_PAGE.signUp.toPath,
        name: APP_PAGE.signUp.toName,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: APP_PAGE.passwordRecovery.toPath,
        name: APP_PAGE.passwordRecovery.toName,
        builder: (context, state) => PasswordRecoveryView(),
      ),
      GoRoute(
        path: APP_PAGE.home.toPath,
        name: APP_PAGE.home.toName,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: HomeView(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.shop.toPath,
        name: APP_PAGE.shop.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            child: ShopViwe(),
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
            child: BagViwe(),
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
            child: FavoritesViwe(),
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
            child: ProfileViwe(),
          ),
        ),
      ),
    ],
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
    redirect: (state) {
      final homeLocation = state.subloc == APP_PAGE.home.toPath;
      final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
      final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
      final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
      final passwordRecoveryLocation =
          state.subloc == APP_PAGE.passwordRecovery.toPath;
      //final errorLocation = state.subloc == APP_PAGE.error.toPath;

      final isLoading = authBloc.state is LoadingState;
      final isAuthenticated = authBloc.state is AuthenticatedState;
      final isUnAuthenticated = authBloc.state is UnAuthenticatedState;
      final isOpenSignIn = authBloc.state is OpenSignInState;
      final isOpenPasswordRecovery =
          authBloc.state is OpenPasswordRecoveryState;

      if (isLoading) {
        log('1');
        return loadingLocation ? null : APP_PAGE.loading.toPath;
      } else if (isUnAuthenticated) {
        log('2');
        return signUpLocation ? null : APP_PAGE.signUp.toPath;
      } else if (isOpenSignIn) {
        log('3');
        return signInLocation ? null : APP_PAGE.signIn.toPath;
      } else if (isOpenPasswordRecovery) {
        log('4');
        return passwordRecoveryLocation
            ? null
            : APP_PAGE.passwordRecovery.toPath;
      } else if (isAuthenticated) {
        log('5');
        return null;
      }
    },
  );
}
