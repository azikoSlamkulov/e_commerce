import 'package:flutter/material.dart';

class CustomSnackbar {
  getSnackbar({
    required BuildContext context,
    required String title,
    String? contentText,
    Color? borderColor,
    Color? colorText,
    Color? backgroundColor,
    Widget? messageText,
  }) {
    final snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 5),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 135,
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Text(title),
        ),
      ),
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
