import 'package:e_commerce/lib.dart';

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
        ),
      ),
    ),
  );
}

brandButton(BuildContext context) {
  return ListTile(
    onTap: () {
      // context.goNamed(
      //   AppPage.filtersBrand.toName,
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
    ),
    subtitle: Text(
      'adidas Originals, Jack & Jones, s.Oliver',
      style: AppTextStyles.grey11,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
