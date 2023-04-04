import 'package:e_commerce/src/module/shop/domain/entities/product_entity.dart';
import 'package:e_commerce/src/util/app_widgets/custom_vertical_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes/router_utils.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.allProducts,
    required this.title,
    required this.subTitle,
    this.showSubTitle = true,
    this.smallBtn = 'View all',
    required this.isSale,
    this.titleFontSize = 34,
    //this.scrollDirection = Axis.vertical,
  });

  final List<ProductEntity> allProducts;
  final String title;
  final String subTitle;
  final bool showSubTitle;
  final String smallBtn;
  final bool isSale;
  final double titleFontSize;
  //final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: REdgeInsets.only(top: 10),
          padding: REdgeInsets.only(
            bottom: 18,
            top: 30,
            right: 20,
            left: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.verticalSpace,
                  showSubTitle
                      ? Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              TextButton(
                onPressed: isSale
                    ? () {
                        // GoRouter.of(context).goNamed(
                        //   APP_PAGE.allSaleProducts.toName,
                        // );
                      }
                    : () {
                        // GoRouter.of(context).goNamed(
                        //   APP_PAGE.allNewProducts.toName,
                        // );
                      },
                child: Text(
                  smallBtn,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              final product = allProducts[index];
              return CustomVerticalContainer(
                product: product,
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppPage.shopProductCard.toName,
                  );
                },
                //isSale: isSale,
                sizedHeight: 220.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
