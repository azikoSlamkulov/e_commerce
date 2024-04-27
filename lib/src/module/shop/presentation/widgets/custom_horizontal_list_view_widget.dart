import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomHorizontalListViewWidget extends StatelessWidget {
  const CustomHorizontalListViewWidget({
    super.key,
    required this.products,
    required this.title,
    required this.subtitle,
  });

  final List<ProductEntity> products;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 13),
      child: subtitle.isNotEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.black34Bold,
                        ),
                        4.verticalSpace,
                        Text(
                          subtitle,
                          style: AppTextStyles.grey11,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        List<CategoryEntity> allCategories = [];
                        context.goNamed(
                          AppPage.catalog.name,
                          queryParams: {
                            'type': 'null',
                            'collection': 'null',
                            'category': 'New',
                          },
                          extra: allCategories,
                        );
                      },
                      child: Text(
                        'View all',
                        style: AppTextStyles.grey11,
                      ),
                    ),
                  ],
                ),
                22.verticalSpace,
                buildHorizontalListView(),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'You can also like this',
                      style: AppTextStyles.black18Bold,
                    ),
                    Text(
                      //'12 items',
                      '${products.length} items',
                      style: AppTextStyles.grey11,
                    ),
                  ],
                ),
                20.verticalSpace,
                buildHorizontalListView(),
              ],
            ),
    );
  }

  buildHorizontalListView() {
    return SizedBox(
      height: 300.h,
      child: products.isNotEmpty
          ? ListView.separated(
              //padding: REdgeInsets.symmetric(horizontal: 13),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                //final isNew = DateTimeFormatter().isNew(product.createdDate!);
                return SizedBox(
                  width: 155.h,
                  child: ProductVerticalCard(product: product),
                );
                //return ProductVerticalCard(product: product);
              },
              separatorBuilder: (context, index) => SizedBox(width: 13.h),
            )
          : Align(
              alignment: Alignment.center,
              child: Text(
                'Список пуст!',
                style: AppTextStyles.grey16,
              ),
            ),
    );
  }
}
