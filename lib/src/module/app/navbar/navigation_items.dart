import 'package:flutter/material.dart';

import '../../../util/app_constants/assets/app_assets.dart';

List<CustomNavigationDestination> destinations = [
  CustomNavigationDestination(
    label: 'Home',
    //icon: Icon(Icons.home),
    icon: AppAssets.homeIcon(width: 30, height: 30),
    selectedIcon: AppAssets.homeIconRed(width: 30, height: 30),
    route: '/',
  ),
  CustomNavigationDestination(
    label: 'Shop',
    icon: AppAssets.shopIcon(width: 30, height: 30),
    selectedIcon: AppAssets.shopIconRed(width: 30, height: 30),
    route: '/shopCategoriesFirst',
  ),
  CustomNavigationDestination(
    label: 'Bag',
    icon: AppAssets.bagIcon(width: 30, height: 30),
    selectedIcon: AppAssets.bagIconRed(width: 30, height: 30),
    route: '/bag',
  ),
  CustomNavigationDestination(
    label: 'Favorites',
    icon: AppAssets.favoritesIcon(width: 30, height: 30),
    selectedIcon: AppAssets.favoritesIconRed(width: 30, height: 30),
    route: '/favorites',
  ),
  CustomNavigationDestination(
    label: 'Profile',
    icon: AppAssets.profileIcon(width: 30, height: 30),
    selectedIcon: AppAssets.profileIconRed(width: 30, height: 30),
    route: '/profile',
  ),
];

class CustomNavigationDestination {
  const CustomNavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.child,
  });

  final String route;
  final String label;
  final Widget? icon;
  final Widget? selectedIcon;
  final Widget? child;
}
