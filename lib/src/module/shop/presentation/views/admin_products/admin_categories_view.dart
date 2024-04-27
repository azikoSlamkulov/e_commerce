// import 'dart:developer';

// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// import '../../../../../config/locator.dart';
// //import '../../../../../config/util/app_widgets/bar/sliver_app_bar.dart';
// import '../../../../../config/util/app_widgets/dialogs/custom_snackbar.dart';
// //import '../../../../../config/util/datetime_format/datetime_format.dart';
// import '../../../../../config/util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// //import 'package:flash/flash.dart';

// import '../../../domain/entities/category_entity.dart';
// import '../../logic/tab_bar/tab_bar.dart';

// //allow read, write: if request.auth != null;

// class AdminCategoriesView extends StatelessWidget {
//   const AdminCategoriesView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //BlocProvider.of<CategoriesBloc>(context).add(GetAllCategoriesEvent());
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CategoriesBloc>(
//             create: (context) =>
//                 sl<CategoriesBloc>()..add(GetAllCategoriesEvent())),
//         BlocProvider<TabBarAdminCubit>(
//             create: (context) => sl<TabBarAdminCubit>()),
//       ],
//       child: BlocListener<CategoriesBloc, CategoriesState>(
//         listener: (context, state) {
//           if (state is CreatedCategoryState) {
//             BlocProvider.of<CategoriesBloc>(context)
//                 .add(GetAllCategoriesEvent());
//             CustomSnackbar().getSnackbar(
//               context: context,
//               title: 'Категория добавлена',
//               isError: false,
//             );
//           }
//           if (state is DeletedCategoryState) {
//             if (state.isDeleted) {
//               BlocProvider.of<CategoriesBloc>(context)
//                   .add(GetAllCategoriesEvent());
//               CustomSnackbar().getSnackbar(
//                 context: context,
//                 title: '${state.categoryName} удален.',
//               );
//             } else {
//               BlocProvider.of<CategoriesBloc>(context)
//                   .add(GetAllCategoriesEvent());
//               CustomSnackbar().getSnackbar(
//                 context: context,
//                 title: 'Ошибка!',
//                 isError: true,
//               );
//             }
//           }
//         },
//         child: BlocBuilder<CategoriesBloc, CategoriesState>(
//           builder: (context, state) {
//             if (state is LoadingCategoriesState) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is LoadedAllCategoriesState) {
//               return NestedAdminCategoriesView(
//                 allCategories: state.allCategories,
//               );
//             } else if (state is CategoriesFailureState) {
//               //return MyErrorWidget('${state.exception}');
//               return Text('');
//             } else {
//               //return const SomeError();,
//               return Text('');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class NestedAdminCategoriesView extends StatelessWidget {
//   NestedAdminCategoriesView({super.key, required this.allCategories});

//   final List<CategoryEntity> allCategories;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController categoryNameCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TabBarAdminCubit, TabBarAdminState>(
//       builder: (context, state) {
//         String typeChoice = 'Women';
//         String collectionChoice = '';

//         final allClothes = allCategories
//             .where((i) => i.typeName == state.selectedTabValue)
//             .where((i) => i.collectionName == 'Clothes')
//             .toList();

//         final allShoes = allCategories
//             .where((i) => i.typeName == state.selectedTabValue)
//             .where((i) => i.collectionName == 'Shoes')
//             .toList();

//         final allAccesories = allCategories
//             .where((i) => i.typeName == state.selectedTabValue)
//             .where((i) => i.collectionName == 'Accesories')
//             .toList();

//         const items = ['Women', 'Men', 'Kids'];
//         return Scaffold(
//           backgroundColor: AppColors.bgColorMain,
//           appBar: CustomAppBar(
//             title: 'Categories',
//             //showBackBtn: false,
//             showSearchBtn: true,
//             // onPressed: () {
//             //   // return BlocProvider.of<ProductBloc>(context).add(
//             //   //   GetAllProductEvent(),
//             //   // );
//             // },
//           ),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// TabBar
//               DefaultTabController(
//                 length: 3,
//                 initialIndex: 0,
//                 child: Container(
//                   height: 44.h,
//                   color: Colors.white,
//                   child: TabBar(
//                     onTap: (value) {
//                       BlocProvider.of<TabBarAdminCubit>(context)
//                           .getSelectedTabIndex(value);
//                       // switch (value) {
//                       //   case 0:
//                       //     typeChoice = 'Women';
//                       //     break;
//                       //   case 1:
//                       //     typeChoice = 'Men';
//                       //     break;
//                       //   case 2:
//                       //     typeChoice = 'Kids';
//                       //     break;
//                       // }
//                     },
//                     isScrollable: false,
//                     labelStyle:
//                         TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                     labelColor: Colors.black,
//                     unselectedLabelStyle: TextStyle(fontSize: 16.sp),
//                     unselectedLabelColor: Colors.black45,
//                     indicatorColor: Colors.red,
//                     tabs: items.map((e) => Tab(text: e)).toList(),
//                   ),
//                 ),
//               ),

//               Expanded(
//                   child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Add category button
//                     // Padding(
//                     //   padding: REdgeInsets.all(16),
//                     //   child: CustomElevatedButton(
//                     //     sizedBoxHeight: 50.h,
//                     //     sizedBoxWidth: double.infinity,
//                     //     borderRadius: 30,
//                     //     bgColor: AppColors.mainColor,
//                     //     text: Text(
//                     //       'ADD NEW CATEGORY',
//                     //       style: AppTextStyles.white14,
//                     //     ),
//                     //     onPressed: () {
//                     //       AppCustomBottomSheet().showBottomSheet(
//                     //         context: context,
//                     //         title: 'Add Category',
//                     //         content: MultiBlocProvider(
//                     //           providers: [
//                     //             BlocProvider<TypeToggleBtnCubit>(
//                     //               create: (context) => sl<TypeToggleBtnCubit>(),
//                     //             ),
//                     //             BlocProvider<SingleToggleBtnCubit>(
//                     //               create: (context) =>
//                     //                   sl<SingleToggleBtnCubit>(),
//                     //             ),
//                     //           ],
//                     //           child: addCategoryContent(
//                     //             context: context,
//                     //             formKey: _formKey,
//                     //             controller: categoryNameCtrl,
//                     //             callbackTypeChoice: (value) =>
//                     //                 typeChoice = value,
//                     //             callbackCollectionChoice: (value) =>
//                     //                 collectionChoice = value,
//                     //           ),
//                     //         ),
//                     //         btnText: 'ADD CATEGORY',
//                     //         onPressed: () {
//                     //           if (_formKey.currentState!.validate() &&
//                     //               collectionChoice != '' &&
//                     //               typeChoice != '') {
//                     //             BlocProvider.of<CategoriesBloc>(context).add(
//                     //               SetCategoryEvent(
//                     //                 typeChoice,
//                     //                 collectionChoice,
//                     //                 categoryNameCtrl.text,
//                     //               ),
//                     //             );
//                     //             Navigator.pop(context);
//                     //           }
//                     //           // log(typeChoice);
//                     //           // log(collectionChoice);
//                     //           // log(categoryNameCtrl.text);
//                     //         },
//                     //       );
//                     //     },
//                     //   ),
//                     // ),

//                     Padding(
//                       padding: REdgeInsets.all(16),
//                       child: Text(
//                         'All category from ${state.selectedTabValue.toLowerCase()}.',
//                         style: AppTextStyles.grey14,
//                       ),
//                     ),

//                     /// Products ListView
//                     titles('Clothes'),
//                     listViewWidget(categories: allClothes),

//                     /// Products ListView
//                     titles('Shoes'),
//                     listViewWidget(categories: allShoes),

//                     /// Products ListView
//                     titles('Accesories'),
//                     listViewWidget(categories: allAccesories),
//                   ],
//                 ),
//               ))
//             ],
//           ),
//           bottomNavigationBar: Container(
//             padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
//             height: 90.h,
//             color: Colors.white,
//             child: CustomElevatedButton(
//               sizedBoxHeight: 50.h,
//               sizedBoxWidth: double.infinity,
//               borderRadius: 30,
//               bgColor: AppColors.mainColor,
//               text: Text(
//                 'ADD NEW CATEGORY',
//                 style: AppTextStyles.white14,
//               ),
//               onPressed: () {
//                 AppCustomBottomSheet().showBottomSheet(
//                   context: context,
//                   title: 'Add Category',
//                   content: MultiBlocProvider(
//                     providers: [
//                       BlocProvider<TypeToggleBtnCubit>(
//                         create: (context) => sl<TypeToggleBtnCubit>(),
//                       ),
//                       BlocProvider<SingleToggleBtnCubit>(
//                         create: (context) => sl<SingleToggleBtnCubit>(),
//                       ),
//                     ],
//                     child: addCategoryContent(
//                       context: context,
//                       formKey: _formKey,
//                       controller: categoryNameCtrl,
//                       callbackTypeChoice: (value) => typeChoice = value,
//                       callbackCollectionChoice: (value) =>
//                           collectionChoice = value,
//                     ),
//                   ),
//                   btnText: 'ADD CATEGORY',
//                   onPressed: () {
//                     if (_formKey.currentState!.validate() &&
//                         collectionChoice != '' &&
//                         typeChoice != '') {
//                       BlocProvider.of<CategoriesBloc>(context).add(
//                         SetCategoryEvent(
//                           typeChoice,
//                           collectionChoice,
//                           categoryNameCtrl.text,
//                         ),
//                       );
//                       Navigator.pop(context);
//                     }
//                     // log(typeChoice);
//                     // log(collectionChoice);
//                     // log(categoryNameCtrl.text);
//                   },
//                 );
//               },
//             ),
//           ),
//           // floatingActionButton: FloatingActionButton(
//           //   onPressed: () {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: (context) => const MobileAddProductView(),
//           //       ),
//           //     );
//           //   },
//           //   backgroundColor: Colors.red,
//           //   child: const Icon(Icons.add),
//           // ),
//         );
//       },
//     );
//   }

//   titles(String title) {
//     return Container(
//       color: Colors.white,
//       height: 42.h,
//       width: double.infinity,
//       child: Padding(
//         padding: REdgeInsets.symmetric(horizontal: 16),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             title,
//             style: AppTextStyles.red16Bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget listViewWidget({required List<CategoryEntity> categories}) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 250.h),
//       child: categories.isNotEmpty
//           ? ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (BuildContext context, int index) {
//                 // final allShoes = allCategories
//                 //     .where((i) => i.collectionName == 'Shoes')
//                 //     .toList();
//                 final category = categories[index];
//                 //final shoe = allCategories[index];
//                 return ListTile(
//                   onTap: () {},
//                   //tileColor: Colors.white,
//                   title: Text(
//                     category.categoryName!,
//                     style: AppTextStyles.black16,
//                   ),
//                   trailing: IconButton(
//                     onPressed: () {
//                       BlocProvider.of<CategoriesBloc>(context).add(
//                         DeleteCategoryEvent(
//                           id: category.id!,
//                           categoryName: category.categoryName!,
//                         ),
//                       );
//                     },
//                     icon: const Icon(
//                       Icons.delete,
//                       color: AppColors.mainColor,
//                     ),
//                   ),
//                   contentPadding: REdgeInsets.symmetric(horizontal: 16),
//                   minVerticalPadding: 1,
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(
//                 height: 0,
//               ),
//               itemCount: categories.length,
//             )
//           : Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Список пуст!',
//                 style: AppTextStyles.grey16,
//               ),
//             ),
//     );
//   }
// }

// Widget addCategoryContent({
//   required BuildContext context,
//   required GlobalKey<FormState> formKey,
//   required TextEditingController controller,
//   required ValueSetter<String> callbackTypeChoice,
//   required ValueSetter<String> callbackCollectionChoice,
// }) {
//   return Form(
//     key: formKey,
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
//           22.verticalSpace,
//           const TitlesWidget(title: 'Enter category name'),
//           CustomTextFormField(
//             controller: controller,
//             sizedBoxHeight: 40,
//             //sizedBoxWidth: MediaQuery.of(context).size.width,
//             sizedBoxWidth: double.infinity,
//             labelText: 'Category name',
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Поле не должно быть пустым!';
//               }
//               return null;
//             },
//           ),
//           20.verticalSpace,
//           const TitlesWidget(title: 'Select type'),
//           BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
//             builder: (context, state) {
//               if (state is TypeInitialState) {
//                 return buildType(context, state.isSelected);
//               } else if (state is TypeSelectedState) {
//                 callbackTypeChoice(state.typeChoice);
//                 return buildType(context, state.isSelected);
//               }
//               return const Center(child: Text('Error'));
//             },
//           ),
//           20.verticalSpace,
//           const TitlesWidget(title: 'Select collection'),
//           BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
//             builder: (context, state) {
//               if (state is SingleInitialState) {
//                 return buildCategory(context, state.isSelected);
//               } else if (state is SingleSelectedState) {
//                 callbackCollectionChoice(state.collectionChoice);
//                 return buildCategory(context, state.isSelected);
//               }
//               return const Center(child: Text('Error'));
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
