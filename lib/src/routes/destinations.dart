import 'package:flutter/material.dart';

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Shop',
    icon: Icon(Icons.add),
    route: '/shop',
  ),
  NavigationDestination(
    label: 'Bag',
    icon: Icon(Icons.book),
    route: '/bag',
  ),
  NavigationDestination(
    label: 'Favorites',
    icon: Icon(Icons.person),
    route: '/favorites',
  ),
  NavigationDestination(
    label: 'Profile',
    icon: Icon(Icons.person),
    route: '/profile',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}
