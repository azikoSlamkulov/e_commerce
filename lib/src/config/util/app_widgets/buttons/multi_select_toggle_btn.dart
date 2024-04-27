import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiSelectToggleButton extends StatefulWidget {
  const MultiSelectToggleButton({
    required this.itemList,
    required this.selectedItemsCallback,
    this.containerHeight = 88,
    this.sizedBoxHeight = 40,
    this.sizedBoxWidth = 40,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    Key? key,
  }) : super(key: key);

  final List itemList;
  final ValueSetter<String> selectedItemsCallback;
  final double containerHeight;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double paddingHorizontal;
  final double paddingVertical;

  @override
  State<MultiSelectToggleButton> createState() =>
      _MultiSelectToggleButtonState();
}

class _MultiSelectToggleButtonState extends State<MultiSelectToggleButton> {
  final List<bool> isSelectedList = [];
  List<String> selectedItemNameList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight.h,
      //color: Colors.blue.shade300,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.all(14),
        itemCount: widget.itemList.length,
        itemBuilder: (context, index) {
          final item = widget.itemList[index];
          isSelectedList.add(false);

          return multiToggleButton(index, item);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.h),
      ),
    );
  }

  Widget multiToggleButton(int index, item) {
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
              side: isSelectedList[index]
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF9B9B9B)),
            ),
            //primary: bgColor,
            backgroundColor:
                isSelectedList[index] ? AppColors.mainColor : Colors.white,
          ),
          onPressed: () {
            setState(() {
              isSelectedList[index] = !isSelectedList[index];
              if (isSelectedList[index]) {
                selectedItemNameList.add(item.name);
                widget.selectedItemsCallback(item.name);
              } else {
                selectedItemNameList.remove(item.name);
                widget.selectedItemsCallback(item.name);
              }
            });

            //log(selectedItemNameList.toString());
          },
          child: Text(
            item.name,
            style: TextStyle(
              color: isSelectedList[index] ? Colors.white : Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
