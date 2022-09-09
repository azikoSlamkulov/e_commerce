import 'package:flutter/material.dart';

import '../../app_constants/colors/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? horizontal;
  final double? vertical;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.horizontal = 40.0,
    this.vertical = 10.0,
    this.bgColor = AppColors.mainColor,
    this.borderColor = AppColors.blue,
    this.textColor = AppColors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0.5, color: borderColor!),
        // padding:
        //     EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
        // // shape: RoundedRectangleBorder(
        // //   borderRadius: BorderRadius.circular(10),
        // // ),
        // primary: bgColor,
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: onPressed,
    );
  }
}
