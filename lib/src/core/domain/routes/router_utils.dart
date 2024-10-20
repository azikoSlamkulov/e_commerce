enum AppPage {
  /// Auth
  loading,
  signIn,
  signUp,

  /// Home
  home,
  homeVerTwo,
  homeVerThree,
  error,
  onBoarding,

  /// Shop
  collections,
  categories,
  catalog,
  catalogFilters,
  filtersBrand,
  shopProductCard,
  shopRatingAndReviews,

  /// Bag
  bag,
  checkout,
  success,

  /// Favorites
  favorites,

  /// Profile
  profile,
  passwordRecovery,
  allNewProducts,
  orders,
  orderDetails,

  /// Admin
  admin,
  mobileAddProduct,

  /// Dashboard
  dashboard,

  /// Orders
  adminOrders,

  /// Products
  adminProducts,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.loading:
        return "/splash";
      case AppPage.onBoarding:
        return "/start";
      case AppPage.signUp:
        return "/signUp";
      case AppPage.signIn:
        return "signIn";
      case AppPage.passwordRecovery:
        return "passwordRecovery";

      /// Home
      case AppPage.home:
        return "/";
      case AppPage.homeVerTwo:
        return "homeVerTwo";
      case AppPage.homeVerThree:
        return "homeVerThree";
      case AppPage.allNewProducts:
        return "allNewProducts";

      /// Shop
      case AppPage.collections:
        return "/collections";
      case AppPage.categories:
        return "categories/:type/:collection";
      case AppPage.catalog:
        return "catalog";
      case AppPage.catalogFilters:
        return "catalogFilters";
      case AppPage.filtersBrand:
        return "filtersBrand";
      case AppPage.shopProductCard:
        return "shopProductCard";
      case AppPage.shopRatingAndReviews:
        return "shopTatingAndReviews";

      /// Bag
      case AppPage.bag:
        return "/bag";
      case AppPage.checkout:
        return "checkout";
      case AppPage.success:
        return "success";

      /// Favorites
      case AppPage.favorites:
        return "/favorites";

      /// Profile
      case AppPage.profile:
        return "/profile";
      case AppPage.orders:
        return "order";
      case AppPage.orderDetails:
        return "orderDetails";

      /// Error
      case AppPage.error:
        return "/error";

      /// Admin
      case AppPage.admin:
        return "/admin";
      case AppPage.mobileAddProduct:
        return "/mobileAddProduct";

      case AppPage.dashboard:
        return "/dashboard";

      case AppPage.adminOrders:
        return "/adminOrders";

      case AppPage.adminProducts:
        return "/adminProducts";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.loading:
        return "SPLASH";
      case AppPage.signIn:
        return "SIGNIN";
      case AppPage.signUp:
        return "SIGNUP";
      case AppPage.passwordRecovery:
        return "PASSWORDRECOVERY";

      /// Home
      case AppPage.home:
        return "HOME";
      case AppPage.homeVerTwo:
        return "HOMEVERTWO";
      case AppPage.homeVerThree:
        return "HOMEVERTHREE";
      case AppPage.allNewProducts:
        return "ALLNEWPRODUCTS";

      /// Shop
      case AppPage.collections:
        return "COLLECTIONS";
      case AppPage.categories:
        return "CATEGORIES";
      case AppPage.catalog:
        return "CATALOG";
      case AppPage.catalogFilters:
        return "CATALOGFILTERS";
      case AppPage.filtersBrand:
        return "FILTERSBRAND";
      case AppPage.shopProductCard:
        return "SHOPPRODUCTCARD";
      case AppPage.shopRatingAndReviews:
        return "SHOPRATINGANDREVIEWS";

      /// Bag
      case AppPage.bag:
        return "BAG";
      case AppPage.checkout:
        return "CHECKOUT";
      case AppPage.success:
        return "SUCCESS";

      /// Favorites
      case AppPage.favorites:
        return "FAVORITES";

      /// Profile
      case AppPage.profile:
        return "PROFILE";
      case AppPage.orders:
        return "ORDERS";
      case AppPage.orderDetails:
        return "ORDERDETAILS";

      case AppPage.onBoarding:
        return "START";

      /// Error
      case AppPage.error:
        return "ERROR";

      /// Admin
      case AppPage.admin:
        return "ADMIN";
      case AppPage.mobileAddProduct:
        return "MOBILEADDPRODUCT";

      /// Dashboard
      case AppPage.dashboard:
        return "DASHBOARD";

      /// Orders
      case AppPage.adminOrders:
        return "ADMINORDERS";

      /// Products
      case AppPage.adminProducts:
        return "ADMINPRODUCTS";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.loading:
        return "My App Splash";
      case AppPage.signIn:
        return "My App Sign In";
      case AppPage.signUp:
        return "My App Sign Up";
      case AppPage.passwordRecovery:
        return "Password Recovery";

      case AppPage.allNewProducts:
        return "Sale";

      /// Home
      case AppPage.home:
        return "My App";
      case AppPage.homeVerTwo:
        return "My Home ver. 2";
      case AppPage.homeVerThree:
        return "My Home ver. 3";

      /// Shop
      case AppPage.collections:
        return "Colections";
      case AppPage.categories:
        return "Categories";
      case AppPage.catalog:
        return "Catalog";
      case AppPage.catalogFilters:
        return "Filters";
      case AppPage.filtersBrand:
        return "Brand";
      case AppPage.shopProductCard:
        return "shopProductCard";
      case AppPage.shopRatingAndReviews:
        return "shopTatingAndReviews";

      /// Bag
      case AppPage.bag:
        return "Bag";
      case AppPage.checkout:
        return "Checkout";
      case AppPage.success:
        return "Success";

      /// Favorites
      case AppPage.favorites:
        return "Favorites";

      /// Profile
      case AppPage.profile:
        return "Profile";
      case AppPage.orders:
        return "My Orders";
      case AppPage.orderDetails:
        return "Order Details";

      case AppPage.onBoarding:
        return "Welcome to My App";

      case AppPage.error:
        return "My App Error";

      /// Admin
      case AppPage.admin:
        return "admin";
      default:
        return "My App";
    }
  }
}
