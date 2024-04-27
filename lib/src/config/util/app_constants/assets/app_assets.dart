import 'package:flutter/material.dart';

class AppAssets {
  static const String _illustrations = 'assets/png/illustrations';
  static const String _icons = 'assets/png/icons';
  static const String _navBarIcons = 'assets/png/icons/navbar';
  static const String _onBoardingIcons = 'assets/png/icons/onboarding';
  static const String _images = 'assets/images';
  static const String _homeSliderImages = 'assets/images/home_slider';
  // static const String _onBoardingImages =
  //     'assets/images/home_slider/onboarding';

  static final Map<String, String> _paths = {
    ///example
    ///'verification': '$_illustrations/emblem.svg',

    // Illustrations
    'verification': '$_illustrations/flutter_logo.png',

    // images
    'home_slider_image_1': '$_homeSliderImages/black_friday_sale.jpg',
    'home_slider_image_2': '$_homeSliderImages/super_sale.jpg',
    'home_slider_image_3': '$_homeSliderImages/new_collection_1.jpg',
    'home_slider_image_4': '$_homeSliderImages/new_collection_2.jpg',
    'home_slider_image_5': '$_homeSliderImages/clothes.jpg',
    'sale_bg': '$_images/sale_bg_3.jpg',
    'bgImage2': '$_images/bgImage11.jpg',
    'image2': '$_images/image_2.jpg',
    'image3': '$_images/image_3.jpg',
    'image4': '$_images/image_4.jpg',
    'image5': '$_images/image_5.jpg',
    'image6': '$_images/image_6.jpg',
    'collections_new': '$_images/collections_new.jpg',
    'collections_clothes': '$_images/collections_clothes.jpg',
    'collections_shoes': '$_images/collections_shoes.jpeg',
    'collections_accesories': '$_images/collections_accesories.jpg',
    'success': '$_images/success_image.jpg',

    // Icons
    'onboarding_icon_1': '$_onBoardingIcons/clothes_men.png',
    'onboarding_icon_2': '$_onBoardingIcons/clothes_women.png',
    'onboarding_icon_3': '$_onBoardingIcons/kids_shoes.png',
    'onboarding_icon_4': '$_onBoardingIcons/shoes.png',
    'google_logo': '$_icons/google_logo.png',
    'facebook_logo': '$_icons/facebook_logo.png',
    'arrow_right': '$_icons/arrow_right.png',
    'chevron_back': '$_icons/chevron_back.png',
    'dhl': '$_icons/dhl.png',
    'fedex': '$_icons/fedex.png',
    'usps': '$_icons/usps.png',
    'empty_cart': '$_icons/empty_cart.png',

    ///card
    'card_1': '$_icons/card_1.png',
    'card_2': '$_icons/card_2.png',
    'mastercard': '$_icons/mastercard.png',
    'mastercard_white': '$_icons/mastercard_white.png',
    'visa': '$_icons/visa.png',
    'helper_icon': '$_icons/help_outline.png',
    'chip_icon': '$_icons/chip.png',

    'success_icon': '$_icons/success_icon.png',

    /// navbar icons
    'home_icon': '$_navBarIcons/home_icon.png',
    'shop_icon': '$_navBarIcons/shop_icon.png',
    'bag_icon': '$_navBarIcons/bag_icon.png',
    'favorites_icon': '$_navBarIcons/favorites_icon.png',
    'profile_icon': '$_navBarIcons/profile_icon.png',

    'home_icon_red': '$_navBarIcons/home_icon_red.png',
    'shop_icon_red': '$_navBarIcons/shop_icon_red.png',
    'bag_icon_red': '$_navBarIcons/bag_icon_red.png',
    'favorites_icon_red': '$_navBarIcons/favorites_icon_red.png',
    'profile_icon_red': '$_navBarIcons/profile_icon_red.png',

    /// Error
    'error_icon': '$_icons/error_icon.png',
  };

  /// Error
  static Image errorIcon({required double width, required double height}) =>
      Image.asset(_paths['error_icon']!, width: width, height: height);

  /// images
  static AssetImage bgImage() => AssetImage(_paths['bgImage']!);
  static AssetImage bgImage2() => AssetImage(_paths['bgImage2']!);
  static AssetImage saleBg() => AssetImage(_paths['sale_bg']!);
  static AssetImage image2() => AssetImage(_paths['image2']!);
  static AssetImage image3() => AssetImage(_paths['image3']!);
  static AssetImage image4() => AssetImage(_paths['image4']!);
  static AssetImage image5() => AssetImage(_paths['image5']!);
  static AssetImage image6() => AssetImage(_paths['image6']!);

  static AssetImage successBgImage() => AssetImage(_paths['success']!);

  ///card
  static AssetImage card_1() => AssetImage(_paths['card_1']!);
  static AssetImage card_2() => AssetImage(_paths['card_2']!);
  // static AssetImage collectionsNew() => AssetImage(_paths['collections_new']!);
  // static AssetImage collectionsClothes() =>
  //     AssetImage(_paths['collections_clothes']!);
  // static AssetImage collectionsShoes() =>
  //     AssetImage(_paths['collections_shoes']!);
  // static AssetImage collectionsAccesories() =>
  //     AssetImage(_paths['collections_accesories']!);

