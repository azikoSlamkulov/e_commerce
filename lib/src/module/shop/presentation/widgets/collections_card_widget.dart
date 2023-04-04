import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/app_constants/text_styles/app_text_styles.dart';

class CollectionsCardWidget extends StatelessWidget {
  CollectionsCardWidget({
    super.key,
    required this.collectionName,
    required this.selectedTabIndex,
    this.image,
  });

  String collectionName;
  int selectedTabIndex;
  Image? image;

  @override
  Widget build(BuildContext context) {
    return collectionName == 'Sale'
        ? InkWell(
            onTap: () {
              List<CategoryEntity> allCategories = [];
              context.goNamed(
                "shopCatalog",
                queryParams: {
                  'type': selectedTabIndex == 0
                      ? 'Women'
                      : selectedTabIndex == 1
                          ? 'Men'
                          : 'Kids',
                  'collection': 'null',
                  'category': collectionName,
                },
                extra: allCategories,
              );
            },
            child: SizedBox(
              height: 125.h,
              child: Card(
                color: AppColors.mainColor,
                clipBehavior: Clip.hardEdge,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                margin: REdgeInsets.only(top: 16, left: 16, right: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SUMMER SALES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      10.verticalSpace,
                      Text(
                        'Up to 50% off',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              if (collectionName == 'New') {
                List<CategoryEntity> allCategories = [];
                context.goNamed(
                  "shopCatalog",
                  queryParams: {
                    'type': selectedTabIndex == 0
                        ? 'Women'
                        : selectedTabIndex == 1
                            ? 'Men'
                            : 'Kids',
                    'collection': 'null',
                    'category': collectionName,
                  },
                  extra: allCategories,
                );
              } else {
                context.goNamed(
                  "shopCategoriesSecond",
                  params: {
                    'type': selectedTabIndex == 0
                        ? 'Women'
                        : selectedTabIndex == 1
                            ? 'Men'
                            : 'Kids',
                    'collection': collectionName
                  },
                );
              }
            },
            child: SizedBox(
              height: 125.h,
              child: Card(
                clipBehavior: Clip.hardEdge,
                //elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                margin: REdgeInsets.only(top: 16, left: 16, right: 16),
                //color: Colors.redAccent.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: REdgeInsets.all(30.0),
                      child: Text(
                        collectionName,
                        style: AppTextStyles.black18Bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    image!,
                  ],
                ),
              ),
            ),
          );
  }
}
