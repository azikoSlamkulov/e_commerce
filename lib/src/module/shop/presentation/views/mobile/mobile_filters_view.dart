import 'package:e_commerce/src/module/shop/presentation/logic/category_toggle_btn_cubit/category_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/mobile_brand_view.dart';
import 'package:e_commerce/src/module/shop/presentation/widgets/custom_toggle_button.dart';
import 'package:e_commerce/src/module/shop/presentation/widgets/range_slider.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce/src/util/app_widgets/bar/app_custom_appbar.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../../app/routes/router_utils.dart';
import '../../widgets/filters_colors_toggle_btn.dart';

class MobileFiltersView extends StatelessWidget {
  const MobileFiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Filters',
        showSearchBtn: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            /// Prise range
            titles('Price range'),

            const RangeSliderWidget(),

            /// Colors
            titles('Colors'),
            BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
              builder: (context, state) {
                if (state is ColorsInitialState) {
                  return colors(context, state.isSelected);
                } else if (state is ColorsSelectedState) {
                  return colors(context, state.isSelected);
                }

                return const Center(child: Text('Error'));
              },
            ),

            /// Sizes
            titles('Sizes'),
            BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
              builder: (context, state) {
                if (state is SizesInitialState) {
                  return sizes(context, state.isSelected);
                } else if (state is SizesSelectedState) {
                  return sizes(context, state.isSelected);
                }

                return const Center(child: Text('Error'));
              },
            ),

            /// Category
            titles('Category'),
            BlocBuilder<CategoryToggleBtnCubit, CategoryToggleBtnState>(
              builder: (context, state) {
                if (state is CategoryInitialState) {
                  return category(context, state.isSelected);
                } else if (state is SelectedState) {
                  return category(context, state.isSelected);
                }

                return const Center(child: Text('Error'));
              },
            ),

            /// Brand
            brandButton(context),

            /// buttons
            Container(
              padding: REdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 25,
              ),
              height: 104.h,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    sizedBoxHeight: 36.h,
                    sizedBoxWidth: 160.w,
                    borderRadius: 30,
                    bgColor: Colors.white,
                    isBorderSide: true,
                    text: Text(
                      'Discard',
                      style: AppTextStyles.black14,
                      // style: TextStyle(
                      //   color: Colors.black,
                      //   fontSize: 14.sp,
                      // ),
                    ),
                    onPressed: () {},
                  ),
                  CustomElevatedButton(
                    sizedBoxHeight: 36.h,
                    sizedBoxWidth: 160.w,
                    borderRadius: 30,
                    text: Text(
                      'Apply',
                      style: AppTextStyles.white14,
                      // style: TextStyle(
                      //   fontSize: 14.sp,
                      // ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

colors(BuildContext context, List<bool> isSelected) {
  return Container(
    height: 92.h,
    //color: Colors.blue.shade300,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FiltersColorsoggleButton(
          bgColor: Colors.black,
          isActivity: isSelected[0],
          onPressed: () {
            BlocProvider.of<ColorsToggleBtnCubit>(context).selected(0);
          },
        ),
        FiltersColorsoggleButton(
          bgColor: const Color(0xffff6f6f6),
          isActivity: isSelected[1],
          onPressed: () {
            BlocProvider.of<ColorsToggleBtnCubit>(context).selected(1);
          },
        ),
        FiltersColorsoggleButton(
          bgColor: const Color(0xfffb82222),
          isActivity: isSelected[2],
          onPressed: () {
            BlocProvider.of<ColorsToggleBtnCubit>(context).selected(2);
          },
        ),
        FiltersColorsoggleButton(
          bgColor: const Color(0xfffbea9a9),
          isActivity: isSelected[3],
          onPressed: () {
            BlocProvider.of<ColorsToggleBtnCubit>(context).selected(3);
          },
        ),
        FiltersColorsoggleButton(
          bgColor: const Color(0xfffe2bb8d),
          isActivity: isSelected[4],
          onPressed: () {
            BlocProvider.of<ColorsToggleBtnCubit>(context).selected(4);
          },
        ),
        FiltersColorsoggleButton(
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

sizes(BuildContext context, List<bool> isSelected) {
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

category(BuildContext context, List<bool> isSelected) {
  return Container(
    height: 140.h,
    padding: REdgeInsets.symmetric(
      horizontal: 16,
      vertical: 24,
    ),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomToggleButton(
              sizedBoxHeight: 40.h,
              sizedBoxWidth: 122.h,
              isActivity: isSelected[0],
              text: 'All',
              onPressed: () {
                BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
              },
            ),
            CustomToggleButton(
              sizedBoxHeight: 40.h,
              sizedBoxWidth: 122.h,
              isActivity: isSelected[1],
              text: 'Boys',
              onPressed: () {
                BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
              },
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomToggleButton(
              sizedBoxHeight: 40.h,
              sizedBoxWidth: 122.h,
              text: 'Women',
              isActivity: isSelected[2],
              onPressed: () {
                BlocProvider.of<CategoryToggleBtnCubit>(context).selected(2);
              },
            ),
            CustomToggleButton(
              sizedBoxHeight: 40.h,
              sizedBoxWidth: 122.h,
              isActivity: isSelected[3],
              text: 'Girls',
              onPressed: () {
                BlocProvider.of<CategoryToggleBtnCubit>(context).selected(3);
              },
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomToggleButton(
              sizedBoxHeight: 40.h,
              sizedBoxWidth: 122.h,
              isActivity: isSelected[4],
              text: 'Men',
              onPressed: () {
                BlocProvider.of<CategoryToggleBtnCubit>(context).selected(4);
              },
            ),
          ],
        ),
      ],
    ),
  );
}

titles(String title) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 42.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.black16Bold,
          // style: TextStyle(
          //   fontSize: 16.sp,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
    ),
  );
}

brandButton(BuildContext context) {
  return ListTile(
    onTap: () {
      // GoRouter.of(context).goNamed(
      //   APP_PAGE.shopBrand.toName,
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MobileBrandView(),
        ),
      );
    },
    title: Text(
      'Brand',
      style: AppTextStyles.black16Bold,
      // style: TextStyle(
      //   fontSize: 16.sp,
      //   fontWeight: FontWeight.bold,
      // ),
    ),
    subtitle: Text(
      'adidas Originals, Jack & Jones, s.Oliver',
      style: AppTextStyles.grey11,
      // style: TextStyle(
      //   color: Colors.black38,
      //   fontSize: 11.sp,
      // ),
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
