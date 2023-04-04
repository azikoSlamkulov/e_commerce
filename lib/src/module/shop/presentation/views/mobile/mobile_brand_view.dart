// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Aziko extends StatefulWidget {
//   const Aziko({super.key});

//   @override
//   State<Aziko> createState() => _AzikoState();
// }

// class _AzikoState extends State<Aziko> {
//   final String aaa = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('aaaaa'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               s
//             },
//             icon: Icon(Icons.search),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_widgets/bar/app_custom_appbar.dart';
import '../../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../../util/app_widgets/inputs/custom_searchbar.dart';
import '../../../domain/entities/brand_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../data/brand_data.dart';
import '../../data/categories_data.dart';

class MobileBrandView extends StatelessWidget {
  const MobileBrandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brands = BrandData().brands;
    return NestedMobileBrandView(brands: brands);
  }
}

class NestedMobileBrandView extends StatefulWidget {
  const NestedMobileBrandView({super.key, required this.brands});

  final List<BrandEntity> brands;

  @override
  State<NestedMobileBrandView> createState() => _NestedMobileBrandViewState();
}

class _NestedMobileBrandViewState extends State<NestedMobileBrandView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Brand',
        showSearchBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///SearchBar
          Padding(
            padding: REdgeInsets.only(left: 16, right: 16, top: 22),
            child: CustomSearchBar(),
          ),

          /// Brand ListView
          Expanded(
            child: ListView.separated(
              itemCount: widget.brands.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final brand = widget.brands[index];
                return buildSingleCheckBox(brand);
              },
            ),
          ),

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
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  onPressed: () {},
                ),
                CustomElevatedButton(
                  sizedBoxHeight: 36.h,
                  sizedBoxWidth: 160.w,
                  borderRadius: 30,
                  text: Text(
                    'Apply',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSingleCheckBox(BrandEntity brand) {
    return buildCheckbox(
        brand: brand,
        onClicked: () {
          final newValue = !brand.isCheked!;
          brand.isCheked = newValue;
          setState(() {});
        });
  }

  buildCheckbox({
    required BrandEntity brand,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      onTap: onClicked,
      // onTap: () {
      //   this.value = !value;
      //   setState(() {});
      // },
      title: Text(
        brand.name!,
        style: TextStyle(
          color: brand.isCheked! ? AppColors.mainColor : Color(0xfff222222),
          fontSize: 16.sp,
          fontWeight: brand.isCheked! ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Checkbox(
        value: brand.isCheked,
        onChanged: (value) => onClicked(),
        activeColor: AppColors.mainColor,
        // onChanged: (value) {
        //   this.value = value!;
        //   setState(() {});
        // },
      ),
      contentPadding: REdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 1,
    );
  }
}
