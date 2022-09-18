import 'package:flutter/material.dart';

class MobileFavoritesViwe extends StatefulWidget {
  const MobileFavoritesViwe({Key? key}) : super(key: key);

  @override
  State<MobileFavoritesViwe> createState() => _MobileFavoritesViweState();
}

class _MobileFavoritesViweState extends State<MobileFavoritesViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Mobile Favorites View'),
      ),
    );
  }
}
