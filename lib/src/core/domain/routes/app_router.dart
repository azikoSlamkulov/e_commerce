import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/views/views.dart';
import 'package:e_commerce/src/module/admin/dashboard/presentation/views/mobile/mobile_dashboard_view.dart';
import 'package:e_commerce/src/module/admin/orders/presentation/views/mobile/mobile_admin_orders_view.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/views/admin_products_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../module/admin/admin_products/admin_products.dart';

// GoRouter.of(context).goNamed(
//   APP_PAGE.shopCatalog.toName,
// );

// --------------------------------------------------------------------

//context.goNamed(AppPage.signIn.toName);

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

  AppRouter(this.authBloc);

  String userRole = 'user';

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: AppPage.home.toPath,
    routes: <GoRoute>[
      /// Admin
      // GoRoute(
      //   path: AppPage.admin.toPath,
      //   name: AppPage.admin.toName,
      //   //builder: (context, state) => const MobileProfileViwe(),
      //   pageBuilder: (context, state) => const MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 2,
      //       mobile: TestView(),
      //       tablet: TestView(),
      //     ),
      //   ),
      // ),

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
        routes: [],
      ),
      GoRoute(
        path: AppPage.signUp.toPath,
        name: AppPage.signUp.toName,
        builder: (context, state) => const SignUpView(),
        routes: [
          GoRoute(
            path: AppPage.signIn.toPath,
            name: AppPage.signIn.toName,
            builder: (context, state) => const SignInView(),
            routes: [
              GoRoute(
                path: AppPage.passwordRecovery.toPath,
                name: AppPage.passwordRecovery.toName,
                builder: (context, state) => const PasswordRecoveryView(),
              ),
            ],
          ),
        ],
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
              mobile: MobileHomeVerTwoView(),
              tablet: MobileHomeVerTwoView(),
            ),
            routes: [
              GoRoute(
                path: AppPage.homeVerThree.toPath,
                name: AppPage.homeVerThree.toName,
                builder: (context, state) => const RootLayout(
                  key: _scaffoldKey,
                  currentIndex: 0,
                  mobile: MobileHomeVerThreeView(),
                  tablet: MobileHomeVerThreeView(),
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
                builder: (context, state) => MobileCatalogFiltersView(),
                // routes: [
                //   GoRoute(
                //     path: AppPage.filtersBrand.toPath,
                //     name: AppPage.filtersBrand.toName,
                //     builder: (context, state) => MobileBrandView(
                //       selectedBrandsCallback: state.extra as <ValueSetter<List<BrandEntity>>,
                //     ),
                //   ),
                // ],
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
        routes: [
          GoRoute(
            path: AppPage.checkout.toPath,
            name: AppPage.checkout.toName,
            builder: (context, state) => MobileCheckoutView(
              allProducts: state.extra as List<BagEntity>,
              totalAmount: state.queryParams['totalAmount'] as String,
              userId: state.queryParams['userId'] as String,
            ),
            routes: [
              GoRoute(
                path: AppPage.success.toPath,
                name: AppPage.success.toName,
                builder: (context, state) => const SuccessViewSecond(),
              ),
            ],
          ),
        ],
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
            builder: (context, state) => RootLayout(
              key: _scaffoldKey,
              currentIndex: 4,
              mobile:
                  MobileOrdersView(orders: state.extra as List<OrderEntity>),
              tablet:
                  MobileOrdersView(orders: state.extra as List<OrderEntity>),
            ),
            routes: [
              GoRoute(
                path: AppPage.orderDetails.toPath,
                name: AppPage.orderDetails.toName,
                builder: (context, state) => RootLayout(
                  key: _scaffoldKey,
                  currentIndex: 4,
                  mobile:
                      MobileOrderDetailsView(order: state.extra as OrderEntity),
                  tablet:
                      MobileOrderDetailsView(order: state.extra as OrderEntity),
                ),
              ),
            ],
          ),
        ],
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.blue,
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
      final bool loggingIn = state.subloc == AppPage.onBoarding.toPath;
      final bool signUp = state.subloc == AppPage.signUp.toPath;
      final bool loading = authBloc.state is AuthLoadingState;
      //final bool loading = state.subloc == AppPage.loading.toPath;

      if (loading) return AppPage.loading.toPath;
      if (!loggedIn) return loggingIn ? null : AppPage.onBoarding.toPath;
      // if (!loggedIn && !loggingIn && !signUp)
      //   return signUp ? null : AppPage.signUp.toPath;
      //if (loggingIn) return AppPage.home.toPath;
      return null;
    },
  );
}
