import 'dart:developer';

import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownMenu extends StatefulWidget {
  CustomDropdownMenu({
    super.key,
    required this.items,
    required this.selectedItem,
    this.function,
    this.callback,
    this.validator,
  });

  final List<String> items;
  String selectedItem;
  final VoidCallback? function;
  final ValueSetter<String>? callback;
  String? Function(String?)? validator;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 138.h,
      child: DropdownButtonFormField<String>(
        //alignment: AlignmentDirectional.centerStart,

        decoration: InputDecoration(
          //constraints: BoxConstraints(),
          contentPadding: REdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(width: 1, color: Color(0xfff9b9b9b)),
          ),
          focusedBorder: OutlineInputBorder(
            //
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(width: 1, color: Color(0xfff9b9b9b)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(width: 1, color: AppColors.mainColor),
          ),
        ),
        validator: widget.validator ??
            (itemsIndex) {
              if (widget.items.isEmpty) {
                return 'dddd';
                //showBottomSheet(context, isSelected);
                //log('color');
              }
            },

        value: widget.selectedItem,
        items: widget.items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (item) {
          setState(() {
            widget.selectedItem = item!;
            widget.callback!(widget.selectedItem);
            widget.function!();
          });
        },
      ),
    );
  }
}
