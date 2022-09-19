import 'package:e_commerce/src/module/home/domain/entities/product_entity.dart';
import 'package:e_commerce/src/module/home/presention/widgets/custom_container.dart';
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
    required this.isSale,
    //this.scrollDirection = Axis.vertical,
  });

  final List<ProductEntity> allProducts;
  final String title;
  final String subTitle;
  final bool isSale;
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
                      fontSize: 34.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
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
                  'View all',
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
              return CustomContainer(
                product: product,
                isSale: isSale,
              );
            },
          ),
        ),
      ],
    );
  }
}
