import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.sizedBoxHeight = 60.0,
    this.sizedBoxWidth = 200.0,
    this.borderRadius = 5.0,
    this.bgColor = AppColors.mainColor,
    this.textColor = AppColors.white,
    this.fontSize = 14.00,
    this.fontWeight = FontWeight.normal,
    this.isActivity = false,
    this.isPaddingOnly = false,
    this.paddingOnlyLeft = 0,
    this.paddingOnlyRight = 0,
    this.paddingOnlyTop = 0,
    this.paddingOnlyBottom = 0,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;
  final double? borderRadius;
  final Color? bgColor;
  final bool isActivity;
  final bool isPaddingOnly;
  final double paddingOnlyLeft;
  final double paddingOnlyRight;
  final double paddingOnlyTop;
  final double paddingOnlyBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        left: paddingOnlyLeft,
        right: paddingOnlyRight,
        top: paddingOnlyTop,
        bottom: paddingOnlyBottom,
      ),
      child: SizedBox(
        height: sizedBoxHeight,
        width: sizedBoxWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal!,
              vertical: paddingVertical!,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              side: isActivity
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF9B9B9B)),
            ),
            //primary: bgColor,
            backgroundColor: isActivity ? bgColor : Colors.white,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: isActivity ? textColor : Colors.black,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
