import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/app_constants/text_styles/app_text_styles.dart';

class TitlesWidget extends StatelessWidget {
  final String title;

  const TitlesWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 42.h,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyles.black16Bold,
            // style: TextStyle(
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
      ),
    );
  }
}
