import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../admin_products.dart';

//allow read, write: if request.auth != null;

// class AdminProductsView extends StatelessWidget {
//   const AdminProductsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
//     return const Scaffold(
//       body: Center(
//         child: Text('Product'),
//       ),
//     );
//   }
// }

class AdminProductsView extends StatelessWidget {
  const AdminProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is CreatedProductState) {
          BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
          AppSnackbar.showSnackbar(
            context: context,
            title: 'Продукт добавлен',
          );
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllProductState) {
            return NestedAdminProductsView(
              allProducts: state.allProducts,
            );
          } else if (state is ProductFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedAdminProductsView extends StatelessWidget {
  NestedAdminProductsView({super.key, required this.allProducts});

  final List<ProductEntity> allProducts;

  final String collectionChoice = '';
  final String typeChoice = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      // appBar: CustomAppBar(
      //   title: 'Products View',
      //   showBackBtn: false,
      //   showSearchBtn: true,
      //   onPressed: () {
      //     return BlocProvider.of<ProductBloc>(context).add(
      //       GetAllProductEvent(),
      //     );
      //   },
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 27.h,
              color: Colors.black,
            ),
            onPressed: () {},
            // onPressed: () {
            //   showSearch(
            //     context: context,
            //     delegate: MySearchDelegate(),
            //   );
            // },
          ),
          //const PopUpMenuBtn(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///SearchBar
          // Padding(
          //   padding: REdgeInsets.only(left: 16, right: 16, top: 22),
          //   child: CustomSearchBar(),
          // ),

          // Padding(
          //   padding: REdgeInsets.only(left: 16, right: 16, top: 22),
          //   child: CustomElevatedButton(
          //     sizedBoxHeight: 50.h,
          //     sizedBoxWidth: MediaQuery.of(context).size.width,
          //     borderRadius: 30,
          //     bgColor: AppColors.mainColor,
          //     //isBorderSide: true,
          //     text: Text(
          //       'ADD NEW PRODUCT',
          //       style: AppTextStyles.white14,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => MobileAddProductView(),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          //10.verticalSpace,
          // Padding(
          //   padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
          //   child: Text(
          //     'All products',
          //     style: AppTextStyles.grey14,
          //   ),
          // ),

          /// Products ListView
          allProducts.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    padding: REdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 17.h,
                      //mainAxisSpacing: 17.h,
                      mainAxisExtent: 315.h,
                      crossAxisCount: 2,
                      //childAspectRatio: 90.h / 140.h,
                    ),
                    itemCount: allProducts.length,
                    itemBuilder: (context, index) {
                      final product = allProducts[index];
                      return ProductVerticalCard(product: product);
                    },
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Список пуст!',
                    style: AppTextStyles.grey16,
                  ),
                ),
        ],
      ),

      ///
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductViewTwo(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }

//   showCustomDialog(
//     BuildContext context,
//     TextEditingController controller,
//     String text,
//     Widget content,
//     //String labelText,
//     VoidCallback onPressed,
//   ) {
//     return showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text(text),
//         content: content,
//         actions: [
//           ElevatedButton(
//             onPressed: onPressed,
//             child: const Text("Ok"),
//           ),
//         ],
//       ),
//     );
//   }

//   buildBrandContent(BuildContext context) {
//     return CustomTextFormField(
//       controller: controller,
//       sizedBoxHeight: 40.h,
//       sizedBoxWidth: MediaQuery.of(context).size.width,
//       labelText: 'Enter brand name',
//     );
//   }

//   buildCategoryContent(BuildContext context) {
//     return CustomTextFormField(
//       controller: controller,
//       sizedBoxHeight: 40.h,
//       sizedBoxWidth: MediaQuery.of(context).size.width,
//       labelText: 'Enter brand name',
//     );
//   }

//   buildListTile(
//     BuildContext context,
//     String text,
//     VoidCallback onTap,
//   ) {
//     return Expanded(
//       child: Card(
//         child: ListTile(
//           onTap: onTap,
//           title: Text(
//             text,
//             style: AppTextStyles.black16,
//           ),
//           trailing: const Icon(Icons.chevron_right),
//         ),
//       ),
//     );
//   }
// }

// categoryList() {
//   return Expanded(
//     child: Card(
//       child: ExpansionTile(
//         title: Text('Categories'),
//         children: [
//           ExpansionTile(
//             title: Text('Women'),
//             children: [
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//             ],
//           ),
//           ExpansionTile(
//             title: Text('Men'),
//             children: [
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//             ],
//           ),
//           ExpansionTile(
//             title: Text('Kids'),
//             children: [
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//               ListTile(
//                 title: Text(''),
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
}

// showCategoryDialog(
//   BuildContext context,
//   TextEditingController controller,
//   String text,
//   String labelText,
//   VoidCallback onPressed,
//   List<String> typeItems,
//   List<String> collectionItems,
// ) {
//   return showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       title: Text(text),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Type',
//                 style: AppTextStyles.black18,
//               ),
//               DropdownMenu(
//                 items: typeItems,
//                 selectedItem: typeItems[0],
//                 validator: (itemIndex) {
//                   if (itemIndex == typeItems[0]) {
//                     return 'dddd';
//                     //showBottomSheet(context, isSelected);
//                     //log('color');
//                   }
//                 },
//               ),
//             ],
//           ),
//           10.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Collection',
//                 style: AppTextStyles.black18,
//               ),
//               DropdownMenu(
//                 items: collectionItems,
//                 selectedItem: collectionItems[0],
//                 validator: (itemIndex) {
//                   if (itemIndex == collectionItems[0]) {
//                     return 'dddd';
//                     //showBottomSheet(context, isSelected);
//                     //log('color');
//                   }
//                 },
//               ),
//             ],
//           ),
//           20.verticalSpace,
//           CustomTextFormField(
//             controller: controller,
//             sizedBoxHeight: 40.h,
//             sizedBoxWidth: MediaQuery.of(context).size.width,
//             labelText: 'Enter category name',
//           ),
//         ],
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: onPressed,
//           child: const Text("Ok"),
//         ),
//       ],
//     ),
//   );
// }

// buildExpansionTile(
//   String mainTitle,
//   String firstTitle,
//   String secondTitle,
//   VoidCallback firstOnTap,
//   VoidCallback secondOnTap,
// ) {
//   return Card(
//     child: ExpansionTile(
//       title: Text(mainTitle),
//       children: [
//         ListTile(
//           title: Text(firstTitle),
//           onTap: firstOnTap,
//         ),
//         ListTile(
//           title: Text(secondTitle),
//           onTap: secondOnTap,
//         ),
//       ],
//     ),
//   );
// }


//  buildExpansionTile(
//                     'Type',
//                     'Add types',
//                     'List of types',
//                     () {
//                       showCustomDialog(
//                         context,
//                         controller,
//                         'Add type',
//                         () {
//                           BlocProvider.of<CategoriesBloc>(context).add(
//                             AddTypeEvent(
//                               controller.text,
//                             ),
//                           );
//                           controller.clear();
//                           Navigator.of(context).pop();
//                         },
//                       );
//                     },
//                     () {},
//                   ),