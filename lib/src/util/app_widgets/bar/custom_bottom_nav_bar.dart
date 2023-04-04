import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_constants/colors/app_colors.dart';
import '../buttons/custom_elevated_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
      height: 112.h,
      color: Colors.white,
      child: CustomElevatedButton(
        sizedBoxHeight: 48.h,
        sizedBoxWidth: MediaQuery.of(context).size.width,
        borderRadius: 30,
        bgColor: AppColors.mainColor,
        //isBorderSide: true,
        text: Text(
          'ADD TO CART',
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        onPressed: () {},
      ),
    );
  }
}
