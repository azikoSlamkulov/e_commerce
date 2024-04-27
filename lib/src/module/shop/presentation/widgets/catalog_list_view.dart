// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CatalogListView extends StatelessWidget {
//   const CatalogListView({
//     required this.products,
//     super.key,
//   });

//   final List<ProductEntity> products;

//   @override
//   Widget build(BuildContext context) {
//     return products.isNotEmpty
//         ? Expanded(
//             child: ListView.separated(
//               padding: REdgeInsets.all(14),
//               itemCount: products.length,
//               //itemExtent: 155.h,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ProductHorizontalCard(product: product);
//               },
//               separatorBuilder: (context, index) => SizedBox(height: 12.h),
//             ),
//           )
//         : Align(
//             alignment: Alignment.center,
//             child: Text(
//               'Список пуст!',
//               style: AppTextStyles.grey16,
//             ),
//           );
//   }
// }
