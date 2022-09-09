import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_items.dart' as my_items;

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        void onSelectTab(int index) {
          final destination = my_items.items[index];
          context.go(destination.route);
        }

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.blue,
            //backgroundColor: AppBarTheme.of(context).backgroundColor,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            //unselectedLabelStyle: TextStyle(color: Colors.grey),
            selectedFontSize: 12,
            showUnselectedLabels: true,
            items: my_items.items
                .map<BottomNavigationBarItem>(
                  (e) => BottomNavigationBarItem(
                    icon: e.icon!,
                    label: e.label,
                    activeIcon: e.selectedIcon,
                  ),
                )
                .toList(),
            onTap: onSelectTab,
          ),
        );
      },
    );
  }
}
