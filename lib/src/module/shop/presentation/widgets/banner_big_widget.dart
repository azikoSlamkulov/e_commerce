import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BigBannerWdget extends StatelessWidget {
  const BigBannerWdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 550.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image_1.jpg'),
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
                'Fashion',
                style: AppTextStyles.white48Bold,
              ),
              Text(
                'sale',
                style: AppTextStyles.white48Bold,
              ),
              18.verticalSpace,
              CustomButton(
                sizedBoxHeight: 36.h,
                sizedBoxWidth: 160.h,
                onPressed: () {
                  List<CategoryEntity> allCategories = [];
                  context.goNamed(
                    AppPage.catalog.name,
                    queryParams: {
                      'type': 'null',
                      'collection': 'null',
                      'category': 'Sale',
                    },
                    extra: allCategories,
                  );
                },
                text: 'Check',
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
              context.goNamed(
                AppPage.homeVerTwo.toName,
              );
            },
          ),
        ),
      ],
    );
  }
}
