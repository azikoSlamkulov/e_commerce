import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/colors_toggle_btn/colors_toggle_btn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filters_colors_toggle_btn.dart';

class ColorsWidget extends StatelessWidget {
  final List<bool> isSelected;

  const ColorsWidget({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      //color: Colors.blue.shade300,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterColorsToggleButton(
            bgColor: Colors.black,
            isActivity: isSelected[0],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(0);
            },
          ),
          FilterColorsToggleButton(
            bgColor: const Color(0xffff6f6f6),
            isActivity: isSelected[1],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(1);
            },
          ),
          FilterColorsToggleButton(
            bgColor: const Color(0xfffb82222),
            isActivity: isSelected[2],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(2);
            },
          ),
          FilterColorsToggleButton(
            bgColor: const Color(0xfffbea9a9),
            isActivity: isSelected[3],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(3);
            },
          ),
          FilterColorsToggleButton(
            bgColor: const Color(0xfffe2bb8d),
            isActivity: isSelected[4],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(4);
            },
          ),
          FilterColorsToggleButton(
            bgColor: const Color(0xfff151867),
            isActivity: isSelected[5],
            onPressed: () {
              BlocProvider.of<ColorsToggleBtnCubit>(context).selected(5);
            },
          ),
        ],
      ),
    );
  }
}
