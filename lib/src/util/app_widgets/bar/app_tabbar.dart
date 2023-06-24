// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce/lib.dart';

const tabBArItems = ['Women', 'Men', 'Kids'];

class AppCustomTabBar extends StatefulWidget {
  const AppCustomTabBar({super.key});

  @override
  State<AppCustomTabBar> createState() => _AppCustomTabBarState();
}

class _AppCustomTabBarState extends State<AppCustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        onTap: (value) {
          // setState(() {
          //   selectedTabIndex = value;
          // });
        },
        isScrollable: false,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        labelColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 16.sp),
        unselectedLabelColor: Colors.black45,
        indicatorColor: Colors.red,
        //tabs: items.map((e) => Tab(text: e)).toList(),
        tabs: [
          Tab(
            icon: Icon(Icons.people),
          ),
          Tab(
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}

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
