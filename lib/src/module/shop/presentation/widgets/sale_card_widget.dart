import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/app_constants/colors/app_colors.dart';

class SaleCardWidget extends StatelessWidget {
  SaleCardWidget(
      {super.key, required this.selectedTabIndex, required this.onTap});

  int selectedTabIndex;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 125.h,
        child: Card(
          color: AppColors.mainColor,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          margin: REdgeInsets.only(top: 16, left: 16, right: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SUMMER SALES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                10.verticalSpace,
                Text(
                  'Up to 50% off',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
