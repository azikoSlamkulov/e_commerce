// import 'package:e_commerce/lib.dart';

// class MobileHomeVerTwoView extends StatelessWidget {
//   const MobileHomeVerTwoView({
//     Key? key,
//     //required this.product,
//   }) : super(key: key);

//   //final ProductEntity product;

//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //   create: (context) => sl<ProductBloc>()
//     //     ..add(const GetAllSortedProductsByQueryEvent('isNew', true)),

//     //   child: BlocBuilder<ProductBloc, ProductState>(
//     //     builder: (context, state) {
//     //       if (state is LoadingState) {
//     //         //return const LoadingWidget();
//     //         return const Center(child: CircularProgressIndicator());
//     //       } else if (state is LoadedAllSortedProductsByQueryState) {
//     //         return HomeView2(
//     //           allProducts: state.allSortedProducts,
//     //         );
//     //       } else if (state is ProductFailureState) {
//     //         //return MyErrorWidget('${state.exception}');
//     //         return Text('');
//     //       } else {
//     //         //return const SomeError();,
//     //         return Text('');
//     //       }
//     //     },
//     //   ),
//     // );
//     final allSaleProducts = FakeProductData()
//         .allFakeProducts
//         .where((i) => i.isSale == true)
//         .toList();
//     final allNewProducts = FakeProductData()
//         .allFakeProducts
//         .where((i) => i.isNew == true)
//         .toList();
//     return NestedMobileSaleView(
//       allSaleProducts: allSaleProducts,
//       allNewProducts: allNewProducts,
//     );
//   }
// }

// class NestedMobileSaleView extends StatelessWidget {
//   const NestedMobileSaleView({
//     super.key,
//     required this.allSaleProducts,
//     required this.allNewProducts,
//   });

//   final List<ProductsListEntity> allSaleProducts;
//   final List<ProductsListEntity> allNewProducts;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: REdgeInsets.only(bottom: 25),
//           child: Column(
//             children: [
//               /// Main image
//               Stack(
//                 children: [
//                   Container(
//                     //color: Colors.red,
//                     height: 180.h,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/bgImage11.jpg'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 10.w,
//                     bottom: 32.h,
//                     child: Text(
//                       'Street clothes',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 34.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 10.w,
//                     top: 32.h,
//                     child: TextButton(
//                       child: const Text(
//                         'Ver.2',
//                         style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                       onPressed: () {
//                         GoRouter.of(context).goNamed(
//                           AppPage.homeVerThree.toName,
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),

//               ///
//               33.verticalSpace,
//               Padding(
//                 padding: REdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Sale',
//                           style: AppTextStyles.black34Bold,
//                         ),
//                         4.verticalSpace,
//                         Text(
//                           'Super summer sale',
//                           style: AppTextStyles.grey11,
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'View all',
//                         style: AppTextStyles.grey11,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// Sale product list
//               22.verticalSpace,
//               CustomListView(allProducts: allSaleProducts),

//               ///
//               33.verticalSpace,
//               Padding(
//                 padding: REdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'New',
//                           style: AppTextStyles.black34Bold,
//                         ),
//                         4.verticalSpace,
//                         Text(
//                           'You’ve never seen it before!',
//                           style: AppTextStyles.grey11,
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'View all',
//                         style: AppTextStyles.grey11,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// New product list
//               22.verticalSpace,
//               CustomListView(allProducts: allNewProducts),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
