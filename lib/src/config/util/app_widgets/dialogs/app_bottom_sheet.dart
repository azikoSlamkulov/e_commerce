import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {
  static showBottomSheet({
    required BuildContext context,
    required String title,
    required Widget content,
    double contentPaddingLeft = 16,
    double contentPaddingRight = 16,
    double? contentPaddingBottom,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Wrap(
            children: [
              SizedBox(
                //height: 352.h,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: REdgeInsets.only(top: 36),
                        child: Text(
                          title,
                          style: AppTextStyles.black18Bold,
                        ),
                      ),
                    ),
                    35.verticalSpace,

                    /// content
                    Padding(
                      padding: REdgeInsets.only(
                        left: contentPaddingLeft,
                        right: contentPaddingRight,
                        bottom: contentPaddingBottom ??
                            MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: content,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//AppBottomSheet customBottomSheet = AppBottomSheet();
