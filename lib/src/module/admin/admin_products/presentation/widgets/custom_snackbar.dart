//import 'package:flash/flash.dart';
import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackbar {
  // showSnackBar({
  //   required BuildContext context,
  //   required String message,
  //   bool isError = false,
  // }) {
  //   if (isError) {
  //     showTopSnackBar(
  //       context,
  //       CustomSnackBar.error(
  //         message: message,
  //       ),
  //       animationDuration: const Duration(seconds: 3),
  //       reverseAnimationDuration: const Duration(seconds: 1),
  //     );
  //   } else {
  //     showTopSnackBar(
  //       context,
  //       CustomSnackBar.success(
  //         message: message,
  //       ),
  //       animationDuration: const Duration(seconds: 3),
  //       reverseAnimationDuration: const Duration(seconds: 1),
  //     );
  //   }
  // }

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
      duration: const Duration(seconds: 4),
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

  getSnackbar1({
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
      backgroundColor: isError ? AppColors.mainColor : Colors.black,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
      //padding: const EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 135,
        top: 500.h,
      ),
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

  // showTopFlash(
  //     {required BuildContext context,
  //     FlashBehavior style = FlashBehavior.floating}) {
  //   showFlash(
  //     context: context,
  //     duration: const Duration(seconds: 2),
  //     persistent: false,
  //     builder: (_, controller) {
  //       return Flash(
  //         controller: controller,
  //         backgroundColor: Colors.white,
  //         brightness: Brightness.light,
  //         boxShadows: [BoxShadow(blurRadius: 4)],
  //         barrierBlur: 3.0,
  //         barrierColor: Colors.black38,
  //         barrierDismissible: true,
  //         behavior: style,
  //         position: FlashPosition.top,
  //         child: FlashBar(
  //           title: Text('Title'),
  //           content: Text('Hello world!'),
  //           showProgressIndicator: true,
  //           primaryAction: TextButton(
  //             onPressed: () => controller.dismiss(),
  //             child: Text('DISMISS', style: TextStyle(color: Colors.amber)),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
