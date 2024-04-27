import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SmallBannerWidget extends StatelessWidget {
  const SmallBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //color: Colors.red,
          height: 180.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgImage11.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          bottom: 32.h,
          child: Text(
            'Street clothes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34.sp,
              fontWeight: FontWeight.bold,
            ),
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
                AppPage.homeVerThree.toName,
              );
            },
          ),
        )
      ],
    );
  }
}
