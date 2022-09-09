import 'package:flutter/material.dart';

class FavoritesViwe extends StatefulWidget {
  const FavoritesViwe({Key? key}) : super(key: key);

  @override
  State<FavoritesViwe> createState() => _FavoritesViweState();
}

class _FavoritesViweState extends State<FavoritesViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorites Viwe'),
      ),
    );
  }
}
