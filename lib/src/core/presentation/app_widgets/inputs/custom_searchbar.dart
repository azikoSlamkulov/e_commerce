import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    // @required this.textEditingController,
    // @required this.controllerText,
    // @required this.function,
    Key? key,
  }) : super(key: key);

  // TextEditingController textEditingController;
  // String controllerText;
  // Function function;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    //final tabController = TabController(vsync: this, length: myTabs.length);
    searchController.addListener(() {
      controllerText = searchController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    //tabController!.dispose();
    super.dispose();
  }

  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: 'Texstyle'),
  //   Tab(text: 'Shoes'),
  //   Tab(text: 'Others'),
  // ];

  //final count = 0;
  TextEditingController searchController = TextEditingController();
  String controllerText = '';
  //TabController? tabController;
  //TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        controller: searchController,
        //controller: controller.searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 25.h,
            color: Color(0xfff9B9B9B),
          ),
          suffixIcon: searchController.text.isNotEmpty
              //suffixIcon: controller.controllerText.value.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                  //onPressed: () => controller.searchController.clear(),
                  icon: const Icon(Icons.clear),
                )
              : null,
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 16.sp, color: Color(0xfff9B9B9B)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: REdgeInsets.all(9),
          //border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        //onChanged: search,
      ),
    );
  }

  //void search(String query) {}
}



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
