import 'package:flutter/material.dart';

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({
    super.key,
    required this.color,
    required this.tabBar,
    required this.height,
  });

  @override
  Size get preferredSize => tabBar.preferredSize;

  final TabBar tabBar;
  final double height;
  @override
  // ignore: overridden_fields
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        width: double.infinity,
        child: tabBar,
      );
}