  static AssetImage mastercard_2() => AssetImage(_paths['mastercard']!);
  static AssetImage dhlImage() => AssetImage(_paths['dhl']!);
  static AssetImage fedexImage() => AssetImage(_paths['fedex']!);
  static AssetImage uspsImage() => AssetImage(_paths['usps']!);
  static AssetImage chip() => AssetImage(_paths['chip_icon']!);

  /// navbar icons
  static Image homeIcon({required double width, required double height}) =>
      Image.asset(_paths['home_icon']!, width: width, height: height);
  static Image shopIcon({required double width, required double height}) =>
      Image.asset(_paths['shop_icon']!, width: width, height: height);
  static Image bagIcon({required double width, required double height}) =>
      Image.asset(_paths['bag_icon']!, width: width, height: height);
  static Image favoritesIcon({required double width, required double height}) =>
      Image.asset(_paths['favorites_icon']!, width: width, height: height);
  static Image profileIcon({required double width, required double height}) =>
      Image.asset(_paths['profile_icon']!, width: width, height: height);

  static Image homeIconRed({required double width, required double height}) =>
      Image.asset(_paths['home_icon_red']!, width: width, height: height);
  static Image shopIconRed({required double width, required double height}) =>
      Image.asset(_paths['shop_icon_red']!, width: width, height: height);
  static Image bagIconRed({required double width, required double height}) =>
      Image.asset(_paths['bag_icon_red']!, width: width, height: height);
  static Image favoritesIconRed(
          {required double width, required double height}) =>
      Image.asset(_paths['favorites_icon_red']!, width: width, height: height);
  static Image profileIconRed(
          {required double width, required double height}) =>
      Image.asset(_paths['profile_icon_red']!, width: width, height: height);

  /// card
  static Image cardImage_1({required double width, required double height}) =>
      Image.asset(_paths['card_1']!,
          width: width, height: height, fit: BoxFit.fill);
  static Image cardImage_2({required double width, required double height}) =>
      Image.asset(_paths['card_2']!,
          width: width, height: height, fit: BoxFit.fill);
  static Image mastercard({required double width, required double height}) =>
      Image.asset(_paths['mastercard']!, width: width, height: height);
  static Image mastercardWhite(
          {required double width, required double height}) =>
      Image.asset(_paths['mastercard_white']!, width: width, height: height);
  static Image visa({required double width, required double height}) =>
      Image.asset(_paths['visa']!, width: width, height: height);
  static Image helperIcon({required double width, required double height}) =>
      Image.asset(_paths['helper_icon']!, width: width, height: height);

  static Image dhl({required double width, required double height}) =>
      Image.asset(_paths['dhl']!, width: width, height: height);
  static Image fedex({required double width, required double height}) =>
      Image.asset(_paths['fedex']!, width: width, height: height);
  static Image usps({required double width, required double height}) =>
      Image.asset(_paths['usps']!, width: width, height: height);

  static Image chipIcon({required double width, required double height}) =>
      Image.asset(_paths['chip_icon']!, width: width, height: height);

  static Image successIcon({required double width, required double height}) =>
      Image.asset(_paths['success_icon']!, width: width, height: height);

  static Image flutterLogo({required double width, required double height}) =>
      Image.asset(_paths['verification']!, width: width, height: height);
  static Image googleLogo({double? width, double? height}) =>
      Image.asset(_paths['google_logo']!, width: width, height: height);
  static Image facebookLogo({double? width, double? height}) =>
      Image.asset(_paths['facebook_logo']!, width: width, height: height);
  static Image arrowRight({required double width, required double height}) =>
      Image.asset(_paths['arrow_right']!, width: width, height: height);
  static Image chevronBack({required double width, required double height}) =>
      Image.asset(_paths['chevron_back']!, width: width, height: height);
  static Image collectionsNew(
          {required double width, required double height}) =>
      Image.asset(
        _paths['collections_new']!,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
  static Image collectionsClothes(
          {required double width, required double height}) =>
      Image.asset(
        _paths['collections_clothes']!,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
  static Image collectionsShoes(
          {required double width, required double height}) =>
      Image.asset(
        _paths['collections_shoes']!,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
  static Image collectionsAccesories(
          {required double width, required double height}) =>
      Image.asset(
        _paths['collections_accesories']!,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );

  static Image emptyCart({required double width, required double height}) =>
      Image.asset(_paths['empty_cart']!, width: width, height: height);

  static AssetImage emptyCart2() => AssetImage(_paths['empty_cart']!);

  ///example
  // static Image emblem({required double width, required double height}) =>
  //     Image.asset(_paths['verification']!, width: width, height: height);

  // static AssetImage bgImage() => AssetImage(_paths['bgImage']!);
}
