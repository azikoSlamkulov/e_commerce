import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce/lib.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
      height: 112.h,
      color: Colors.white,
      child: CustomButton(
        onPressed: () {},
        text: 'ADD TO CART',
        textStyle: AppTextStyles.white14,
      ),
    );
  }
}
