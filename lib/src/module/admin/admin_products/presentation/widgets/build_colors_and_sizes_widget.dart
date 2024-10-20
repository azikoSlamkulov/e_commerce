import 'dart:developer';

import 'package:e_commerce/src/config/config.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../shop/domain/domain.dart';
import '../../../../shop/presentation/widgets/widgets.dart';
import '../../admin_products.dart';
import '../logic/colors_and_sizes/colors_and_sizes_cubit.dart';
import 'sizes_multi_select_toggle_btn.dart';

class BuildColorsAndSizesWidget extends StatelessWidget {
  BuildColorsAndSizesWidget({
    // required this.colorsAndSizesCallback,
    // required this.bigImagesCallback,
    required this.colorsAndSizes,
    super.key,
  });

  // final ValueSetter<ProductColorEntity>? colorsAndSizesCallback;
  // final ValueSetter<List<String>>? bigImagesCallback;

  String selectedColor = 'Цвет не выбран';
  final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
  List<ProductSizeEntity> selectedSizeList = [];
  List<String> selectedBigImagesList = [];
  SizeEntity selectedSize = const SizeEntity();
  List<bool> isSelectedColors = [];
  List<bool> isSelectedSizes = [];
  final AdminProductColorEntity colorsAndSizes;
  //List<ProductColorEntity> colorsAndSizesList = [const ProductColorEntity()];

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
  //     builder: (context, state) {
  //       if (state is LoadedColorsAndSizesState) {
  //         colorsAndSizesList.add(state.colorsAndSizesList);
  //         //isSelectedColors.addAll(state.selectedColorsList);
  //         return ListView.builder(
  //           itemCount: colorsAndSizesList.length,
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             final colorAndSize = colorsAndSizesList[index];
  //             return buildColorsAndSize(context, colorAndSize);
  //           },
  //         );
  //       }
  //       return ListTile(
  //         onTap: () {
  //           AppBottomSheet.showBottomSheet(
  //             context: context,
  //             title: 'Image',
  //             content: colorsAndSizesContent(context),
  //           );
  //         },
  //         title: Text(
  //           'Color and sizes',
  //           style: AppTextStyles.black16Bold,
  //         ),
  //         subtitle: Text(
  //           'Выбрать цвет',
  //           style: TextStyle(
  //             color: Colors.black38,
  //             fontSize: 14.sp,
  //           ),
  //         ),
  //         trailing: const Icon(Icons.chevron_right),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Color and sizes',
        style: AppTextStyles.black16Bold,
        //style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        colorsAndSizes.color!.color!,
        style: TextStyle(
          color: Colors.black38,
          fontSize: 14.sp,
        ),
      ),
      children: [
        /// Colors
        const TitlesWidget(title: 'Colors'),
        ColorsWidget(isSelected: colorsAndSizes.isSelectedColorsList!),

        /// Sizes
        const TitlesWidget(title: 'Sizes'),
        SizesMultiSelectToggleButton(
          itemList: productSizes,
          sizeAddCallback: (value) {
            //size();
            //addSelectedSize(value);
            //selectedSizeList.add(addSelectedSize(value));
            //selectedSizeList.add(value);
          },
          // sizeRemoveCallback: (value) {
          //   //addSelectedSize(value);
          //   //selectedSizeList.add(addSelectedSize(value));
          //   selectedSizeList.remove(value);
          // },
          isSelectedSizesCallback: (value) => isSelectedSizes = value,
          isSelectedList: colorsAndSizes.isSelectedSizesList,
          //oldSize: selectedSize,
          oldSize: colorsAndSizes.color!.colorSizes,
        ),

        // Big Images
        const TitlesWidget(title: 'Big images'),
        BlocProvider.value(
          value: BlocProvider.of<ImageCubit>(context),
          child: BigImagesWidget(
            bigImagesCallback: (value) {
              selectedBigImagesList = value;
            },
          ),
        ),
      ],
    );
  }

  buildColorsAndSize(BuildContext context, ProductColorEntity color) {
    return color != ProductColorEntity()
        ? ExpansionTile(
            title: Text(
              'Color and sizes',
              style: AppTextStyles.black16Bold,
              //style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              color.color!,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.sp,
              ),
            ),
            children: [
              /// Colors
              const TitlesWidget(title: 'Colors'),
              ColorsWidget(isSelected: isSelectedColors),

              /// Sizes
              const TitlesWidget(title: 'Sizes'),
              SizesMultiSelectToggleButton(
                itemList: productSizes,
                sizeAddCallback: (value) {
                  //size();
                  //addSelectedSize(value);
                  //selectedSizeList.add(addSelectedSize(value));
                  //selectedSizeList.add(value);
                },
                // sizeRemoveCallback: (value) {
                //   //addSelectedSize(value);
                //   //selectedSizeList.add(addSelectedSize(value));
                //   selectedSizeList.remove(value);
                // },
                isSelectedSizesCallback: (value) => isSelectedSizes = value,
                isSelectedList: isSelectedSizes,
                oldSize: selectedSize,
              ),

              // Big Images
              const TitlesWidget(title: 'Big images'),
              BlocProvider.value(
                value: BlocProvider.of<ImageCubit>(context),
                child: BigImagesWidget(
                  bigImagesCallback: (value) {
                    selectedBigImagesList = value;
                  },
                ),
              ),
            ],
          )
        : ListTile(
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context: context,
                title: 'Image',
                content: colorsAndSizesContent(context),
              );
            },
            title: Text(
              'Color and sizes',
              style: AppTextStyles.black16Bold,
            ),
            subtitle: Text(
              'Выбрать цвет',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.sp,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
          );
  }

  colorsAndSizesContent(BuildContext context) {
    return Column(
      children: [
        /// Colors
        const TitlesWidget(title: 'Colors'),
        BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
          builder: (context, state) {
            if (state is ColorsInitialState) {
              isSelectedColors = state.isSelected;
              return ColorsWidget(isSelected: state.isSelected);
            } else if (state is ColorsSelectedState) {
              selectedColor = state.color;
              isSelectedColors = state.isSelected;
              return ColorsWidget(isSelected: state.isSelected);
            }

            return const Center(child: Text('Error'));
          },
        ),

        /// Sizes
        const TitlesWidget(title: 'Sizes'),
        SizesMultiSelectToggleButton(
          itemList: productSizes,
          sizeAddCallback: (value) {
            //size();
            //addSelectedSize(value);
            //selectedSizeList.add(addSelectedSize(value));
            //selectedSizeList.add(value);
            selectedSize = value;
          },
          // sizeRemoveCallback: (value) {
          //   //addSelectedSize(value);
          //   //selectedSizeList.add(addSelectedSize(value));
          //   selectedSizeList.remove(value);
          // },
          isSelectedSizesCallback: (value) => isSelectedSizes = value,
          isSelectedList: [],
        ),

        // Big Images
        const TitlesWidget(title: 'Big images'),
        BlocProvider.value(
          value: BlocProvider.of<ImageCubit>(context),
          child: BigImagesWidget(
            bigImagesCallback: (value) {
              selectedBigImagesList = value;
            },
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: REdgeInsets.all(16),
          child: CustomElevatedButton(
            sizedBoxHeight: 48.h,
            sizedBoxWidth: MediaQuery.of(context).size.width,
            borderRadius: 30,
            bgColor: AppColors.mainColor,
            text: Text(
              'Ok',
              style: AppTextStyles.white14,
            ),
            onPressed: () {
              // colorsAndSizesCallback!(ProductColorEntity(
              //   color: selectedColor,
              //   colorSizes: selectedSize,
              // ));
              // bigImagesCallback!(selectedBigImagesList);
              // BlocProvider.of<BigImageCubit>(context).getSelectedBigImages(
              //   selectedBigImages: bigImageUrlList,
              // );
              BlocProvider.of<ColorsAndSizesCubit>(context).getColorsAndSizes(
                colorsAndSizes: ProductColorEntity(
                  color: selectedColor,
                  colorSizes: selectedSize,
                  colorImages: selectedBigImagesList,
                ),
                selectedImagesList: selectedBigImagesList,
                selectedColorsList: isSelectedColors,
                selectedSizesList: isSelectedSizes,
              );
              // colorsAndSizesList.add(
              //   ProductColorEntity(
              //     color: selectedColor,
              //     colorSizes: selectedSize,
              //     colorImages: selectedBigImagesList,
              //   ),
              // );
              log('Colors ====>>>>>> $selectedColor');
              //log('Sizes ====>>>>>> $isSelectedSizes');
              Navigator.pop(context);
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}
