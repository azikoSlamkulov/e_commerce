import 'dart:developer';

import 'package:e_commerce/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../shop/domain/domain.dart';
import '../../../../shop/presentation/widgets/widgets.dart';
import '../../admin_products.dart';

class AddColorAndSizesWidget extends StatelessWidget {
  AddColorAndSizesWidget({
    super.key,
  });

  String selectedColor = 'Цвет не выбран';
  final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
  List<String> selectedBigImagesList = [];
  SizeEntity selectedSize = const SizeEntity();
  List<bool> isSelectedColors = [];
  List<bool> isSelectedSizes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Add product',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          /// Sizes
          const TitlesWidget(title: 'Sizes'),
          SizesMultiSelectToggleButton(
            itemList: productSizes,
            sizeAddCallback: (value) {
              selectedSize = value;
            },
            isSelectedSizesCallback: (value) {
              isSelectedSizes = value;
            },
            isSelectedList: isSelectedSizes,
            oldSize: selectedSize,
          ),

          80.verticalSpace,
          Padding(
            padding: REdgeInsets.all(16),
            child: CustomElevatedButton(
              sizedBoxHeight: 48.h,
              sizedBoxWidth: double.infinity,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              text: Text(
                'Ok',
                style: AppTextStyles.white14,
              ),
              onPressed: () {
                // BlocProvider.of<ColorsAndSizesCubit>(context).addColors(
                //   color: AdminProductColorEntity(
                //     color: ProductColorEntity(
                //       color: selectedColor,
                //       colorSizes: selectedSize,
                //       colorImages: selectedBigImagesList,
                //     ),
                //     isSelectedColorsList: isSelectedColors,
                //     isSelectedSizesList: isSelectedSizes,
                //   ),
                // );

                log('Colors ====>>>>>> $isSelectedColors');
                log('isSelectedSizessss ====>>>>>> $isSelectedSizes');

                //Navigator.pop(context);
              },
            ),
          ),
          15.verticalSpace,
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider<ColorsToggleBtnCubit>(
  //         create: (context) => sl<ColorsToggleBtnCubit>(),
  //       ),
  //       // BlocProvider<SizesToggleBtnCubit>(
  //       //   create: (context) => sl<SizesToggleBtnCubit>(),
  //       // ),
  //     ],
  //     child: Scaffold(
  //       backgroundColor: AppColors.bgColorMain,
  //       appBar: CustomAppBar(
  //         title: 'Add product',
  //         showSearchBtn: true,
  //       ),
  //       body: Column(
  //         children: [
  //           /// Colors
  //           const TitlesWidget(title: 'Colors'),
  //           BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
  //             builder: (context, state) {
  //               if (state is ColorsInitialState) {
  //                 isSelectedColors = state.isSelected;
  //                 return ColorsWidget(isSelected: state.isSelected);
  //               } else if (state is ColorsSelectedState) {
  //                 selectedColor = state.color;
  //                 isSelectedColors = state.isSelected;
  //                 return ColorsWidget(isSelected: state.isSelected);
  //               }

  //               return const Center(child: Text('Error'));
  //             },
  //           ),

  //           /// Sizes
  //           const TitlesWidget(title: 'Sizes'),
  //           SizesMultiSelectToggleButton(
  //             itemList: productSizes,
  //             sizeAddCallback: (value) {
  //               selectedSize = value;
  //             },
  //             isSelectedSizesCallback: (value) {
  //               isSelectedSizes = value;
  //             },
  //             isSelectedList: isSelectedSizes,
  //             oldSize: selectedSize,
  //           ),

  //           // Big Images
  //           const TitlesWidget(title: 'Big images'),
  //           BlocProvider.value(
  //             value: BlocProvider.of<ImageCubit>(context),
  //             child: BigImagesWidget(
  //               bigImagesCallback: (value) {
  //                 selectedBigImagesList = value;
  //               },
  //             ),
  //           ),
  //           80.verticalSpace,
  //           Padding(
  //             padding: REdgeInsets.all(16),
  //             child: CustomElevatedButton(
  //               sizedBoxHeight: 48.h,
  //               sizedBoxWidth: double.infinity,
  //               borderRadius: 30,
  //               bgColor: AppColors.mainColor,
  //               text: Text(
  //                 'Ok',
  //                 style: AppTextStyles.white14,
  //               ),
  //               onPressed: () {
  //                 // BlocProvider.of<ColorsAndSizesCubit>(context).addColors(
  //                 //   color: AdminProductColorEntity(
  //                 //     color: ProductColorEntity(
  //                 //       color: selectedColor,
  //                 //       colorSizes: selectedSize,
  //                 //       colorImages: selectedBigImagesList,
  //                 //     ),
  //                 //     isSelectedColorsList: isSelectedColors,
  //                 //     isSelectedSizesList: isSelectedSizes,
  //                 //   ),
  //                 // );

  //                 log('Colors ====>>>>>> $isSelectedColors');
  //                 log('isSelectedSizessss ====>>>>>> $isSelectedSizes');
  //                 log('1 ====>>>>>> 1234');
  //                 //Navigator.pop(context);
  //               },
  //             ),
  //           ),
  //           15.verticalSpace,
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
