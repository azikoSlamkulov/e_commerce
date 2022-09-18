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
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.sizedBoxHeight = 60.0,
    this.sizedBoxWidth = 200.0,
    this.borderRadius = 30.0,
    this.bgColor = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal!,
        vertical: paddingVertical!,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(
          //     horizontal: paddingHorizontal!, vertical: paddingVertical!),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(borderRadius!),
          // ),
          //primary: bgColor,
          backgroundColor: bgColor,
        ),
        child: text,
        onPressed: onPressed,
      ),
    );
  }
}
