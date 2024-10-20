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

class ColorAndSizesView extends StatelessWidget {
  ColorAndSizesView({
    // required this.colorsAndSizesCallback,
    // required this.bigImagesCallback,
    super.key,
  });

  // final ValueSetter<ProductColorEntity>? colorsAndSizesCallback;
  // final ValueSetter<List<String>>? bigImagesCallback;

  //List<ProductColorEntity> colorsAndSizesList = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ColorsAndSizesCubit>(
        //   create: (context) => sl<ColorsAndSizesCubit>()..getColors(),
        // ),
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
      ],
      child: BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
        builder: (context, state) {
          if (state is LoadedColorsState) {
            return Scaffold(
              backgroundColor: AppColors.bgColorMain,
              appBar: CustomAppBar(
                title: 'Add product',
                showSearchBtn: true,
              ),
              body: Column(
                children: [
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => BlocProvider.value(
                      //       value:
                      //           BlocProvider.of<ColorsAndSizesCubit>(context),
                      //       child: AddColorAndSizesWidget(),
                      //     ),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddColorAndSizesWidget(),
                        ),
                      );
                    },
                    title: Text(
                      'Color and sizes',
                      style: AppTextStyles.black16Bold,
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  Container(
                    height: 5.h,
                    color: Colors.white,
                  ),
                  ListView.separated(
                    itemCount: state.colorsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final colorsAndSizes = state.colorsList[index];
                      return BuildColorsAndSizesWidget(
                        // colorsAndSizesCallback: (value) =>
                        //     colorsAndSizesList.add(value),
                        // bigImagesCallback: (value) =>
                        //     selectedBigImagesList = value,
                        colorsAndSizes: colorsAndSizes,
                      );
                    },
                    separatorBuilder: (context, index) => Container(
                      height: 5.h,
                      color: Colors.white,
                    ),
                  ),
                  // BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
                  //   builder: (context, state) {
                  //     if (state is LoadedColorsAndSizesState) {
                  //       colorsAndSizesList.add(state.colorsAndSizesList);
                  //       ListView.separated(
                  //         itemCount: 5,
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         itemBuilder: (context, index) {
                  //           final colorsAndSizes = colorsAndSizesList[index];
                  //           return BuildColorsAndSizesWidget(
                  //             // colorsAndSizesCallback: (value) =>
                  //             //     colorsAndSizesList.add(value),
                  //             // bigImagesCallback: (value) =>
                  //             //     selectedBigImagesList = value,
                  //             colorsAndSizes: colorsAndSizes,
                  //           );
                  //         },
                  //         separatorBuilder: (context, index) => Container(
                  //           height: 5.h,
                  //           color: Colors.white,
                  //         ),
                  //       );
                  //     }
                  //     return const SizedBox();
                  //   },
                  // ),
                ],
              ),
              bottomNavigationBar: Container(
                padding:
                    REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
                height: 112.h,
                color: Colors.white,
                child: CustomButton(
                  text: 'Ok',
                  onPressed: () {},
                ),
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
