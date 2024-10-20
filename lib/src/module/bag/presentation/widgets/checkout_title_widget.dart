import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CheckoutTitleWidget extends StatelessWidget {
  const CheckoutTitleWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.black16Bold,
    );
  }
}
