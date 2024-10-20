import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileBrandView extends StatelessWidget {
  const MobileBrandView({
    Key? key,
    required this.selectedBrandsCallback,
  }) : super(key: key);

  final ValueSetter<List<String>> selectedBrandsCallback;

  @override
  Widget build(BuildContext context) {
    //final brands = FakeBrandsData().allFakeBrands;
    return BlocProvider(
      create: (context) => sl<BrandsBloc>()..add(GetAllBrandsEvent()),
      child: BlocBuilder<BrandsBloc, BrandsState>(
        builder: (context, state) {
          if (state is BrandLoadingState) {
            return const LoadingWidget();
          } else if (state is LoadedAllBrandsState) {
            return NestedMobileBrandView(
              brands: state.allBrands,
              selectedBrandsCallback: selectedBrandsCallback,
            );
          } else if (state is ProductFailureState) {
            //return MyErrorWidget('//${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );

    //return NestedMobileBrandView(brands: brands);
  }
}

class NestedMobileBrandView extends StatefulWidget {
  const NestedMobileBrandView({
    super.key,
    required this.brands,
    required this.selectedBrandsCallback,
  });

  final List<BrandEntity> brands;
  final ValueSetter<List<String>> selectedBrandsCallback;

  @override
  State<NestedMobileBrandView> createState() => _NestedMobileBrandViewState();
}

class _NestedMobileBrandViewState extends State<NestedMobileBrandView> {
  List<String> selectedBrands = [];
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Discard',
                ),
                CustomButton(
                  sizedBoxHeight: 36.h,
                  sizedBoxWidth: 160.w,
                  onPressed: () {
                    widget.selectedBrandsCallback(selectedBrands);
                    Navigator.pop(context);
                  },
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
          selectedBrands.add(brand.name!);
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
