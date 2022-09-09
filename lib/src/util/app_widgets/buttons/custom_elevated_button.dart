import 'package:flutter/material.dart';

import '../../app_constants/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? bgColor;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;
  final double? borderRadius;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.paddingHorizontal = 40.0,
    this.paddingVertical = 10.0,
    this.sizedBoxHeight = 55.0,
    this.sizedBoxWidth = 200.0,
    this.borderRadius = 30.0,
    this.bgColor = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(
          //     horizontal: paddingHorizontal!, vertical: paddingVertical!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          primary: bgColor,
        ),
        child: text,
        onPressed: onPressed,
      ),
    );
  }
}
