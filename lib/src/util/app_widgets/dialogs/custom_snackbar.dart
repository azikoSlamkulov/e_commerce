// import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
// import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/lib.dart';

class CustomSnackbar {
  getSnackbar({
    required BuildContext context,
    required String title,
    bool isError = false,
    String? contentText,
    Color? borderColor,
    Color? colorText,
    Color? backgroundColor,
    Widget? messageText,
  }) {
    final snackBar = SnackBar(
      content: isError
          ? Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 32.h,
                  color: Colors.white,
                ),
                16.horizontalSpace,
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.white20,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: AppTextStyles.white20,
            ),
      backgroundColor: isError ? AppColors.mainColor : Colors.blue,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
      //padding: const EdgeInsets.symmetric(vertical: 5),
      // margin: EdgeInsets.only(
      //   //bottom: MediaQuery.of(context).size.height - 135,
      //   top: 500.h,
      // ),
      // content: Padding(
      //   padding: const EdgeInsets.only(top: 50),
      //   child: Center(
      //     child: Text(title),
      //   ),
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Get.snackbar(
    //   title!,
    //   contentText!,
    //   duration: Duration(seconds: 3),
    //   borderColor: borderColor ?? Colors.grey,
    //   borderWidth: 3,
    //   colorText: colorText ?? Colors.black,
    //   backgroundColor: backgroundColor ?? AppColors.textFormFieldBgColor,
    //   messageText: messageText,
    // );
  }
}
