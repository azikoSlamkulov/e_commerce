import '../../../lib.dart';

// GoRouter.of(context).goNamed(
//   APP_PAGE.shopCatalog.toName,
// );
// --------------------------------------------------------------------
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => MobileCatalogView(
//       type: type,
//       collection: collection,
//       category: category.name!,
//     ),
//   ),
// );
// --------------------------------------------------------------------

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: AppPage.home.toPath,
    routes: <GoRoute>[
      /// Admin
      GoRoute(
        path: AppPage.admin.toPath,
        name: AppPage.admin.toName,
        //builder: (context, state) => const MobileProfileViwe(),
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            mobile: MobileFavoritesVew(),
            tablet: MobileBagViwe(),
          ),
        ),
      ),

      /// Loading
      GoRoute(
        path: AppPage.loading.toPath,
        name: AppPage.loading.toName,
        builder: (context, state) => const Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            //child: progressIndicator.circularProgress(),
            child: CircularProgressIndicator(),
          ),
        ),
      ),

      /// Auth
      GoRoute(
        path: AppPage.onBoarding.toPath,
        name: AppPage.onBoarding.toName,
        builder: (context, state) => const OnboardingView(),
        routes: [
          GoRoute(
            path: AppPage.signUp.toPath,
            name: AppPage.signUp.toName,
            builder: (context, state) => SignUpView(),
          ),
          GoRoute(
            path: AppPage.signIn.toPath,
            name: AppPage.signIn.toName,
            builder: (context, state) => SignInView(),
          ),
        ],
      ),

      GoRoute(
        path: AppPage.passwordRecovery.toPath,
        name: AppPage.passwordRecovery.toName,
        builder: (context, state) => PasswordRecoveryView(),
      ),

      /// Home
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            mobile: MobileHomeView(),
            tablet: MobileHomeView(),
          ),
        ),
        routes: [
          GoRoute(
            path: AppPage.homeVerTwo.toPath,
            name: AppPage.homeVerTwo.toName,
            builder: (context, state) => const RootLayout(
              key: _scaffoldKey,
              currentIndex: 0,
              mobile: MobileHomeView(),
              tablet: MobileHomeView(),
            ),
            routes: [
              GoRoute(
                path: AppPage.homeVerThree.toPath,
                name: AppPage.homeVerThree.toName,
                builder: (context, state) => const RootLayout(
                  key: _scaffoldKey,
                  currentIndex: 0,
                  mobile: MobileHomeView(),
                  tablet: MobileHomeView(),
                ),
              ),
            ],
          ),
        ],
      ),

      /// Shop
      GoRoute(
        path: AppPage.collections.toPath,
        name: AppPage.collections.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            mobile: MobileCollectionsAndTypesView(),
            tablet: MobileCollectionsAndTypesView(),
          ),
        ),
        routes: [
          GoRoute(
            path: AppPage.categories.toPath,
            name: AppPage.categories.toName,
            builder: (context, state) => RootLayout(
              key: _scaffoldKey,
              currentIndex: 1,
              mobile: MobileCategoriesView(
                type: state.params['type']!,
                collection: state.params['collection']!,
              ),
              tablet: MobileCategoriesView(
                type: state.params['type']!,
                collection: state.params['collection']!,
              ),
            ),
          ),
          GoRoute(
            path: AppPage.catalog.toPath,
            name: AppPage.catalog.toName,
            builder: (context, state) => RootLayout(
              key: _scaffoldKey,
              currentIndex: 1,
              mobile: MobileCatalogView(
                type: state.queryParams['type']!,
                collection: state.queryParams['collection']!,
                category: state.queryParams['category']!,
                allCategories: state.extra as List<CategoryEntity>,
              ),
              tablet: MobileCatalogView(
                type: state.queryParams['type']!,
                collection: state.queryParams['collection']!,
                category: state.queryParams['category']!,
                allCategories: state.extra as List<CategoryEntity>,
              ),
            ),
            routes: [
              GoRoute(
                path: AppPage.catalogFilters.toPath,
                name: AppPage.catalogFilters.toName,
                builder: (context, state) => const MobileFiltersView(),
                routes: [
                  GoRoute(
                    path: AppPage.filtersBrand.toPath,
                    name: AppPage.filtersBrand.toName,
                    builder: (context, state) => const MobileBrandView(),
                  ),
                ],
              ),
              // GoRoute(
              //   path: APP_PAGE.shopProductCard.toPath,
              //   name: APP_PAGE.shopProductCard.toName,
              //   builder: (context, state) => const MobileProductCard(),
              //   routes: [
              //     GoRoute(
              //       path: APP_PAGE.shopRatingAndReviews.toPath,
              //       name: APP_PAGE.shopRatingAndReviews.toName,
              //       builder: (context, state) => const RatingAndReviewsView(),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),

      /// Bag
      GoRoute(
        path: AppPage.bag.toPath,
        name: AppPage.bag.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            //child: BagViwe(),
            mobile: MobileBagViwe(),
            tablet: MobileBagViwe(),
          ),
        ),
      ),

      /// Favorites
      GoRoute(
        path: AppPage.favorites.toPath,
        name: AppPage.favorites.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            //child: FavoritesViwe(),
            mobile: MobileFavoritesVew(),
            tablet: MobileFavoritesVew(),
          ),
        ),
      ),

      /// Profile
      GoRoute(
        path: AppPage.profile.toPath,
        name: AppPage.profile.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 4,
            //child: ProfileViwe(),
            mobile: MobileProfileViwe(),
            tablet: MobileProfileViwe(),
          ),
        ),
        routes: [
          GoRoute(
            path: AppPage.orders.toPath,
            name: AppPage.orders.toName,
            builder: (context, state) => const RootLayout(
              key: _scaffoldKey,
              currentIndex: 4,
              mobile: MobileOrdersView(),
              tablet: MobileOrdersView(),
            ),
            routes: [
              GoRoute(
                path: AppPage.orderDetails.toPath,
                name: AppPage.orderDetails.toName,
                builder: (context, state) => const RootLayout(
                  key: _scaffoldKey,
                  currentIndex: 4,
                  mobile: MobileOrderDetailsView(),
                  tablet: MobileOrderDetailsView(),
                ),
              ),
            ],
          ),
        ],
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
    redirect: (context, state) {
      // --- 1 ---
      final bool loggedIn = authBloc.state is AuthenticatedState;
      final bool loggingIn = state.subloc == AppPage.home.toPath;
      final bool onBoarding = state.subloc == AppPage.onBoarding.toPath;
      // final bool signUp = state.subloc == AppPage.signUp.toPath;
      // final bool signIn = state.subloc == AppPage.signIn.toPath;
      // final bool passwordRecovery =
      //     state.subloc == AppPage.passwordRecovery.toPath;
      final bool loading = authBloc.state is AuthLoadingState;
      //final bool loading = state.subloc == AppPage.loading.toPath;

      if (loading) {
        return AppPage.loading.toPath;
      } else if (!loggedIn) {
        return onBoarding ? null : AppPage.onBoarding.toPath;
      } else if (loggingIn) {
        return AppPage.home.toPath;
      }
      return null;

      //   if (loading) {
      //     return loading ? null : AppPage.loading.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       !signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return onBoarding ? null : AppPage.onBoarding.toPath;
      //   } else if (!loggedIn &&
      //       signUp &&
      //       !signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return signUp ? null : AppPage.signUp.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return signIn ? null : AppPage.signIn.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       !signIn &&
      //       passwordRecovery &&
      //       !onBoarding) {
      //     return passwordRecovery ? null : AppPage.passwordRecovery.toPath;
      //   } else if (loggingIn) {
      //     return AppPage.home.toPath;
      //   }
      //   return null;
    },

    // --- 2 ----
    // redirect: (context, state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
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

    //   final isGoingToLogin = state.subloc == signInLocation;
    //   final isGoingToSignUp = state.subloc == signUpLocation;
    //   // final isGoingToInit = state.subloc == splashLocation;
    //   final isGoingToOnboard = state.subloc == onBoardingLocation;

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     // return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //     return APP_PAGE.onBoarding.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     //return homeLocation ? null : APP_PAGE.home.toPath;
    //     return null;
    //   }
    //   return null;

    // ---- 3 ----
    // redirect: (context, state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
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

    //   final isGoingToLogin = state.subloc == signInLocation;
    //   final isGoingToSignUp = state.subloc == signUpLocation;
    //   // final isGoingToInit = state.subloc == splashLocation;
    //   final isGoingToOnboard = state.subloc == onBoardingLocation;

    //   // if (isLoading) {
    //   //   log('1');
    //   //   return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     !signUpLocation &&
    //   //     signInLocation &&
    //   //     passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/signUp";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/signIn";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/passwordRecovery";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (isAuthenticated) {
    //   //   log('4');
    //   //   return null;
    //   // }

    //   // if (!isInitialized && !isGoingToInit) {
    //   //   return splashLocation;
    //   //   // If not onboard and not going to onboard redirect to OnBoarding
    //   // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
    //   //   return onboardLocation;
    //   //   // If not logedin and not going to login redirect to Login
    //   // } else if (isInitialized &&
    //   //     isOnboarded &&
    //   //     !isLogedIn &&
    //   //     !isGoingToLogin) {
    //   //   return loginLocation;
    //   //   // If all the scenarios are cleared but still going to any of that screen redirect to Home
    //   // } else if ((isLogedIn && isGoingToLogin) ||
    //   //     (isInitialized && isGoingToInit) ||
    //   //     (isOnboarded && isGoingToOnboard)) {
    //   //   return homeLocation;
    //   // } else {
    //   //   // Else Don't do anything
    //   //   return null;
    //   // }

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     // return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //     return APP_PAGE.onBoarding.toPath;

    //     // } else if (isOpenSignUp) {
    //     //   log('2');
    //     //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //     // } else if (isOpenSignIn) {
    //     //   log('3');
    //     //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //     // } else if (isOpenPasswordRecovery) {
    //     //   log('4');
    //     //   return passwordRecoveryLocation
    //     //       ? null
    //     //       : APP_PAGE.passwordRecovery.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     //return homeLocation ? null : APP_PAGE.home.toPath;
    //     return null;
    //   }
    //   return null;

    //   // if (isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('1');
    //   //   return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return passwordRecoveryLocation
    //   //       ? null
    //   //       : APP_PAGE.passwordRecovery.toPath;

    //   //   //return APP_PAGE.onBoarding.toPath;

    //   //   // } else if (isOpenSignUp) {
    //   //   //   log('2');
    //   //   //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   //   // } else if (isOpenSignIn) {
    //   //   //   log('3');
    //   //   //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   //   // } else if (isOpenPasswordRecovery) {
    //   //   //   log('4');
    //   //   //   return passwordRecoveryLocation
    //   //   //       ? null
    //   //   //       : APP_PAGE.passwordRecovery.toPath;
    //   // } else if (homeLocation) {
    //   //   log('5');
    //   //   return homeLocation ? null : APP_PAGE.home.toPath;
    //   //   return null;
    //   // }
    //   // return null;
    // },
  );
}
