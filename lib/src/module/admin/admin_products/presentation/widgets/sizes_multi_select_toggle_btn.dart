import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/admin_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizesMultiSelectToggleButton extends StatefulWidget {
  const SizesMultiSelectToggleButton({
    required this.itemList,
    required this.sizeAddCallback,
    // required this.sizeRemoveCallback,
    required this.isSelectedSizesCallback,
    this.containerHeight = 120,
    this.sizedBoxHeight = 40,
    this.sizedBoxWidth = 40,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    this.isSelectedList,
    this.oldSize,
    Key? key,
  }) : super(key: key);

  final List itemList;
  final ValueSetter<SizeEntity> sizeAddCallback;
  // final ValueSetter<ProductSizeEntity> sizeRemoveCallback;
  final ValueSetter<List<bool>> isSelectedSizesCallback;
  final double containerHeight;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double paddingHorizontal;
  final double paddingVertical;
  final List<bool>? isSelectedList;
  final SizeEntity? oldSize;

  @override
  State<SizesMultiSelectToggleButton> createState() =>
      _SizesMultiSelectToggleButtonState();
}

class _SizesMultiSelectToggleButtonState
    extends State<SizesMultiSelectToggleButton> {
  List<bool> isSelectedList = [false, false, false, false, false];
  TextEditingController sizeTextController = TextEditingController();

  SizeEntity oldSize = const SizeEntity(
    xs: 0,
    s: 0,
    l: 0,
    m: 0,
    xl: 0,
  );

  String getSizeQuantity(String sizeName, SizeEntity sizeEntity) {
    String newSize = '';
    switch (sizeName) {
      case 'XS':
        newSize = sizeEntity.xs != 0 ? sizeEntity.xs.toString() : '';
        break;
      case 'S':
        newSize = sizeEntity.s != 0 ? sizeEntity.s.toString() : '';
        break;
      case 'L':
        newSize = sizeEntity.l != 0 ? sizeEntity.l.toString() : '';
        break;
      case 'M':
        newSize = sizeEntity.m != 0 ? sizeEntity.m.toString() : '';
        break;
      case 'XL':
        newSize = sizeEntity.xl != 0 ? sizeEntity.xl.toString() : '';
        break;
    }
    return newSize;
  }

  SizeEntity size({
    required String sizeName,
    required SizeEntity oldSize,
    required int newQuantity,
  }) {
    SizeEntity newSize = const SizeEntity();
    switch (sizeName) {
      case 'XS':
        newSize = SizeEntity(
          xs: newQuantity,
          s: oldSize.s,
          l: oldSize.l,
          m: oldSize.m,
          xl: oldSize.xl,
        );
        break;
      case 'S':
        newSize = SizeEntity(
          xs: oldSize.xs,
          s: newQuantity,
          l: oldSize.l,
          m: oldSize.m,
          xl: oldSize.xl,
        );
        break;
      case 'L':
        newSize = SizeEntity(
          xs: oldSize.xs,
          s: oldSize.s,
          l: newQuantity,
          m: oldSize.m,
          xl: oldSize.xl,
        );
        break;
      case 'M':
        newSize = SizeEntity(
          xs: oldSize.xs,
          s: oldSize.s,
          l: oldSize.l,
          m: newQuantity,
          xl: oldSize.xl,
        );
        break;
      case 'XL':
        newSize = SizeEntity(
          xs: oldSize.xs,
          s: oldSize.s,
          l: oldSize.l,
          m: oldSize.m,
          xl: newQuantity,
        );
        break;
    }
    return newSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight.h,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.all(14),
        itemCount: widget.itemList.length,
        itemBuilder: (context, index) {
          final item = widget.itemList[index];
          //isSelectedList.add(false);
          if (widget.isSelectedList!.isNotEmpty) {
            isSelectedList = widget.isSelectedList!;
            oldSize = widget.oldSize!;
          }

          return multiToggleButton(index, item);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.h),
      ),
    );
  }

  Widget multiToggleButton(int index, item) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: widget.paddingVertical.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
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
                backgroundColor:
                    isSelectedList[index] ? AppColors.mainColor : Colors.white,
              ),
              onPressed: widget.isSelectedList!.isEmpty
                  ? () {
                      // setState(() {
                      //   if (isSelectedList[index]) {
                      //     isSelectedList[index] = !isSelectedList[index];

                      //     // widget.sizeRemoveCallback(
                      //     //   ProductSizeEntity(
                      //     //     quantity: int.parse(sizeTextController.text),
                      //     //     size: item,
                      //     //   ),
                      //     // );
                      //   } else {
                      //     AppBottomSheet.showBottomSheet(
                      //       context: context,
                      //       title: 'Size quantity',
                      //       content: sizesContent(context, index, item),
                      //     );
                      //   }
                      // });
                      AppBottomSheet.showBottomSheet(
                        context: context,
                        title: 'Size quantity',
                        content: sizesContent(context, index, item),
                      );
                    }
                  : () {},
              child: Text(
                item,
                style: TextStyle(
                  color: isSelectedList[index] ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            getSizeQuantity(item, oldSize),
            style: const TextStyle(fontSize: 15, color: Colors.black38),
          ),
        ],
      ),
    );
  }

  Widget sizesContent(BuildContext context, int index, item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter size quantity',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        CustomTextFormField(
          controller: sizeTextController,
          sizedBoxHeight: 50.h,
          //sizedBoxWidth: MediaQuery.of(context).size.width,
          keyboardType: TextInputType.number,
          autofocus: true,
          labelText: 'Quantity',
          fillColor: Colors.white,
        ),
        20.verticalSpace,
        Padding(
          padding: REdgeInsets.all(16),
          child: CustomElevatedButton(
            sizedBoxHeight: 48.h,
            sizedBoxWidth: MediaQuery.of(context).size.width,
            borderRadius: 30,
            bgColor: AppColors.mainColor,
            text: Text(
              'Ok',
              style: AppTextStyles.white14,
            ),
            onPressed: () {
              // setState(() {
              //   isSelectedList[index] = !isSelectedList[index];
              //   if (isSelectedList[index]) {
              //     oldSize = size(
              //       sizeName: item,
              //       oldSize: oldSize,
              //       newQuantity: int.parse(sizeTextController.text),
              //     );
              //   }
              // });
              // widget.sizeAddCallback(oldSize
              //     // ProductSizeEntity(
              //     //   quantity: int.parse(sizeTextController.text),
              //     //   size: item,
              //     // ),
              //     );
              // widget.isSelectedSizesCallback(isSelectedList);
              widget
                  .isSelectedSizesCallback([false, false, false, false, false]);

              sizeTextController.clear();
              Navigator.pop(context);
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}
