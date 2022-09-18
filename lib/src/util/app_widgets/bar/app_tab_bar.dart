// import 'package:flutter/material.dart';

// class AppTabBar extends StatefulWidget {
//   const AppTabBar({super.key});

//   @override
//   State<AppTabBar> createState() => _AppTabBarState();
// }

// class _AppTabBarState extends State<AppTabBar> {
//   late TabController tabController;

//   final List<Tab> myTabs = <Tab>[
//     Tab(text: 'Texstyle'),
//     Tab(text: 'Shoes'),
//     Tab(text: 'Others'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(vsync: this, length: myTabs.length);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       bottom: TabBar(
//         //padding: EdgeInsets.symmetric(horizontal: 10),
//         isScrollable: false,
//         //indicatorSize: TabBarIndicatorSize.label,
//         controller: tabController,
//         tabs: myTabs,
//         labelColor: Colors.red,
//         indicatorColor: Colors.red,
//         unselectedLabelColor: Colors.black,
//         labelStyle: const TextStyle(fontSize: 20),
//         labelPadding: const EdgeInsets.symmetric(horizontal: 1),
//       ),
//     );
//     // return TabBarView(
//     //               controller: controller.tabController,
//     //               children: controller.myTabs.map((Tab tab) {
//     //                 final String label = tab.text.toLowerCase();
//     //                 return Center(
//     //                   child: Column(
//     //                     mainAxisAlignment: MainAxisAlignment.center,
//     //                     children: [
//     //                       Obx(() => Text(
//     //                             controller.controllerText.value,
//     //                             style: const TextStyle(
//     //                                 fontSize: 36, color: Colors.red),
//     //                           )),
//     //                       const SizedBox(height: 30),
//     //                       Text(
//     //                         '$label',
//     //                         style: const TextStyle(fontSize: 36),
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 );
//     //               }).toList(),
//     //             );
//   }
// }
