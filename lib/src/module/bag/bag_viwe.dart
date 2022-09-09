import 'package:flutter/material.dart';

class BagViwe extends StatefulWidget {
  const BagViwe({Key? key}) : super(key: key);

  @override
  State<BagViwe> createState() => _BagViweState();
}

class _BagViweState extends State<BagViwe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bag Viwe'),
      ),
    );
  }
}
