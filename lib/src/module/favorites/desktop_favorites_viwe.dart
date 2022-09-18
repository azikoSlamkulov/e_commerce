import 'package:flutter/material.dart';

class DesktopFavoritesViwe extends StatefulWidget {
  const DesktopFavoritesViwe({Key? key}) : super(key: key);

  @override
  State<DesktopFavoritesViwe> createState() => _DesktopFavoritesViweState();
}

class _DesktopFavoritesViweState extends State<DesktopFavoritesViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Desktop Favorites Viwe'),
      ),
    );
  }
}
