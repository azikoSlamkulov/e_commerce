import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CollectionsCardWidget extends StatelessWidget {
  const CollectionsCardWidget({
    required this.collectionName,
    required this.selectedTabIndex,
    super.key,
    this.image,
  });

  final String collectionName;
  final int selectedTabIndex;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return collectionName == 'Sale'
        ? Expanded(
            child: InkWell(
              onTap: () {
                List<CategoryEntity> allCategories = [];
                context.goNamed(
                  AppPage.catalog.name,
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
              child: Card(
                color: AppColors.mainColor,
                clipBehavior: Clip.hardEdge,
                //elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                //margin: REdgeInsets.only(top: 16),
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
        : Expanded(
            child: InkWell(
              onTap: () {
                if (collectionName == 'New') {
                  List<CategoryEntity> allCategories = [];
                  context.goNamed(
                    AppPage.catalog.name,
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
                    AppPage.categories.name,
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
              child: Card(
                color: Colors.white,
                clipBehavior: Clip.hardEdge,
                //elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                //margin: REdgeInsets.only(top: 16),
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
