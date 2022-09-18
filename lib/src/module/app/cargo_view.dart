// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mavshop/app/widgets/searchbar_widget.dart';
// import '../controllers/cargo_controller.dart';

// class CargoView extends StatelessWidget {
//   final CargoController controller = Get.put(CargoController());

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Obx(() => SearchBarWidget(
//                       textEditingController: controller.searchController,
//                       controllerText: controller.controllerText.value,
//                       function: () => controller.searchController.clear(),
//                     )),
//               ),
//               SizedBox(
//                 height: 50,
//                 child: AppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.transparent,
//                   bottom: TabBar(
//                     //padding: EdgeInsets.symmetric(horizontal: 10),
//                     isScrollable: false,
//                     //indicatorSize: TabBarIndicatorSize.label,
//                     controller: controller.tabController,
//                     tabs: controller.myTabs,
//                     labelColor: Colors.red,
//                     indicatorColor: Colors.red,
//                     unselectedLabelColor: Colors.black,
//                     labelStyle: const TextStyle(fontSize: 20),
//                     labelPadding: const EdgeInsets.symmetric(horizontal: 1),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   controller: controller.tabController,
//                   children: controller.myTabs.map((Tab tab) {
//                     final String label = tab.text.toLowerCase();
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Obx(() => Text(
//                                 controller.controllerText.value,
//                                 style: const TextStyle(
//                                     fontSize: 36, color: Colors.red),
//                               )),
//                           const SizedBox(height: 30),
//                           Text(
//                             '$label',
//                             style: const TextStyle(fontSize: 36),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
