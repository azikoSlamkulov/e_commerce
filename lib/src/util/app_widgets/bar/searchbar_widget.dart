// import 'package:flutter/material.dart';

// class SearchBarWidget extends StatelessWidget {
//   TextEditingController textEditingController;
//   String controllerText;
//   Function function;
//   SearchBarWidget({
//     @required this.textEditingController,
//     @required this.controllerText,
//     @required this.function,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textEditingController,
//       //controller: controller.searchController,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(
//           Icons.search,
//           size: 30,
//           color: Colors.black,
//         ),
//         suffixIcon: controllerText.isNotEmpty
//             //suffixIcon: controller.controllerText.value.isNotEmpty
//             ? IconButton(
//                 onPressed: function,
//                 //onPressed: () => controller.searchController.clear(),
//                 icon: Icon(Icons.clear),
//               )
//             : null,
//         hintText: 'Search',
//         //labelText: 'Search',
//         filled: true,
//         fillColor: const Color(0xffEFEEEE),
//         border: InputBorder.none,
//       ),
//     );
//   }
// }



// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CargoController extends GetxController with SingleGetTickerProviderMixin {
//   //TODO: Implement CargoController

//   final count = 0.obs;
//   TabController tabController;
//   TextEditingController searchController = TextEditingController();
//   RxString controllerText = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(vsync: this, length: myTabs.length);
//     searchController.addListener(() {
//       controllerText.value = searchController.text;
//     });
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }

//   void increment() => count.value++;

//   final List<Tab> myTabs = <Tab>[
//     Tab(text: 'Texstyle'),
//     Tab(text: 'Shoes'),
//     Tab(text: 'Others'),
//   ];
// }
