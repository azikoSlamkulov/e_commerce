import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/sizes_toggle_btn/sizes_toggle_btn_cubit.dart';
import 'custom_toggle_button.dart';

class SizesWidget extends StatelessWidget {
  final List<bool> isSelected;

  const SizesWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      color: Colors.white,
      child: Row(
        children: [
          CustomToggleButton(
            text: 'XS',
            isActivity: isSelected[0],
            onPressed: () {
              BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
            },
            fontSize: 14.sp,
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 40.h,
            paddingOnlyLeft: 16.h,
          ),
          CustomToggleButton(
            text: 'S',
            isActivity: isSelected[1],
            onPressed: () {
              BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
            },
            fontSize: 14.sp,
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 40.h,
            paddingOnlyLeft: 16.h,
          ),
          CustomToggleButton(
            text: 'L',
            isActivity: isSelected[2],
            onPressed: () {
              BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
            },
            fontSize: 14.sp,
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 40.h,
            paddingOnlyLeft: 16.h,
          ),
          CustomToggleButton(
            text: 'M',
            isActivity: isSelected[3],
            onPressed: () {
              BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
            },
            fontSize: 14.sp,
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 40.h,
            paddingOnlyLeft: 16.h,
          ),
          CustomToggleButton(
            text: 'XL',
            isActivity: isSelected[4],
            onPressed: () {
              BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
            },
            fontSize: 14.sp,
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 40.h,
            paddingOnlyLeft: 16.h,
          ),
        ],
      ),
    );
  }
}
