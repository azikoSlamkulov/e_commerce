enum AppPage {
  /// Auth
  loading,
  signIn,
  signUp,

  /// Home
  home,
  homeVerTwo,
  sale,
  error,
  onBoarding,

  /// Shop
  shopCategoriesFirst,
  shopCategoriesSecond,
  shopCatalog,
  shopFilters,
  shopBrand,
  shopProductCard,
  shopRatingAndReviews,

  /// Bag
  bag,

  /// Favorites
  favorites,

  /// Profile
  profile,
  passwordRecovery,
  allNewProducts,

  /// Admin
  admin,
  mobileAddProduct,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.loading:
        return "/splash";
      case AppPage.onBoarding:
        return "/start";
      case AppPage.signUp:
        return "signUp";
      case AppPage.signIn:
        return "signIn";
      case AppPage.passwordRecovery:
        return "/passwordRecovery";

      /// Home
      case AppPage.home:
        return "/";
      case AppPage.homeVerTwo:
        return "homeVerTwo";
      case AppPage.sale:
        return "sale";
      case AppPage.allNewProducts:
        return "allNewProducts";

      /// Shop
      case AppPage.shopCategoriesFirst:
        return "/shopCategoriesFirst";
      case AppPage.shopCategoriesSecond:
        return "shopCategoriesSecond/:type/:collection";
      case AppPage.shopCatalog:
        return "shopCatalog";
      case AppPage.shopFilters:
        return "shopFilters";
      case AppPage.shopBrand:
        return "shopBrand";
      case AppPage.shopProductCard:
        return "shopProductCard";
      case AppPage.shopRatingAndReviews:
        return "shopTatingAndReviews";

      /// Bag
      case AppPage.bag:
        return "/bag";

      /// Favorites
      case AppPage.favorites:
        return "/favorites";

      /// Profile
      case AppPage.profile:
        return "/profile";
      case AppPage.error:
        return "/error";

      /// Admin
      case AppPage.admin:
        return "/admin";
      case AppPage.mobileAddProduct:
        return "/mobileAddProduct";

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
      case AppPage.sale:
        return "SALE";
      case AppPage.allNewProducts:
        return "ALLNEWPRODUCTS";

      /// Shop
      case AppPage.shopCategoriesFirst:
        return "SHOPCATEGORIESFIRST";
      case AppPage.shopCategoriesSecond:
        return "SHOPCATEGORIESSECOND";
      case AppPage.shopCatalog:
        return "SHOPCATALOG";
      case AppPage.shopFilters:
        return "SHOPFILTERS";
      case AppPage.shopBrand:
        return "SHOPBRAND";
      case AppPage.shopProductCard:
        return "SHOPPRODUCTCARD";
      case AppPage.shopRatingAndReviews:
        return "SHOPRATINGANDREVIEWS";

      /// Bag
      case AppPage.bag:
        return "BAG";

      /// Favorites
      case AppPage.favorites:
        return "FAVORITES";

      /// Profile
      case AppPage.profile:
        return "PROFILE";
      case AppPage.onBoarding:
        return "START";
      case AppPage.error:
        return "ERROR";

      /// Admin
      case AppPage.admin:
        return "ADMIN";
      case AppPage.mobileAddProduct:
        return "MOBILEADDPRODUCT";

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
        return "My Home Ver Two";
      case AppPage.sale:
        return "Sale";

      /// Shop
      case AppPage.shopCategoriesFirst:
        return "shopCategoriesFirst";
      case AppPage.shopCategoriesSecond:
        return "shopCategoriesSecond";
      case AppPage.shopCatalog:
        return "shopCatalog";
      case AppPage.shopFilters:
        return "shopFilters";
      case AppPage.shopBrand:
        return "shopBrand";
      case AppPage.shopProductCard:
        return "shopProductCard";
      case AppPage.shopRatingAndReviews:
        return "shopTatingAndReviews";

      /// Bag
      case AppPage.bag:
        return "Bag";

      /// Favorites
      case AppPage.favorites:
        return "Favorites";

      /// Profile
      case AppPage.profile:
        return "Profile";
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
