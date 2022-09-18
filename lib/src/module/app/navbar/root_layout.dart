import 'package:e_commerce/src/module/app/navbar/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_items.dart' as my_des;

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.currentIndex,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final int currentIndex;
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        void onSelectTab(int index) {
          final destination = my_des.destinations[index];
          context.go(destination.route);
        }

        return AdaptiveNavigation(
          key: _navigationRailKey,
          selectedIndex: currentIndex,
          onDestinationSelected: onSelectTab,
          destinations: my_des.destinations
              .map<NavigationDestination>(
                (e) => NavigationDestination(
                    icon: e.icon!,
                    label: e.label,
                    selectedIcon: e.selectedIcon),
              )
              .toList(),
          mobile: mobile,
          tablet: tablet,
          desktop: desktop,
        );
      },
    );
  }
}
