import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterColorsToggleBtn extends StatefulWidget {
  const FilterColorsToggleBtn({
    required this.colorList,
    required this.selectedItemsCallback,
    Key? key,
  }) : super(key: key);

  final List<ColorModel> colorList;
  final ValueSetter<String> selectedItemsCallback;

  @override
  State<FilterColorsToggleBtn> createState() => _FilterColorsToggleBtnState();
}

class _FilterColorsToggleBtnState extends State<FilterColorsToggleBtn> {
  final List<bool> isSelectedList = [];
  List<String> selectedColorNameList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      //color: Colors.blue.shade300,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.all(14),
        itemCount: widget.colorList.length,
        itemBuilder: (context, index) {
          final color = widget.colorList[index];
          isSelectedList.add(false);
          return toggleButton(index, color);
        },
        separatorBuilder: (context, index) => SizedBox(width: 18.h),
      ),
    );
  }

  InkWell toggleButton(int index, item) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelectedList[index] = !isSelectedList[index];
          if (isSelectedList[index]) {
            selectedColorNameList.add(item.name);
            widget.selectedItemsCallback(item.name);
          } else {
            selectedColorNameList.remove(item.name);
            widget.selectedItemsCallback(item.name);
          }
        });

        //log(selectedColorNameList.toString());
      },
      child: Container(
        height: 47.h,
        width: 47.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelectedList[index] ? Colors.red : Colors.white,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: item.color,
              border: Border.all(
                color: item.name == 'White' ? Colors.grey : item.color,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 92.h,
  //     //color: Colors.blue.shade300,
  //     color: Colors.white,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         buildTogglebutton(
  //           color: filterCcolors[0].color,
  //           isSelected: isSelectedList[0],
  //           selectedIndex: 0,
  //         ),
  //         buildTogglebutton(
  //           color: filterCcolors[1].color,
  //           isSelected: isSelectedList[1],
  //           selectedIndex: 1,
  //         ),
  //         buildTogglebutton(
  //           color: filterCcolors[2].color,
  //           isSelected: isSelectedList[2],
  //           selectedIndex: 2,
  //         ),
  //         buildTogglebutton(
  //           color: filterCcolors[3].color,
  //           isSelected: isSelectedList[3],
  //           selectedIndex: 3,
  //         ),
  //         buildTogglebutton(
  //           color: filterCcolors[4].color,
  //           isSelected: isSelectedList[4],
  //           selectedIndex: 4,
  //         ),
  //         buildTogglebutton(
  //           color: filterCcolors[5].color,
  //           isSelected: isSelectedList[5],
  //           selectedIndex: 5,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildTogglebutton({
  //   required Color color,
  //   required bool isSelected,
  //   required int selectedIndex,
  // }) {
  //   return Padding(
  //     padding: REdgeInsets.only(
  //       left: 0,
  //       right: 0,
  //       top: 0,
  //       bottom: 0,
  //     ),
  //     child: Stack(
  //       children: [
  //         Container(
  //           height: 44.h,
  //           width: 44.h,
  //           decoration: BoxDecoration(
  //             border: Border.all(
  //               color: isSelected ? Colors.red : Colors.white,
  //             ),
  //             shape: BoxShape.circle,
  //           ),
  //         ),
  //         Positioned(
  //           right: 3.9.h,
  //           top: 3.9.h,
  //           child: SizedBox(
  //             height: 36.h,
  //             width: 36.h,
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 backgroundColor: color,
  //               ),
  //               onPressed: () {
  //                 for (int index = 0; index < isSelectedList.length; index++) {
  //                   if (index == selectedIndex) {
  //                     isSelectedList[index] = true;

  //                     setState(() {});
  //                   } else {
  //                     isSelectedList[index] = false;

  //                     setState(() {});
  //                   }
  //                 }
  //                 switch (selectedIndex) {
  //                   case 0:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                   case 1:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                   case 2:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                   case 3:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                   case 4:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                   case 5:
  //                     selectedColorName =
  //                         filterCcolors[selectedIndex].colorName;
  //                     break;
  //                 }
  //                 log(selectedColorName);
  //               },
  //               child: const Text(''),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
