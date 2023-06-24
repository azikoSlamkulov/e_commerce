// import 'package:e_commerce/lib.dart';

// class MobileHomeVerThreeView extends StatelessWidget {
//   const MobileHomeVerThreeView({
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
//     return NestedMobileHomeViewVerTwo(
//       allSaleProducts: allSaleProducts,
//       allNewProducts: allNewProducts,
//     );
//   }
// }

// class NestedMobileHomeViewVerTwo extends StatelessWidget {
//   const NestedMobileHomeViewVerTwo({
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
//         child: Column(
//           children: [
//             const SliderCarusel(),
//             // CustomElevatedButton(
//             //   sizedBoxHeight: 70.h,
//             //   sizedBoxWidth: ScreenUtil().screenWidth,
//             //   paddingHorizontal: 15,
//             //   paddingVertical: 10,
//             //   onPressed: () {
//             //     //   GoRouter.of(context).goNamed(
//             //     //     APP_PAGE.shopCategoriesFirst.toName,
//             //     //   );
//             //   },
//             //   text: Text(
//             //     'Category',
//             //     style: TextStyle(fontSize: 18.sp),
//             //   ),
//             // ),
//             33.verticalSpace,
//             Padding(
//               padding: REdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Sale',
//                         style: AppTextStyles.black34Bold,
//                       ),
//                       4.verticalSpace,
//                       Text(
//                         'Super summer sale',
//                         style: AppTextStyles.grey11,
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'View all',
//                       style: AppTextStyles.grey11,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             /// Sale product list
//             22.verticalSpace,
//             CustomListView(allProducts: allSaleProducts),

//             ///
//             33.verticalSpace,
//             Padding(
//               padding: REdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'New',
//                         style: AppTextStyles.black34Bold,
//                       ),
//                       4.verticalSpace,
//                       Text(
//                         'You’ve never seen it before!',
//                         style: AppTextStyles.grey11,
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'View all',
//                       style: AppTextStyles.grey11,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             /// New product list
//             22.verticalSpace,
//             CustomListView(allProducts: allNewProducts),
//             companyInfo(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// companyInfo() {
//   return Container(
//     margin: REdgeInsets.only(top: 60),
//     height: 120.h,
//     width: double.infinity,
//     decoration: const BoxDecoration(
//       color: Colors.blue,
//     ),
//     child: const Center(
//       child: Text(
//         'Company Info',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
