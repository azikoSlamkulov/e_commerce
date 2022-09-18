import 'package:flutter/material.dart';

class TabletFavoritesViwe extends StatefulWidget {
  const TabletFavoritesViwe({Key? key}) : super(key: key);

  @override
  State<TabletFavoritesViwe> createState() => _TabletFavoritesViweState();
}

class _TabletFavoritesViweState extends State<TabletFavoritesViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tablet Favorites Viwe'),
      ),
    );
  }
}
