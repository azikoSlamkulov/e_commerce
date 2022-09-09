import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'adaptive_navigation.dart';
import 'destinations.dart' as my_des;

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        void onSelected(int index) {
          final destination = my_des.destinations[index];
          context.go(destination.route);
        }

        return AdaptiveNavigation(
          key: _navigationRailKey,
          selectedIndex: currentIndex,
          onDestinationSelected: onSelected,
          destinations: my_des.destinations
              .map<NavigationDestination>(
                (e) => NavigationDestination(
                  icon: e.icon,
                  label: e.label,
                ),
              )
              .toList(),
          child: child,
        );
      },
    );
  }
}
