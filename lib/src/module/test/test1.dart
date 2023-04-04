// import 'package:e_commerce/src/module/home/presention/logic/product_bloc.dart';
// import 'package:e_commerce/src/module/home/presention/logic/product_event.dart';
// import 'package:e_commerce/src/module/home/presention/logic/product_state.dart';
// import 'package:e_commerce/src/util/app_widgets/custom_vertical_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../locator.dart';
// import '../../util/app_constants/colors/app_colors.dart';
// import '../../util/app_widgets/buttons/custom_elevated_button.dart';
// import '../home/domain/entities/product_entity.dart';

// class Test1 extends StatelessWidget {
//   const Test1({
//     Key? key,
//     //required this.product,
//   }) : super(key: key);

//   //final ProductEntity product;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<ProductBloc>(),
//       // child: BlocBuilder<ProductBloc, ProductState>(
//       //   builder: (context, state) {
//       //     if (state is LoadingState) {
//       //       //return const LoadingWidget();
//       //       return const Center(child: CircularProgressIndicator());
//       //     } else if (state is LoadedAllSortedProductsByQueryState) {
//       //       return NestedTest1(
//       //         allNewProducts: state.allSortedProducts,
//       //       );
//       //     } else if (state is ProductFailureState) {
//       //       //return MyErrorWidget('${state.exception}');
//       //       return Text('');
//       //     } else {
//       //       //return const SomeError();,
//       //       return Text('');
//       //     }
//       //   },
//       // ),
//       child: NestedTest1(),
//     );
//     // final allFakeNewProducts = FakeProductData().allFakeNewProducts;
//     // return NestedMobileHomeView(allNewProducts: allFakeNewProducts);
//   }
// }

// class NestedTest1 extends StatelessWidget {
//   const NestedTest1({
//     super.key,
//     //required this.allNewProducts,
//   });

//   //final List<ProductEntity> allNewProducts;

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController();
//     final List<ProductEntity> allNewProducts = [];
//     return Scaffold(
//       //backgroundColor: AppColors.bgColorBlue,
//       appBar: AppBar(actions: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CustomElevatedButton(
//             sizedBoxHeight: 36.h,
//             sizedBoxWidth: 160.w,
//             borderRadius: 30,
//             text: Text(
//               'Ok',
//               style: TextStyle(fontSize: 14.sp),
//             ),
//             onPressed: () {
//               BlocProvider.of<ProductBloc>(context)
//                 ..add(
//                   const GetAllSortedProductsByQueryEvent('isNew', true),
//                 );
//             },
//           ),
//         ),
//       ]),
//       body: Padding(
//         padding: REdgeInsets.all(15.0),
//         child: Center(
//           child: SizedBox(
//             height: 300.h,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: allNewProducts.length,
//               itemBuilder: (context, index) {
//                 final product = allNewProducts[index];
//                 return CustomVerticalContainer(
//                   product: product,
//                   onTap: () {
//                     // GoRouter.of(context).goNamed(
//                     //   APP_PAGE.shopProductCard.toName,
//                     // );
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>
//                     //         MobileProductCard(product: product),
//                     //   ),
//                     // );
//                   },
//                   isSale: false,
//                   sizedHeight: 220.h,
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
