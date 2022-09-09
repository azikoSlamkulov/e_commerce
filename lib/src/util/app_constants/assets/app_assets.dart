import 'package:flutter/material.dart';

class AppAssets {
  static const String _illustrations = 'assets/png/illustrations';
  static const String _icons = 'assets/png/icons';
  static const String _images = 'assets/images';

  static final Map<String, String> _paths = {
    ///example
    ///'verification': '$_illustrations/emblem.svg',

    // Illustrations
    'verification': '$_illustrations/flutter_logo.png',

    // images
    'bgImage': '$_images/bg.jpg',

    // Icons
    'google_logo': '$_icons/google_logo.png',
    'facebook_logo': '$_icons/facebook_logo.png',
    'arrow_right': '$_icons/arrow_right.png',
    'chevron_back': '$_icons/chevron_back.png',

    'home_icon': '$_icons/home_icon.png',
    'shop_icon': '$_icons/shop_icon.png',
    'bag_icon': '$_icons/bag_icon.png',
    'favorites_icon': '$_icons/favorites_icon.png',
    'profile_icon': '$_icons/profile_icon.png',

    'home_icon_red': '$_icons/home_icon_red.png',
    'shop_icon_red': '$_icons/shop_icon_red.png',
    'bag_icon_red': '$_icons/bag_icon_red.png',
    'favorites_icon_red': '$_icons/favorites_icon_red.png',
    'profile_icon_red': '$_icons/profile_icon_red.png',
  };

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

  static Image flutterLogo({required double width, required double height}) =>
      Image.asset(_paths['verification']!, width: width, height: height);

  static Image googleLogo({required double width, required double height}) =>
      Image.asset(_paths['google_logo']!, width: width, height: height);

  static Image facebookLogo({required double width, required double height}) =>
      Image.asset(_paths['facebook_logo']!, width: width, height: height);

  static Image arrowRight({required double width, required double height}) =>
      Image.asset(_paths['arrow_right']!, width: width, height: height);

  static Image chevronBack({required double width, required double height}) =>
      Image.asset(_paths['chevron_back']!, width: width, height: height);

  static AssetImage bgImage() => AssetImage(_paths['bgImage']!);

  ///example
  // static Image emblem({required double width, required double height}) =>
  //     Image.asset(_paths['verification']!, width: width, height: height);

  // static AssetImage bgImage() => AssetImage(_paths['bgImage']!);
}
