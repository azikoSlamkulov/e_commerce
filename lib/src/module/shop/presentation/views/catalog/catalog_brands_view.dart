import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileBrandView extends StatelessWidget {
  const MobileBrandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brands = FakeBrandsData().allFakeBrands;
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
                CustomButton(
                  sizedBoxHeight: 36.h,
                  sizedBoxWidth: 160.w,
                  isOutlinedButton: true,
                  onPressed: () {},
                  text: 'Discard',
                ),
                CustomButton(
                  sizedBoxHeight: 36.h,
                  sizedBoxWidth: 160.w,
                  onPressed: () {},
                  text: 'Apply',
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
