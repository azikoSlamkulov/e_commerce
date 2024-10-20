import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccessViewSecond extends StatelessWidget {
  const SuccessViewSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppAssets.successBgImage(),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: REdgeInsets.all(18.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                119.verticalSpace,
                Text('Success!', style: AppTextStyles.black34Bold),
                12.verticalSpace,
                Text('Your order will be delivered soon.',
                    style: AppTextStyles.black14),
                5.verticalSpace,
                Text('Thank you for choosing our app!',
                    style: AppTextStyles.black14),
                24.verticalSpace,
                CustomButton(
                  sizedBoxHeight: 36.h,
                  sizedBoxWidth: 160.h,
                  onPressed: () {
                    GoRouter.of(context).go(
                      AppPage.home.toPath,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MobileHomeView(),
                    //   ),
                    // );
                  },
                  text: 'Continue shopping',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
