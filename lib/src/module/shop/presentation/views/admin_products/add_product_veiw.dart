// //import 'dart:io';

// import 'dart:developer';

// import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
// import 'package:e_commerce_admin/src/module/product/domain/entities/product_entity.dart';
// import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/logic/product_bloc/product_bloc.dart';
// // import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_brands_list_view.dart';
// // import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_categories_list_view.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/widgets/custom_toggle_button.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/widgets/filters_colors_toggle_btn.dart';
// import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
// import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/inputs/custom_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../config/locator.dart';

// // import '../../../../../util/app_widgets/inputs/custom_text_form_field_tow.dart';
// // import '../../logic/brand_cubit/brand_cubit.dart';
// // import '../../logic/categories_bloc/categories_bloc.dart';
// import '../../../domain/entities/product_color_entity.dart';
// import '../../../domain/entities/product_size_entity.dart';
// import '../../logic/category_toggle_btn_cubit/category_toggle_btn_cubit.dart';
// import '../../logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
// import '../../logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
// import '../../widgets/build_brand_widget.dart';
// import '../../widgets/build_category_widget.dart';
// import '../../widgets/colors_widget.dart';
// import '../../widgets/build_image_widget.dart';
// import '../../widgets/build_sale_widget.dart';
// import '../../widgets/sizes_widget.dart';
// import '../../widgets/titles_widget.dart';
// // import '../../widgets/modal_bottom_sheet.dart';
// // import '../../../../../util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// // import 'home_view.dart';

// class MobileAddProductView extends StatelessWidget {
//   const MobileAddProductView({
//     Key? key,
//     //required this.productIndex,
//   }) : super(key: key);

//   //int productIndex;

