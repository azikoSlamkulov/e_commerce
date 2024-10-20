import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({
    required this.userID,
    required this.products,
    super.key,
  });

  final String userID;
  final List<FavoriteEntity> products;

  @override
  Widget build(BuildContext context) {
    // return products.isNotEmpty
    //     ? Expanded(
    //         child: ListView.separated(
    //           padding: REdgeInsets.all(14),
    //           itemCount: products.length,
    //           //itemExtent: 155.h,
    //           itemBuilder: (context, index) {
    //             final product = products[index];
    //             return FavoritesHorizontalCard(
    //               userID: userID,
    //               product: product,
    //               onTap: () {},
    //             );
    //           },
    //           separatorBuilder: (context, index) => SizedBox(height: 12.h),
    //         ),
    //       )
    //     : Align(
    //         alignment: Alignment.center,
    //         child: Text(
    //           'Список пуст!',
    //           style: AppTextStyles.grey16,
    //         ),
    //       );
    return Expanded(
      child: ListView.separated(
        padding: REdgeInsets.all(14),
        itemCount: products.length,
        //itemExtent: 155.h,
        itemBuilder: (context, index) {
          final product = products[index];
          return FavoritesHorizontalCard(
            userID: userID,
            product: product,
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
      ),
    );
  }
}
