import 'package:flutter/material.dart';

class ShopViwe extends StatefulWidget {
  const ShopViwe({Key? key}) : super(key: key);

  @override
  State<ShopViwe> createState() => _ShopViweState();
}

class _ShopViweState extends State<ShopViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shop Viwe'),
      ),
    );
  }
}
