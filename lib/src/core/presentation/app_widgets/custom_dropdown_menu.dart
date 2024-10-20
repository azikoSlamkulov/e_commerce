import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownMenu extends StatefulWidget {
  CustomDropdownMenu({
    super.key,
    required this.items,
    this.selectedItem,
    this.function,
    this.isHint = false,
    this.hintText,
    this.callback,
    this.validator,
  });

  final List<String?> items;
  String? selectedItem;
  final VoidCallback? function;
  final bool isHint;
  final String? hintText;
  final ValueSetter<String>? callback;
  String? Function(String?)? validator;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  //final List<String> sizeItems = ['XS', 'S', 'M', 'L', 'XL'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    // return DropdownButton<String>(
    //   hint: widget.isHint ? Text('${widget.hintText}') : null,
    //   value: selectedItem,
    //   items: widget.items
    //       .map(
    //         (item) => DropdownMenuItem<String>(
    //           value: item,
    //           child: Text(
    //             item,
    //             style: AppTextStyles.black14,
    //           ),
    //         ),
    //       )
    //       .toList(),
    //   onChanged: (item) {
    //     setState(() {
    //       widget.selectedItem = item!;
    //       widget.callback!(widget.selectedItem);
    //       //widget.function!();
    //     });
    //   },
    // );
    return SizedBox(
      height: 40.h,
      width: 138.h,
      child: DropdownButtonFormField<String>(
        //alignment: AlignmentDirectional.centerStart,
        hint: widget.isHint ? Text('${widget.hintText}') : null,

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
        // validator: widget.validator ??
        //     (item) {
        //       if (item == selectedItem) {
        //         //return 'dddd';
        //         ScaffoldMessenger.of(context)
        //             .showSnackBar(SnackBar(content: Text('gggg')));
        //         return 'dddd';
        //       }
        //       return null;
        //     },

        value: widget.isHint ? selectedItem : widget.selectedItem,
        items: widget.items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item!.toUpperCase(),
                  style: AppTextStyles.black14,
                ),
              ),
            )
            .toList(),
        onChanged: (item) {
          setState(() {
            widget.selectedItem = item!;
            widget.callback!(widget.selectedItem!);
            //widget.function!();
          });
        },
        // validator: (v) {
        //   if (v != widget.hintText) {
        //     widget.function!();
        //   }
        //   return null;
        // },
      ),
    );
  }
}
