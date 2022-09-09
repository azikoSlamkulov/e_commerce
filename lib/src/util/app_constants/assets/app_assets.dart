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
  };

  static Image flutterLogo({required double width, required double height}) =>
      Image.asset(_paths['verification']!, width: width, height: height);

  static Image googleLogo({required double width, required double height}) =>
      Image.asset(_paths['google_logo']!, width: width, height: height);

  static Image facebookLogo({required double width, required double height}) =>
      Image.asset(_paths['facebook_logo']!, width: width, height: height);

  static Image arrow_right({required double width, required double height}) =>
      Image.asset(_paths['arrow_right']!, width: width, height: height);

  static Image chevron_back({required double width, required double height}) =>
      Image.asset(_paths['chevron_back']!, width: width, height: height);

  static AssetImage bgImage() => AssetImage(_paths['bgImage']!);

  ///example
  // static Image emblem({required double width, required double height}) =>
  //     Image.asset(_paths['verification']!, width: width, height: height);

  // static AssetImage bgImage() => AssetImage(_paths['bgImage']!);
}
