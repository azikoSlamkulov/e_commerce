enum APP_PAGE {
  loading,
  signIn,
  signUp,
  home,
  homeVerTwo,
  sale,
  error,
  onBoarding,
  shop,
  bag,
  favorites,
  profile,
  passwordRecovery,
  allNewProducts,
}

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.loading:
        return "/splash";
      case APP_PAGE.signUp:
        return "/signUp";
      case APP_PAGE.signIn:
        return "/signIn";
      case APP_PAGE.passwordRecovery:
        return "/passwordRecovery";
      case APP_PAGE.home:
        return "/";
      case APP_PAGE.homeVerTwo:
        return "homeVerTwo";
      case APP_PAGE.sale:
        return "sale";
      case APP_PAGE.allNewProducts:
        return "allNewProducts";
      case APP_PAGE.shop:
        return "/shop";
      case APP_PAGE.bag:
        return "/bag";
      case APP_PAGE.favorites:
        return "/favorites";
      case APP_PAGE.profile:
        return "/profile";
      case APP_PAGE.onBoarding:
        return "/start";
      case APP_PAGE.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case APP_PAGE.loading:
        return "SPLASH";
      case APP_PAGE.signIn:
        return "SIGNIN";
      case APP_PAGE.signUp:
        return "SIGNUP";
      case APP_PAGE.passwordRecovery:
        return "PASSWORDRECOVERY";

      case APP_PAGE.home:
        return "HOME";
      case APP_PAGE.homeVerTwo:
        return "HOMEVERTWO";
      case APP_PAGE.sale:
        return "SALE";
      case APP_PAGE.allNewProducts:
        return "ALLNEWPRODUCTS";
      case APP_PAGE.shop:
        return "SHOP";
      case APP_PAGE.bag:
        return "BAG";
      case APP_PAGE.favorites:
        return "FAVORITES";
      case APP_PAGE.profile:
        return "PROFILE";
      case APP_PAGE.onBoarding:
        return "START";
      case APP_PAGE.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case APP_PAGE.loading:
        return "My App Splash";
      case APP_PAGE.signIn:
        return "My App Sign In";
      case APP_PAGE.signUp:
        return "My App Sign Up";
      case APP_PAGE.passwordRecovery:
        return "Password Recovery";
      case APP_PAGE.allNewProducts:
        return "Sale";
      case APP_PAGE.home:
        return "My App";
      case APP_PAGE.homeVerTwo:
        return "My Home Ver Two";
      case APP_PAGE.sale:
        return "Sale";
      case APP_PAGE.shop:
        return "Shop";
      case APP_PAGE.bag:
        return "Bag";
      case APP_PAGE.favorites:
        return "Favorites";
      case APP_PAGE.profile:
        return "Profile";
      case APP_PAGE.onBoarding:
        return "Welcome to My App";
      case APP_PAGE.error:
        return "My App Error";
      default:
        return "My App";
    }
  }
}
