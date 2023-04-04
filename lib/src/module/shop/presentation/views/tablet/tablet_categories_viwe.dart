// import 'dart:developer';

// import 'package:e_commerce/src/module/shop/presentation/logic/shop_bloc/shop_bloc.dart';
// import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../../../locator.dart';
// import '../../../../../util/app_widgets/bar/app_custom_appbar.dart';
// import '../../../../app/routes/router_utils.dart';
// import '../../widgets/categories_view_widget.dart';

// const items = ['Women', 'Men', 'Kids'];

// class TabletCategoriesView extends StatelessWidget {
//   const TabletCategoriesView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           sl<ShopBloc>()..add(const GetSelectedTabIndexEvent(0)),
//       child: const TabletCategoriesView2(),
//     );
//   }
// }

// class TabletCategoriesView2 extends StatelessWidget {
//   const TabletCategoriesView2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log('build');
//     int selectedTabIndex = 0;
//     return DefaultTabController(
//       length: 3,
//       initialIndex: selectedTabIndex,
//       child: Scaffold(
//         backgroundColor: AppColors.bgColorMain,
//         body: Center(
//           child: Column(
//             children: [
//               const AppCustomAppBar(
//                 title: 'Categories',
//               ),

//               /// TabBar
//               Container(
//                 height: 44.h,
//                 color: Colors.white,
//                 child: TabBar(
//                   onTap: (value) {
//                     BlocProvider.of<ShopBloc>(context).add(
//                       GetSelectedTabIndexEvent(value),
//                     );
//                   },
//                   isScrollable: false,
//                   labelStyle:
//                       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                   labelColor: Colors.black,
//                   unselectedLabelStyle: TextStyle(fontSize: 16.sp),
//                   unselectedLabelColor: Colors.black45,
//                   indicatorColor: Colors.red,
//                   tabs: items.map((e) => Tab(text: e)).toList(),
//                 ),
//               ),

//               /// List of Categories
//               BlocBuilder<ShopBloc, ShopState>(
//                 builder: (context, state) {
//                   if (state is SelectedTabIndexState) {
//                     selectedTabIndex = state.selectedTabIndex;
//                   }
//                   return SingleChildScrollView(
//                     child: CategoriesViewWidget(
//                       selectedTabIndex: selectedTabIndex,
//                       onTap: () {
//                         // GoRouter.of(context).goNamed(
//                         //   APP_PAGE.shopCategoriesSecond.toName,
//                         // );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // class MobileCategoriesView2 extends StatelessWidget {
// //   const MobileCategoriesView2({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     log('build');
// //     int selectedTabIndex = 0;

// //     //log('$selectedTabIndex');
// //     return DefaultTabController(
// //       length: 3,
// //       initialIndex: selectedTabIndex,
// //       child: Scaffold(
// //         backgroundColor: AppColors.bgColorMain,
// //         body: Center(
// //           child: Column(
// //             children: [
// //               const AppCustomAppBar(),

// //               Container(
// //                 height: 44.h,
// //                 color: Colors.white,
// //                 child: TabBar(
// //                   onTap: (value) {
// //                     BlocProvider.of<ShopBloc>(context).add(
// //                       GetSelectedTabIndexEvent(value),
// //                     );
// //                     // setState(() {
// //                     //   selectedTabIndex = value;
// //                     // });
// //                   },
// //                   isScrollable: false,
// //                   labelStyle:
// //                       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
// //                   labelColor: Colors.black,
// //                   unselectedLabelStyle: TextStyle(fontSize: 16.sp),
// //                   unselectedLabelColor: Colors.black45,
// //                   indicatorColor: Colors.red,
// //                   tabs: items.map((e) => Tab(text: e)).toList(),
// //                 ),
// //               ),
// //               //           BlocProvider.of<ShopBloc>(context)
// //               // if (state is SelectedTabIndexState) {
// //               //   selectedTabIndex = state.selectedTabIndex;
// //               // }
// //               BlocBuilder<ShopBloc, ShopState>(
// //                 builder: (context, state) {
// //                   if (state is SelectedTabIndexState) {
// //                     selectedTabIndex = state.selectedTabIndex;
// //                     // return CategoriesViewWidget(
// //                     //   selectedTabIndex: state.selectedTabIndex,
// //                     // );
// //                   }
// //                   return CategoriesViewWidget(
// //                       selectedTabIndex: selectedTabIndex);
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class MobileCategoriesView extends StatefulWidget {
// //   const MobileCategoriesView({Key? key}) : super(key: key);

// //   @override
// //   State<MobileCategoriesView> createState() => _MobileCategoriesViewState();
// // }

// // class _MobileCategoriesViewState extends State<MobileCategoriesView> {
// //   int selectedTabIndex = 0;
// //   @override
// //   Widget build(BuildContext context) {
// //     log('build');
// //     return DefaultTabController(
// //       length: 3,
// //       child: Scaffold(
// //         backgroundColor: AppColors.bgColorMain,
// //         body: Center(
// //           child: Column(
// //             children: [
// //               const AppCustomAppBar(),
// //               //tabBar(),
// //               //AppCustomTabBar(),
// //               SizedBox(
// //                 height: 44.h,
// //                 child: ColoredTabBar(
// //                   color: Colors.white,
// //                   height: 44.h,
// //                   tabBar: TabBar(
// //                     onTap: (value) {
// //                       setState(() {
// //                         selectedTabIndex = value;
// //                       });
// //                     },
// //                     isScrollable: false,
// //                     labelStyle:
// //                         TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
// //                     labelColor: Colors.black,
// //                     unselectedLabelStyle: TextStyle(fontSize: 16.sp),
// //                     unselectedLabelColor: Colors.black45,
// //                     indicatorColor: Colors.red,
// //                     tabs: items.map((e) => Tab(text: e)).toList(),
// //                   ),
// //                 ),
// //               ),
// //               CategoriesViewWidget(selectedTabIndex: selectedTabIndex),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // tabBar() {
// //   return Container(
// //     height: 44.h,
// //     color: Colors.white,
// //     child: TabBar(
// //       onTap: (value) {
// //         // setState(() {
// //         //   selectedTabIndex = value;
// //         // });
// //       },
// //       isScrollable: false,
// //       labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
// //       labelColor: Colors.black,
// //       unselectedLabelStyle: TextStyle(fontSize: 16.sp),
// //       unselectedLabelColor: Colors.black45,
// //       indicatorColor: Colors.red,
// //       tabs: items.map((e) => Tab(text: e)).toList(),
// //     ),
// //   );
// // }
