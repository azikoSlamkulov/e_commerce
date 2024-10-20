import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCatalogFiltersView extends StatelessWidget {
  MobileCatalogFiltersView({super.key});

  final List<ColorModel> filterColors = <ColorModel>[
    const ColorModel(name: 'Black', color: Colors.black, isSelected: false),
    const ColorModel(
        name: 'White', color: Color(0xffff6f6f6), isSelected: false),
    const ColorModel(name: 'Red', color: Color(0xfffb82222), isSelected: false),
    const ColorModel(
        name: 'Grey', color: Color(0xfffbea9a9), isSelected: false),
    const ColorModel(
        name: 'Yellow', color: Color(0xfffe2bb8d), isSelected: false),
    const ColorModel(
        name: 'Blue', color: Color(0xfff151867), isSelected: false),
  ];

  final List<FilterModel> filterSizes = <FilterModel>[
    const FilterModel(name: 'XS', isSelected: false),
    const FilterModel(name: 'S', isSelected: false),
    const FilterModel(name: 'L', isSelected: false),
    const FilterModel(name: 'M', isSelected: false),
    const FilterModel(name: 'XL', isSelected: false),
  ];

  final List<FilterModel> filterCategory = <FilterModel>[
    const FilterModel(name: 'Women', isSelected: false),
    const FilterModel(name: 'Men', isSelected: false),
    const FilterModel(name: 'Children', isSelected: false),
  ];

  final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
  final List<String> productFilterCategory = <String>[
    'Women',
    'Men',
    'Children'
  ];

  RangeValues prise = const RangeValues(0, 0);
  List<String> colors = [];
  List<String> sizes = [];
  List<String> category = [];
  List<String> brands = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Filters',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              /// Prise range
              titles('Price range'),

              RangeSliderWidget(
                currentRangeValuesCallback: (value) => prise = value,
              ),

              /// Colors
              titles('Colors'),
              FilterColorsToggleBtn(
                colorList: filterColors,
                selectedItemsCallback: (value) => colors.add(value),
              ),

              /// Sizes
              titles('Sizes'),
              MultiSelectToggleButton(
                itemList: productSizes,
                selectedItemsCallback: (value) => sizes.add(value),
              ),

              /// Category
              titles('Category'),
              MultiSelectToggleButton(
                itemList: productFilterCategory,
                selectedItemsCallback: (value) => category.add(value),
                containerHeight: 105,
                sizedBoxWidth: 120,
                paddingVertical: 15,
              ),

              /// Brand
              brandButton(context),

              /// buttons
              Container(
                height: 140.h,
                color: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 160.w,
                        isOutlinedButton: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Discard',
                        textStyle: AppTextStyles.black14,
                      ),
                      CustomButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 160.w,
                        onPressed: () {
                          MyDialog.getDialog(context: context);
                          // log('Prise range ===>>> $prise');
                          // log('Colors ===>>> $colors');
                          // log('Sizes ===>>> $sizes');
                          // log('Category ===>>> $category');
                          // log('brands ===>>> $brands');
                        },
                        text: 'Apply',
                        textStyle: AppTextStyles.white14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            builder: (context) => MobileBrandView(
              selectedBrandsCallback: (value) => brands = value,
            ),
          ),
        );
      },
      title: Text(
        'Brand',
        style: AppTextStyles.black16Bold,
      ),
      subtitle: Text(
        brands.isEmpty ? 'Бренд не выбран' : brands.map((e) => e).toString(),
        style: AppTextStyles.grey11,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
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

class ColorModel extends Equatable {
  final String name;
  final Color color;
  final bool isSelected;

  const ColorModel({
    required this.name,
    required this.color,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [
        name,
        color,
        isSelected,
      ];
}

class FilterModel extends Equatable {
  final String name;
  final bool isSelected;

  const FilterModel({
    required this.name,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [
        name,
        isSelected,
      ];
}
