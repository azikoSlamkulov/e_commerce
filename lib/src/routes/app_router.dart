import 'dart:developer';

import 'package:e_commerce/src/routes/root_layout.dart';
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
        //builder: (context, state) => HomeView(),
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
      // for (final route in destinations.skip(5))
      //   GoRoute(
      //     path: route.route,
      //     pageBuilder: (context, state) => MaterialPage<void>(
      //       key: _pageKey,
      //       child: RootLayout(
      //         key: _scaffoldKey,
      //         currentIndex: destinations.indexOf(route),
      //         child: const SizedBox(),
      //       ),
      //     ),
      //   ),
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
        //return homeLocation ? null : APP_PAGE.home.toPath;
      }
      //else {return null;}
    },
  );
}

// GoRouter.of(context).go('/CounterPage');

// final isGoingToLoading = state.subloc == loadingLocation;
// final isGoingToSignIn = state.subloc == signInLocation;
// final isGoingToSignUp = state.subloc == signUpLocation;
//final isGoingToOnboard = state.subloc == onboardLocation;

//errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),

// GoRoute(
      //   path: APP_PAGE.loading.toPath,
      //   name: APP_PAGE.loading.toName,
      //   builder: (context, state) => const SplashPage(),
      // ),
      // GoRoute(
      //   path: APP_PAGE.onBoarding.toPath,
      //   name: APP_PAGE.onBoarding.toName,
      //   builder: (context, state) => const OnBoardingPage(),
      // ),
      // GoRoute(
      //   path: APP_PAGE.error.toPath,
      //   name: APP_PAGE.error.toName,
      //   builder: (context, state) => ErrorPage(error: state.extra.toString()),
      // ),
      // GoRoute(
      //   path: APP_PAGE.error.toPath,
      //   name: APP_PAGE.error.toName,
      //   builder: (context, state) => Scaffold(
      //     backgroundColor: AppColors.white,
      //     body: Center(
      //       child: Text(state.extra.toString()),
      //     ),
      //   ),
      // ),


// // If not Initialized and not going to Initialized redirect to Splash
//       // Если не инициализировано и не будет инициализировано перенаправление на Splash
//       if (!isInitialized && !isGoingToInit) {
//         return splashLocation;
//         // If not onboard and not going to onboard redirect to OnBoarding
//         // Если нет на борту и не собирается на борту перенаправить на OnBoarding
//       } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
//         return onboardLocation;
//         // If not logedin and not going to login redirect to Login
//         // Если вы не вошли в систему и не собираетесь входить в систему, перенаправление на вход
//       } else if (isInitialized &&
//           isOnboarded &&
//           !isLogedIn &&
//           !isGoingToLogin) {
//         return loginLocation;
//         // If all the scenarios are cleared but still going to any of that screen redirect to Home
//         // Если все сценарии очищены, но все еще переходят на любой из этих экранов, перенаправляйтесь на «Домой».
//       } else if ((isLogedIn && isGoingToLogin) ||
//           (isInitialized && isGoingToInit) ||
//           (isOnboarded && isGoingToOnboard)) {
//         return homeLocation;
//       } else {
//         // Else Don't do anything
//         // Иначе ничего не делай
//         return null;
//       }
