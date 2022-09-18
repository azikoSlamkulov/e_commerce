import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Mobile Layout
        if (constraints.maxWidth <= 600) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: mobile,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              backgroundColor: Colors.blue,
              //backgroundColor: AppBarTheme.of(context).backgroundColor,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              //unselectedLabelStyle: TextStyle(color: Colors.grey),
              selectedFontSize: 12,
              showUnselectedLabels: true,
              items: destinations
                  .map<BottomNavigationBarItem>(
                    (e) => BottomNavigationBarItem(
                      icon: e.icon,
                      label: e.label,
                      activeIcon: e.selectedIcon,
                    ),
                  )
                  .toList(),
              onTap: onDestinationSelected,
            ),
          );
        }

        /// Tablet Layout
        else if (constraints.maxWidth >= 600 && constraints.maxWidth <= 1200) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: constraints.maxWidth >= 800,
                  minExtendedWidth: 180,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                  selectedLabelTextStyle: const TextStyle(color: Colors.red),
                  destinations: destinations
                      .map(
                        (e) => NavigationRailDestination(
                          icon: e.icon,
                          label: Text(e.label),
                          selectedIcon: e.selectedIcon,
                        ),
                      )
                      .toList(),
                ),
                Expanded(child: tablet),
              ],
            ),
          );
        }

        /// Destop Layout
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                extended: constraints.maxWidth >= 800,
                minExtendedWidth: 180,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                selectedLabelTextStyle: const TextStyle(color: Colors.red),
                destinations: destinations
                    .map(
                      (e) => NavigationRailDestination(
                        icon: e.icon,
                        label: Text(e.label),
                        selectedIcon: e.selectedIcon,
                      ),
                    )
                    .toList(),
              ),
              Expanded(child: desktop),
            ],
          ),
        );
      },
    );
  }
}