//   @override
//   Widget build(BuildContext context) {
//     //String brand = '';
//     // final brands = BrandData().brands;
//     // return NestedMobileBrandView(brands: brands);
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ColorsToggleBtnCubit>(
//           create: (context) => sl<ColorsToggleBtnCubit>(),
//         ),
//         BlocProvider<CategoryToggleBtnCubit>(
//           create: (context) => sl<CategoryToggleBtnCubit>(),
//         ),
//         BlocProvider<SizesToggleBtnCubit>(
//           create: (context) => sl<SizesToggleBtnCubit>(),
//         ),
//         // BlocProvider<ProductBloc>(
//         //   create: (context) => sl<ProductBloc>()..add(GetAllProductEvent()),
//         // ),
//         // BlocProvider<ProductCubit>(create: (context) => sl<ProductCubit>()),
//         //BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
//         // BlocProvider<SingleToggleBtnCubit>(
//         //     create: (context) => sl<SingleToggleBtnCubit>()),
//         // BlocProvider<TypeToggleBtnCubit>(
//         //     create: (context) => sl<TypeToggleBtnCubit>()),

//         // BlocProvider<MultipleToogleBtnCubit>(
//         //     create: (context) => sl<MultipleToogleBtnCubit>()),

//         //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
//         // BlocProvider<ShopBloc>(create: (context) => sl<ShopBloc>()),
//       ],
//       // child: BlocListener<ProductBloc, ProductState>(
//       //   listener: (context, state) {
//       //     if (state is CreatedProductState) {
//       //       // CustomSnackbar().getSnackbar(
//       //       //   context: context,
//       //       //   title: state.isCreated ? 'Created' : 'Error',
//       //       //   isError: state.isCreated ? false : true,
//       //       // );
//       //       //Navigator.pop(context);
//       //     }
//       //   },
//       //   child: BlocBuilder<ProductBloc, ProductState>(
//       //     builder: (context, state) {
//       //       if (state is LoadingProductState) {
//       //         return const Center(child: CircularProgressIndicator());
//       //       } else if (state is LoadedAllProductState) {
//       //         return NestedAddProductView(
//       //           productIndex: state.allProducts.length,
//       //         );
//       //       } else if (state is ProductFailureState) {
//       //         //return MyErrorWidget('${state.exception}');
//       //         return Text('');
//       //       } else {
//       //         //return const SomeError();,
//       //         return Text('');
//       //       }
//       //     },
//       //   ),
//       // ),
//       child: const NestedAddProductView(),
//     );
//   }
// }

// final TextEditingController priseCtrl = TextEditingController();
// final TextEditingController countCtrl = TextEditingController();
// final TextEditingController descriptionCtrl = TextEditingController();
// final TextEditingController imageCtrl = TextEditingController();
// final TextEditingController smallImageCtrl = TextEditingController();

// class NestedAddProductView extends StatelessWidget {
//   const NestedAddProductView({
//     super.key,
//   });

//   static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     String selectedColor = '';
//     String selectedSize = '';
//     String imageUrl = '';
//     // String collectionChoice = '';
//     // String typeChoice = '';
//     String typedBrand = '';
//     CategoryEntity typedCategory = CategoryEntity();
//     //List<String> imageList = [''];

//     return Scaffold(
//       backgroundColor: AppColors.bgColorMain,
//       appBar: CustomAppBar(
//         title: 'Add product',
//         showSearchBtn: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               /// Prise and count
//               Form(
//                 key: _formKey,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const TitlesWidget(title: 'Prise'),
//                           Padding(
//                             padding: REdgeInsets.only(left: 16),
//                             // child: CustomTextFormFieldTow(
//                             //   controller: priseController,
//                             //   labelText: 'Enter prise',
//                             // ),
//                             child: CustomTextFormField(
//                               controller: priseCtrl,
//                               keyboardType: TextInputType.number,
//                               sizedBoxHeight: 40.h,
//                               //sizedBoxWidth: MediaQuery.of(context).size.width,
//                               labelText: 'Enter prise',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const TitlesWidget(title: 'Quantity'),
//                           Padding(
//                             padding: REdgeInsets.symmetric(horizontal: 16),
//                             child: CustomTextFormField(
//                               controller: countCtrl,
//                               keyboardType: TextInputType.number,
//                               sizedBoxHeight: 40.h,
//                               //sizedBoxWidth: MediaQuery.of(context).size.width,
//                               labelText: 'Enter quantity',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// Colors
//               const TitlesWidget(title: 'Colors'),
//               BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
//                 builder: (context, state) {
//                   if (state is ColorsInitialState) {
//                     return ColorsWidget(isSelected: state.isSelected);
//                   } else if (state is ColorsSelectedState) {
//                     selectedColor = state.color;
//                     return ColorsWidget(isSelected: state.isSelected);
//                   }

//                   return const Center(child: Text('Error'));
//                 },
//               ),

//               /// Sizes
//               const TitlesWidget(title: 'Sizes'),
//               BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
//                 builder: (context, state) {
//                   if (state is SizesInitialState) {
//                     return SizesWidget(isSelected: state.isSelected);
//                   } else if (state is SizesSelectedState) {
//                     selectedSize = state.selectedSize;
//                     return SizesWidget(isSelected: state.isSelected);
//                   }

//                   return const Center(child: Text('Error'));
//                 },
//               ),

//               /// Image
//               const TitlesWidget(title: 'Image'),
//               //image(imageList, imageController, smallImageController),
//               BuildImageWidget(
//                 callback: (value) {
//                   imageUrl = value;
//                 },
//               ),

//               /// Category
//               BuildCategoryWidget(
//                 callbackSelectedCategory: (value) => typedCategory = value,
//               ),

//               // Divider(
//               //   height: 50.h,
//               //   color: Colors.black,
//               // ),
//               Container(
//                 height: 5.h,
//                 color: Colors.white,
//               ),

//               /// Brand
//               BuildBrandWidget(
//                 callbackSelectedBrand: (value) {
//                   typedBrand = value;
//                 },
//               ),
//               Container(
//                 height: 5.h,
//                 color: Colors.white,
//               ),

//               /// Sale
//               // BuildSaleWidget(
//               //     //callbackSelectedCategory: (value) => typedCategory = value,
//               //     // formKey: formKey,
//               //     // collectionChoice: collectionChoice,
//               //     // typeChoice: typeChoice,
//               //     //typedCategory: typedCategory,
//               //     // callbackSelectedCategory: (value) => typedCategory = value,
//               //     // callbackSelectedType: (value) => typeChoice = value,
//               //     // callbackSelectedCollection: (value) =>
//               //     //     collectionChoice = value,
//               //     ),

//               // Container(
//               //   height: 5.h,
//               //   color: Colors.white,
//               // ),

//               /// Description
//               const TitlesWidget(title: 'Description'),
//               description(descriptionCtrl),

//               /// buttons
//             ],
//           ),
//         ),
//       ),

//       /// BottomNavigationBar
//       bottomNavigationBar: Container(
//         padding: REdgeInsets.only(
//           left: 16,
//           right: 16,
//           bottom: 25,
//         ),
//         height: 104.h,
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(
//               sizedBoxHeight: 36.h,
//               sizedBoxWidth: 160.w,
//               borderRadius: 30,
//               bgColor: Colors.white,
//               isBorderSide: true,
//               text: Text(
//                 'Discard',
//                 style: TextStyle(color: Colors.black, fontSize: 14.sp),
//               ),
//               onPressed: () {
//                 priseCtrl.clear();
//                 countCtrl.clear();
//                 descriptionCtrl.clear();
//                 Navigator.pop(context);
//               },
//             ),
//             CustomElevatedButton(
//               sizedBoxHeight: 36.h,
//               sizedBoxWidth: 160.w,
//               borderRadius: 30,
//               text: Text(
//                 'Apply',
//                 style: TextStyle(fontSize: 14.sp),
//               ),
//               onPressed: () {
//                 BlocProvider.of<ProductBloc>(context).add(
//                   SetProductEvent(
//                     ProductEntity(
//                       //id: productIndex + 1,
//                       category: CategoryEntity(
//                         // id: '',
//                         typeName: typedCategory.typeName,
//                         collectionName: typedCategory.collectionName,
//                         categoryName: typedCategory.categoryName,
//                       ),
//                       brand: typedBrand,
//                       colors: [
//                         ProductColorEntity(
//                           quantity: 5,
//                           color: selectedColor,
//                         )
//                       ],
//                       sizes: [
//                         ProductSizeEntity(
//                           quantity: 5,
//                           size: selectedSize,
//                         )
//                       ],
//                       price: double.parse(priseCtrl.text),
//                       quantity: int.parse(countCtrl.text),
//                       description: descriptionCtrl.text,
//                       rating: const ProductRatingEntity(
//                         totalRating: 2,
//                         totalUser: 26,
//                         one: 13,
//                         two: 4,
//                         three: 2,
//                         four: 3,
//                         five: 4,
//                       ),
//                       imgUrl: imageUrl,
//                     ),
//                   ),
//                 );
//                 priseCtrl.clear();
//                 countCtrl.clear();
//                 descriptionCtrl.clear();
//                 Navigator.pop(context);

//                 // log('prise ====>>>>  ${priseCtrl.text}');
//                 // log('count ====>>>>  ${countCtrl.text}');
//                 // log('Color ====>>>>  $selectedColor');
//                 // log('Size ====>>>>  $selectedSize');
//                 // log('typedBrand ====>>>>  $typedBrand');
//                 // log('typeName ====>>>>  ${typedCategory.typeName!}');
//                 // log('collectionName ====>>>>  ${typedCategory.collectionName!}');
//                 // log('categoryName ====>>>>  ${typedCategory.categoryName!}');
//                 // log('imageUrl ====>>>>  $imageUrl');
//               },
//             ),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: bottomNavigationBar(
//       //   context,
//       //   () {
//       //     BlocProvider.of<ProductBloc>(context).add(
//       //       SetProductEvent(
//       //         ProductEntities(
//       //           //id: productIndex + 1,
//       //           //name: nameController.text,
//       //           type: typedCategory.type,
//       //           collection: typedCategory.collection,
//       //           category: typedCategory.category,
//       //           brand: typedBrand,
//       //           color: selectedColor,
//       //           size: selectedSize,
//       //           price: double.parse(priseController.text),
//       //           count: int.parse(countController.text),
//       //           imgUrl: nameController.text,
//       //         ),
//       //       ),
//       //     );
//       //     Navigator.pop(context);
//       //     // Navigator.push(
//       //     //   context,
//       //     //   MaterialPageRoute(
//       //     //     builder: (context) => MobileHomeView(),
//       //     //   ),
//       //     // );

//       //     // Future.delayed(Duration(milliseconds: 100)).then(
//       //     //     (valueFuture) =>
//       //     //         BlocProvider.of<ProductBloc>(context)
//       //     //             .add(GetAllProductEvent()));

//       //     // log(nameController.text);
//       //     // log(priseController.text);
//       //     // log(countController.text);
//       //     // log(selectedColor);
//       //     // log(selectedSize);
//       //     // log(typedBrand);
//       //     // log(typedCategory.type!);
//       //     // log(typedCategory.collection!);
//       //     // log(typedCategory.category!);
//       //   },
//       // ),
//     );
//   }
// }

// description(TextEditingController descriptionController) {
//   return Padding(
//     padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
//     child: CustomTextFormField(
//       controller: descriptionController,
//       sizedBoxHeight: 154.h,
//       //sizedBoxWidth: MediaQuery.of(context).size.width,
//       sizedBoxWidth: double.infinity,
//       keyboardType: TextInputType.multiline,
//       labelText: 'Enter description',
//       fillColor: Colors.white,
//       maxLines: 10,
//     ),
//   );
// }

// // titles(String title) {
// //   return Padding(
// //     padding: REdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       height: 42.h,
// //       child: Align(
// //         alignment: Alignment.centerLeft,
// //         child: Text(
// //           title,
// //           style: AppTextStyles.black16Bold,
// //           // style: TextStyle(
// //           //   fontSize: 16.sp,
// //           //   fontWeight: FontWeight.bold,
// //           // ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// // colors(BuildContext context, List<bool> isSelected) {
// //   return Container(
// //     height: 80.h,
// //     //color: Colors.blue.shade300,
// //     color: Colors.white,
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       children: [
// //         FiltersColorsoggleButton(
// //           bgColor: Colors.black,
// //           isActivity: isSelected[0],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(0);
// //           },
// //         ),
// //         FiltersColorsoggleButton(
// //           bgColor: const Color(0xffff6f6f6),
// //           isActivity: isSelected[1],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(1);
// //           },
// //         ),
// //         FiltersColorsoggleButton(
// //           bgColor: const Color(0xfffb82222),
// //           isActivity: isSelected[2],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(2);
// //           },
// //         ),
// //         FiltersColorsoggleButton(
// //           bgColor: const Color(0xfffbea9a9),
// //           isActivity: isSelected[3],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(3);
// //           },
// //         ),
// //         FiltersColorsoggleButton(
// //           bgColor: const Color(0xfffe2bb8d),
// //           isActivity: isSelected[4],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(4);
// //           },
// //         ),
// //         FiltersColorsoggleButton(
// //           bgColor: const Color(0xfff151867),
// //           isActivity: isSelected[5],
// //           onPressed: () {
// //             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(5);
// //           },
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // sizes(BuildContext context, List<bool> isSelected) {
// //   return Container(
// //     height: 88.h,
// //     color: Colors.white,
// //     child: Row(
// //       children: [
// //         CustomToggleButton(
// //           text: 'XS',
// //           isActivity: isSelected[0],
// //           onPressed: () {
// //             BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
// //           },
// //           fontSize: 14.sp,
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 40.h,
// //           paddingOnlyLeft: 16.h,
// //         ),
// //         CustomToggleButton(
// //           text: 'S',
// //           isActivity: isSelected[1],
// //           onPressed: () {
// //             BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
// //           },
// //           fontSize: 14.sp,
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 40.h,
// //           paddingOnlyLeft: 16.h,
// //         ),
// //         CustomToggleButton(
// //           text: 'L',
// //           isActivity: isSelected[2],
// //           onPressed: () {
// //             BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
// //           },
// //           fontSize: 14.sp,
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 40.h,
// //           paddingOnlyLeft: 16.h,
// //         ),
// //         CustomToggleButton(
// //           text: 'M',
// //           isActivity: isSelected[3],
// //           onPressed: () {
// //             BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
// //           },
// //           fontSize: 14.sp,
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 40.h,
// //           paddingOnlyLeft: 16.h,
// //         ),
// //         CustomToggleButton(
// //           text: 'XL',
// //           isActivity: isSelected[4],
// //           onPressed: () {
// //             BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
// //           },
// //           fontSize: 14.sp,
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 40.h,
// //           paddingOnlyLeft: 16.h,
// //         ),
// //       ],
// //     ),
// //   );
// // }



// // bottomNavigationBar(
// //   BuildContext context,
// //   VoidCallback onPressed,
// // ) {
// //   return Container(
// //     padding: REdgeInsets.only(
// //       left: 16,
// //       right: 16,
// //       bottom: 25,
// //     ),
// //     height: 104.h,
// //     color: Colors.white,
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         CustomElevatedButton(
// //           sizedBoxHeight: 36.h,
// //           sizedBoxWidth: 160.w,
// //           borderRadius: 30,
// //           bgColor: Colors.white,
// //           isBorderSide: true,
// //           text: Text(
// //             'Discard',
// //             style: TextStyle(color: Colors.black, fontSize: 14.sp),
// //           ),
// //           onPressed: () {},
// //         ),
// //         CustomElevatedButton(
// //           sizedBoxHeight: 36.h,
// //           sizedBoxWidth: 160.w,
// //           borderRadius: 30,
// //           text: Text(
// //             'Apply',
// //             style: TextStyle(fontSize: 14.sp),
// //           ),
// //           onPressed: onPressed,
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // buttons(
// //   BuildContext context,
// //   ProductEntities product,
// // ) {
// //   return Container(
// //     padding: REdgeInsets.only(
// //       left: 16,
// //       right: 16,
// //       bottom: 25,
// //     ),
// //     height: 104.h,
// //     color: Colors.white,
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         CustomElevatedButton(
// //           sizedBoxHeight: 36.h,
// //           sizedBoxWidth: 160.w,
// //           borderRadius: 30,
// //           bgColor: Colors.white,
// //           isBorderSide: true,
// //           text: Text(
// //             'Discard',
// //             style: TextStyle(color: Colors.black, fontSize: 14.sp),
// //           ),
// //           onPressed: () {},
// //         ),
// //         CustomElevatedButton(
// //           sizedBoxHeight: 36.h,
// //           sizedBoxWidth: 160.w,
// //           borderRadius: 30,
// //           text: Text(
// //             'Apply',
// //             style: TextStyle(fontSize: 14.sp),
// //           ),
// //           onPressed: () {
// //             BlocProvider.of<ProductBloc>(context).add(
// //               SetProductEvent(
// //                 product,
// //                 // ProductEntities(
// //                 //   //id: productIndex + 1,
// //                 //   //name: nameController.text,
// //                 //   type: typedCategory.type,
// //                 //   collection: typedCategory.collection,
// //                 //   category: typedCategory.category,
// //                 //   brand: typedBrand,
// //                 //   color: selectedColor,
// //                 //   size: selectedSize,
// //                 //   price: double.parse(priseController.text),
// //                 //   count: int.parse(countController.text),
// //                 //   imgUrl: nameController.text,
// //                 // ),
// //               ),
// //             );
// //             Navigator.pop(context);
// //             // Navigator.push(
// //             //   context,
// //             //   MaterialPageRoute(
// //             //     builder: (context) => MobileHomeView(),
// //             //   ),
// //             // );

// //             // Future.delayed(Duration(milliseconds: 100)).then(
// //             //     (valueFuture) =>
// //             //         BlocProvider.of<ProductBloc>(context)
// //             //             .add(GetAllProductEvent()));

// //             // log(nameController.text);
// //             // log(priseController.text);
// //             // log(countController.text);
// //             // log(selectedColor);
// //             // log(selectedSize);
// //             // log(typedBrand);
// //             // log(typedCategory.type!);
// //             // log(typedCategory.collection!);
// //             // log(typedCategory.category!);
// //           },
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // photoBtn() {
// //   return Container(
// //     height: 70,
// //     //width: MediaQuery.of(context).size.width,
// //     color: Colors.white,
// //     padding: REdgeInsets.symmetric(
// //       horizontal: 80,
// //       vertical: 15,
// //     ),

// //     child: Center(
// //       child: CustomElevatedButton(
// //         text: Text(
// //           'Add photo',
// //           style: TextStyle(fontSize: 14.sp),
// //         ),
// //         onPressed: () {},
// //       ),
// //     ),
// //   );
// // }

// // saleBtn() {
// //   return Container(
// //     height: 70,
// //     //width: MediaQuery.of(context).size.width,
// //     color: Colors.white,
// //     padding: REdgeInsets.symmetric(
// //       horizontal: 80,
// //       vertical: 15,
// //     ),

// //     child: Center(
// //       child: CustomElevatedButton(
// //         text: Text(
// //           'Sale',
// //           style: TextStyle(fontSize: 14.sp),
// //         ),
// //         onPressed: () {},
// //       ),
// //     ),
// //   );
// // }

// // saleAndNew(
// //   BuildContext context,
// //   List<bool> isSelected,
// // ) {
// //   return Container(
// //     height: 70,
// //     color: Colors.white,
// //     padding: REdgeInsets.symmetric(
// //       horizontal: 80,
// //       vertical: 15,
// //     ),
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         CustomToggleButton(
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 122.h,
// //           isActivity: isSelected[0],
// //           text: 'New',
// //           onPressed: () {
// //             BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
// //           },
// //         ),
// //         20.horizontalSpace,
// //         CustomToggleButton(
// //           sizedBoxHeight: 40.h,
// //           sizedBoxWidth: 122.h,
// //           isActivity: isSelected[1],
// //           text: 'Sale',
// //           onPressed: () {
// //             BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
// //           },
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // category(BuildContext context, List<bool> isSelected) {
// //   return Container(
// //     height: 140.h,
// //     padding: REdgeInsets.symmetric(
// //       horizontal: 16,
// //       vertical: 24,
// //     ),
// //     color: Colors.white,
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             CustomToggleButton(
// //               sizedBoxHeight: 40.h,
// //               sizedBoxWidth: 122.h,
// //               isActivity: isSelected[0],
// //               text: 'All',
// //               onPressed: () {
// //                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
// //               },
// //             ),
// //             CustomToggleButton(
// //               sizedBoxHeight: 40.h,
// //               sizedBoxWidth: 122.h,
// //               isActivity: isSelected[1],
// //               text: 'Boys',
// //               onPressed: () {
// //                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
// //               },
// //             ),
// //           ],
// //         ),
// //         Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             CustomToggleButton(
// //               sizedBoxHeight: 40.h,
// //               sizedBoxWidth: 122.h,
// //               text: 'Women',
// //               isActivity: isSelected[2],
// //               onPressed: () {
// //                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(2);
// //               },
// //             ),
// //             CustomToggleButton(
// //               sizedBoxHeight: 40.h,
// //               sizedBoxWidth: 122.h,
// //               isActivity: isSelected[3],
// //               text: 'Girls',
// //               onPressed: () {
// //                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(3);
// //               },
// //             ),
// //           ],
// //         ),
// //         Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             CustomToggleButton(
// //               sizedBoxHeight: 40.h,
// //               sizedBoxWidth: 122.h,
// //               isActivity: isSelected[4],
// //               text: 'Men',
// //               onPressed: () {
// //                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(4);
// //               },
// //             ),
// //           ],
// //         ),
// //       ],
// //     ),
// //   );
// // }



// // listTileBtn(
// //   BuildContext context,
// //   String text,
// //   String subtitle,
// //   VoidCallback onTap,
// // ) {
// //   return ListTile(
// //     onTap: onTap,
// //     // onTap: () {
// //     //   GoRouter.of(context).goNamed(
// //     //     APP_PAGE.shopBrand.toName,
// //     //   );
// //     // },
// //     title: Text(
// //       text,
// //       style: AppTextStyles.black16Bold,
// //     ),
// //     subtitle: Text(
// //       subtitle,
// //       style: TextStyle(
// //         color: Colors.black38,
// //         fontSize: 14.sp,
// //       ),
// //     ),
// //     trailing: const Icon(Icons.chevron_right),
// //   );
// // }

// //https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg
