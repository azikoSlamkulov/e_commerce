import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../app/routes/router_utils.dart';

class HomeMainImageWidget extends StatelessWidget {
  const HomeMainImageWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    required this.imageUrl,
  });

  final String title;
  final String subTitle;
  final Function() onPressed;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //color: Colors.red,
          height: 550.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          bottom: 32.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              18.verticalSpace,
              CustomElevatedButton(
                sizedBoxHeight: 36.h,
                sizedBoxWidth: 160.h,
                borderRadius: 30,
                text: Text(
                  'Check',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        Positioned(
          right: 10.w,
          top: 32.h,
          child: TextButton(
            child: const Text(
              'Ver.2',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).goNamed(
                APP_PAGE.homeVerTwo.toName,
              );
            },
          ),
        ),
      ],
    );
  }
}
