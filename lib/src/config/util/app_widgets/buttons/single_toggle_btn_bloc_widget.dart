import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../../config/util/app_constants/colors/app_colors.dart';
// import '../../../logic/single_toggle_btn/single_toggle_btn_cubit.dart';

class SingleSelectToggleBtnWithBlocWidget extends StatelessWidget {
  SingleSelectToggleBtnWithBlocWidget({
    required this.buttonList,
    required this.state,
    required this.onPressed,
    this.isGridView = true,
    this.crossAxisCount = 3,
    this.bgColor = AppColors.bgColorMain,
    this.containerHeight = 88,
    this.sizedBoxHeight = 40,
    this.sizedBoxWidth = 40,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    Key? key,
  }) : super(key: key);

  final List buttonList;
  final dynamic state;
  final VoidCallback onPressed;
  final bool isGridView;
  final int crossAxisCount;
  final Color bgColor;
  final double containerHeight;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double paddingHorizontal;
  final double paddingVertical;

  final List<bool> isSelectedList = [];

  @override
  Widget build(BuildContext context) {
    return !isGridView
        ? Container(
            height: containerHeight.h,
            color: bgColor,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: REdgeInsets.all(14),
              itemCount: buttonList.length,
              itemBuilder: (context, index) {
                final button = buttonList[index];
                isSelectedList.add(false);
                return singleToggleButton(
                  context,
                  button.name,
                  index,
                  isSelectedList[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 18.h),
            ),
          )
        : Container(
            height: containerHeight.h,
            //color: Colors.blue.shade300,
            color: bgColor,
            child: GridView.builder(
              padding: REdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 17.h,
                mainAxisExtent: 60.h,
                crossAxisCount: crossAxisCount,
              ),
              itemCount: buttonList.length,
              itemBuilder: (context, index) {
                final button = buttonList[index];
                isSelectedList.add(false);
                return singleToggleButton(
                  context,
                  button,
                  index,
                  state.isSelected[index],
                );
              },
            ),
          );
  }

  Padding singleToggleButton(
    BuildContext context,
    String buttonName,
    int index,
    bool isSelected,
  ) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: paddingVertical.h),
      child: SizedBox(
        height: sizedBoxHeight.h,
        width: sizedBoxWidth.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: REdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: isSelected
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF9B9B9B)),
            ),
            backgroundColor: isSelected ? AppColors.mainColor : Colors.white,
          ),
          onPressed: onPressed,
          // onPressed: () {
          //   context.read<SingleToggleBtnCubit>().selected(
          //         isSelectedList,
          //         index,
          //         buttonName,
          //       );
          // },
          child: Text(
            buttonName,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
