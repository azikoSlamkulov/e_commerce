import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessViewFirst extends StatelessWidget {
  const SuccessViewFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.successIcon(
                height: 213,
                width: 208,
              ),
              49.verticalSpace,
              Text('Success!', style: AppTextStyles.black34Bold),
              12.verticalSpace,
              Text('Your order will be delivered soon.',
                  style: AppTextStyles.black14),
              5.verticalSpace,
              Text('Thank you for choosing our app!',
                  style: AppTextStyles.black14),
              163.verticalSpace,
              CustomButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileHomeView(),
                  ),
                ),
                text: 'CONTINUE SHOPPING',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
