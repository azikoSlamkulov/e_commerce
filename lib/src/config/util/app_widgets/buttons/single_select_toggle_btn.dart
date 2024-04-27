import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleSelectToggleButton extends StatefulWidget {
  const SingleSelectToggleButton({
    required this.itemList,
    required this.selectedItemsCallback,
    this.containerHeight = 88,
    this.sizedBoxHeight = 40,
    this.sizedBoxWidth = 40,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    this.isGridView = false,
    Key? key,
  }) : super(key: key);

  final List itemList;
  final ValueSetter<String> selectedItemsCallback;
  final double containerHeight;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool isGridView;

  @override
  State<SingleSelectToggleButton> createState() =>
      _SingleSelectToggleButtonState();
}

class _SingleSelectToggleButtonState extends State<SingleSelectToggleButton> {
  final List<bool> isSelectedList = [];
  String selectedItemName = '';

  @override
  Widget build(BuildContext context) {
    return !widget.isGridView
        ? Container(
            height: widget.containerHeight.h,
            //color: Colors.blue.shade300,
            color: Colors.white,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: REdgeInsets.all(14),
              itemCount: widget.itemList.length,
              itemBuilder: (context, itemIndex) {
                final item = widget.itemList[itemIndex];
                isSelectedList.add(false);
                // return buildTogglebutton(
                //   // color: colors.color,
                //   isSelected: isSelectedList[index],
                //   selectedIndex: index,
                //   colors: colors,
                // );
                return singleToggleButton(itemIndex, item);
              },
              separatorBuilder: (context, index) => SizedBox(width: 18.h),
            ),
          )
        : Container(
            height: widget.containerHeight.h,
            //color: Colors.blue.shade300,
            color: Colors.white,
            child: GridView.builder(
              padding: REdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 17.h,
                //mainAxisSpacing: 17.h,
                mainAxisExtent: 60.h,
                crossAxisCount: 3,
                //childAspectRatio: 90.h / 140.h,
              ),
              itemCount: widget.itemList.length,
              itemBuilder: (context, itemIndex) {
                final item = widget.itemList[itemIndex];
                isSelectedList.add(false);
                return singleToggleButton(itemIndex, item);
              },
            ),
          );
  }

  Padding singleToggleButton(int itemIndex, item) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: widget.paddingVertical.h),
      child: SizedBox(
        height: widget.sizedBoxHeight.h,
        width: widget.sizedBoxWidth.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: REdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: isSelectedList[itemIndex]
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF9B9B9B)),
            ),
            //primary: bgColor,
            backgroundColor:
                isSelectedList[itemIndex] ? AppColors.mainColor : Colors.white,
          ),
          onPressed: () {
            for (int index = 0; index < isSelectedList.length; index++) {
              if (index == itemIndex) {
                setState(() {
                  isSelectedList[index] = true;
                  selectedItemName = item.name;
                  widget.selectedItemsCallback(item.name);
                });
              } else {
                setState(() => isSelectedList[index] = false);
                widget.selectedItemsCallback(item.name);
              }
            }
            //log(selectedItemName);
          },
          child: Text(
            item.name,
            style: TextStyle(
              color: isSelectedList[itemIndex] ? Colors.white : Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
