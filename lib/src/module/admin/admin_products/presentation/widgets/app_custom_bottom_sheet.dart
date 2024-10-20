import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/type_toggle_btn/type_toggle_btn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../admin_products.dart';

class AppCustomBottomSheet {
  showBottomSheet({
    required BuildContext context,
    required final String title,
    required Widget content,
    required VoidCallback onPressed,
    final bool? showBtn = true,
    final String? btnText = '',
    //final double? sizedBoxHeight,
  }) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.bgColorMain,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                //height: sizedBoxHeight ?? 400.h,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: REdgeInsets.only(top: 25),
                          child: Text(
                            title,
                            style: AppTextStyles.black18Bold,
                          ),
                        ),
                      ),
                      25.verticalSpace,
                      content,
                      showBtn!
                          ? Padding(
                              padding: REdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 16,
                                top: 36,
                              ),
                              child: CustomElevatedButton(
                                sizedBoxHeight: 48.h,
                                sizedBoxWidth:
                                    MediaQuery.of(context).size.width,
                                borderRadius: 30,
                                bgColor: AppColors.mainColor,
                                text: Text(
                                  btnText!,
                                  style: AppTextStyles.white14,
                                ),
                                onPressed: onPressed,
                              ),
                            )
                          : const SizedBox(),
                      15.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  // showCustomBottomSheet({
  //   required BuildContext context,
  //   required String title,
  //   //required VoidCallback onPressed,
  //   required TextEditingController imageController,
  //   required TextEditingController smallImageController,
  //   // required TextEditingController newPriseController,
  //   // required TextEditingController saleController,
  //   //required bool isActive,
  //   //required void Function(bool) onChanged
  //   // String category,

  //   // String type,
  //   // String collection,
  // }) {
  //   return showModalBottomSheet<void>(
  //     context: context,
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30.r),
  //         topRight: Radius.circular(30.r),
  //       ),
  //     ),
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 352.h,
  //         child: Padding(
  //           padding: REdgeInsets.symmetric(horizontal: 30),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Center(
  //                 child: Padding(
  //                   padding: REdgeInsets.only(top: 36),
  //                   child: Text(
  //                     title,
  //                     style: AppTextStyles.black18Bold,
  //                   ),
  //                 ),
  //               ),
  //               33.verticalSpace,
  //               Padding(
  //                 padding: REdgeInsets.symmetric(horizontal: 16),
  //                 child: CustomTextFormField(
  //                   controller: imageController,
  //                   keyboardType: TextInputType.text,
  //                   sizedBoxHeight: 40.h,
  //                   sizedBoxWidth: MediaQuery.of(context).size.width,
  //                   //sizedBoxWidth: 50,
  //                   labelText: 'Enter image',
  //                 ),
  //               ),
  //               20.verticalSpace,
  //               Padding(
  //                 padding: REdgeInsets.symmetric(horizontal: 16),
  //                 child: CustomTextFormField(
  //                   controller: smallImageController,
  //                   keyboardType: TextInputType.text,
  //                   sizedBoxHeight: 40.h,
  //                   sizedBoxWidth: MediaQuery.of(context).size.width,
  //                   //sizedBoxWidth: 50,
  //                   labelText: 'Enter small image',
  //                 ),
  //               ),
  //               30.verticalSpace,
  //               Padding(
  //                 padding: REdgeInsets.all(16),
  //                 child: CustomElevatedButton(
  //                   sizedBoxHeight: 48.h,
  //                   sizedBoxWidth: MediaQuery.of(context).size.width,
  //                   borderRadius: 30,
  //                   bgColor: AppColors.mainColor,
  //                   text: Text(
  //                     'CONTINUE',
  //                     style: AppTextStyles.white14,
  //                   ),
  //                   onPressed: () {},
  //                 ),
  //               ),
  //               15.verticalSpace,
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // showBottomSheet1({
  //   required BuildContext context,
  //   //TextEditingController controller,
  //   required GlobalKey<FormState> formKey,
  //   //String text,
  //   //String labelText,
  //   //List<String> typeItems,
  //   //List<String> collectionItems,
  //   required String collectionChoice,
  //   required String typeChoice,
  //   required final ValueSetter<String>? callbackSelectedCollection,
  //   required final ValueSetter<String>? callbackSelectedType,
  //   required VoidCallback onPressed,
  // }) {
  //   return showModalBottomSheet<void>(
  //     isScrollControlled: true,
  //     context: context,
  //     backgroundColor: AppColors.bgColorMain,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30.r),
  //         topRight: Radius.circular(30.r),
  //       ),
  //     ),
  //     builder: (BuildContext context) {
  //       return BlocProvider.value(
  //         value: BlocProvider.of<CategoriesBloc>(context),
  //         child: Padding(
  //           padding: REdgeInsets.symmetric(horizontal: 30),
  //           child: Form(
  //             key: formKey,
  //             child: SingleChildScrollView(
  //               child: SizedBox(
  //                 height: 400.h,
  //                 child: Column(
  //                   children: [
  //                     Center(
  //                       child: Padding(
  //                         padding: REdgeInsets.only(top: 25),
  //                         child: Text(
  //                           'Category',
  //                           style: AppTextStyles.black18Bold,
  //                         ),
  //                       ),
  //                     ),
  //                     22.verticalSpace,
  //                     titles('Select type'),
  //                     BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
  //                       builder: (context, state) {
  //                         if (state is TypeInitialState) {
  //                           return buildType(context, state.isSelected);
  //                         } else if (state is TypeSelectedState) {
  //                           typeChoice = state.typeChoice;
  //                           callbackSelectedType!(typeChoice);
  //                           return buildType(context, state.isSelected);
  //                         }
  //                         return const Center(child: Text('Error'));
  //                       },
  //                     ),
  //                     20.verticalSpace,
  //                     titles('Select collection'),
  //                     BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
  //                       builder: (context, state) {
  //                         if (state is SingleInitialState) {
  //                           return buildCategory(context, state.isSelected);
  //                         } else if (state is SingleSelectedState) {
  //                           collectionChoice = state.collectionChoice;
  //                           callbackSelectedCollection!(collectionChoice);
  //                           return buildCategory(context, state.isSelected);
  //                         }
  //                         return const Center(child: Text('Error'));
  //                       },
  //                     ),
  //                     30.verticalSpace,
  //                     Padding(
  //                       padding: REdgeInsets.all(16),
  //                       child: CustomElevatedButton(
  //                         sizedBoxHeight: 48.h,
  //                         sizedBoxWidth: MediaQuery.of(context).size.width,
  //                         borderRadius: 30,
  //                         bgColor: AppColors.mainColor,
  //                         text: Text(
  //                           'CONTINUE',
  //                           style: AppTextStyles.white14,
  //                         ),
  //                         onPressed: onPressed,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  showBrandDialog(
    BuildContext context,
    TextEditingController controller,
    String text,
    //Widget content,
    //String labelText,
    VoidCallback onPressed,
  ) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(text),
        content: CustomTextFormField(
          controller: controller,
          sizedBoxHeight: 40.h,
          sizedBoxWidth: MediaQuery.of(context).size.width,
          labelText: 'Enter brand name',
        ),
        actions: [
          Padding(
            padding: REdgeInsets.all(16),
            child: CustomElevatedButton(
              sizedBoxHeight: 48.h,
              sizedBoxWidth: MediaQuery.of(context).size.width,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              text: Text(
                'ADD BRAND',
                style: AppTextStyles.white14,
              ),
              onPressed: onPressed,
            ),
          ),
          // ElevatedButton(
          //   onPressed: onPressed,
          //   child: const Text("Ok"),
          // ),
        ],
      ),
    );
  }

  showGetCategoryDialog({
    required BuildContext context,
    //TextEditingController controller,
    required GlobalKey<FormState> formKey,
    //String text,
    //String labelText,
    //List<String> typeItems,
    //List<String> collectionItems,
    required String collectionChoice,
    required String typeChoice,
    required final ValueSetter<String>? callbackSelectedCollection,
    required final ValueSetter<String>? callbackSelectedType,
    required VoidCallback onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        //title: Text(text),
        content: BlocProvider.value(
          value: BlocProvider.of<CategoriesBloc>(context),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 400.h,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: REdgeInsets.only(top: 25),
                        child: Text(
                          'Category',
                          style: AppTextStyles.black18Bold,
                        ),
                      ),
                    ),
                    22.verticalSpace,
                    titles('Select type'),
                    BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
                      builder: (context, state) {
                        if (state is TypeInitialState) {
                          return buildType(context, state.isSelected);
                        } else if (state is TypeSelectedState) {
                          typeChoice = state.typeChoice;
                          callbackSelectedType!(typeChoice);
                          return buildType(context, state.isSelected);
                        }
                        return const Center(child: Text('Error'));
                      },
                    ),
                    20.verticalSpace,
                    titles('Select collection'),
                    BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
                      builder: (context, state) {
                        if (state is SingleInitialState) {
                          return buildCategory(context, state.isSelected);
                        } else if (state is SingleSelectedState) {
                          collectionChoice = state.collectionChoice;
                          callbackSelectedCollection!(collectionChoice);
                          return buildCategory(context, state.isSelected);
                        }
                        return const Center(child: Text('Error'));
                      },
                    ),
                    30.verticalSpace,
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: CustomElevatedButton(
                        sizedBoxHeight: 48.h,
                        sizedBoxWidth: MediaQuery.of(context).size.width,
                        borderRadius: 30,
                        bgColor: AppColors.mainColor,
                        text: Text(
                          'CONTINUE',
                          style: AppTextStyles.white14,
                        ),
                        onPressed: onPressed,

                        // onPressed: () {
                        //   callbackSelectedType!(typeChoice);
                        //   callbackSelectedCollection!(collectionChoice);

                        //   log(typeChoice);
                        //   log(collectionChoice);
                        //   // Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //     builder: (context) {
                        //   //       return MobileCategoriesListView(
                        //   //         collectionChoice: collectionChoice,
                        //   //         typeChoice: typeChoice,
                        //   //       );
                        //   //     },
                        //   //   ),
                        //   // ).then(
                        //   //   (_) => Navigator.pop(context),
                        //   // );
                        //   // if (formKey.currentState!.validate() &&
                        //   //     collectionChoice != '' &&
                        //   //     typeChoice != '') {
                        //   //   BlocProvider.of<CategoriesBloc>(context).add(
                        //   //     AddCategoryEvent(
                        //   //       typeChoice,
                        //   //       collectionChoice,
                        //   //       controller.text,
                        //   //     ),
                        //   //   );
                        //   //   Navigator.pop(context);
                        //   //   // log("category name ===>>> ${controller.text}");
                        //   //   // log("collectionChoice ===>>> $collectionChoice");
                        //   //   // log("typeChoice ===>>> $typeChoice");
                        //   // }

                        //   //showBottomSheet(context, isSelected);
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // actions: [
        //   ElevatedButton(
        //     onPressed: onPressed,
        //     child: const Text("Ok"),
        //   ),
        // ],
      ),
    );
  }

  showAddCategoryDialog(
    BuildContext context,
    TextEditingController controller,
    GlobalKey<FormState> formKey,
    //String text,
    //String labelText,
    //VoidCallback onPressed,
    //List<String> typeItems,
    //List<String> collectionItems,
    String collectionChoice,
    String typeChoice,
  ) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        //title: Text(text),
        content: BlocProvider.value(
          value: BlocProvider.of<CategoriesBloc>(context),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 490.h,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: REdgeInsets.only(top: 25),
                        child: Text(
                          'Add Category',
                          style: AppTextStyles.black18Bold,
                        ),
                      ),
                    ),
                    22.verticalSpace,
                    titles('Enter category name'),
                    CustomTextFormField(
                      controller: controller,
                      sizedBoxHeight: 40,
                      sizedBoxWidth: MediaQuery.of(context).size.width,
                      labelText: 'Category name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Поле не должно быть пустым!';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    titles('Select type'),
                    BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
                      builder: (context, state) {
                        if (state is TypeInitialState) {
                          return buildType(context, state.isSelected);
                        } else if (state is TypeSelectedState) {
                          typeChoice = state.typeChoice;
                          return buildType(context, state.isSelected);
                        }
                        return const Center(child: Text('Error'));
                      },
                    ),
                    20.verticalSpace,
                    titles('Select collection'),
                    BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
                      builder: (context, state) {
                        if (state is SingleInitialState) {
                          return buildCategory(context, state.isSelected);
                        } else if (state is SingleSelectedState) {
                          collectionChoice = state.collectionChoice;
                          return buildCategory(context, state.isSelected);
                        }
                        return const Center(child: Text('Error'));
                      },
                    ),
                    30.verticalSpace,
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: CustomElevatedButton(
                        sizedBoxHeight: 48.h,
                        sizedBoxWidth: MediaQuery.of(context).size.width,
                        borderRadius: 30,
                        bgColor: AppColors.mainColor,
                        text: Text(
                          'ADD CATEGORY',
                          style: AppTextStyles.white14,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              collectionChoice != '' &&
                              typeChoice != '') {
                            BlocProvider.of<CategoriesBloc>(context).add(
                              SetCategoryEvent(
                                typeChoice,
                                collectionChoice,
                                controller.text,
                              ),
                            );
                            Navigator.pop(context);
                            // log("category name ===>>> ${controller.text}");
                            // log("collectionChoice ===>>> $collectionChoice");
                            // log("typeChoice ===>>> $typeChoice");
                          }
                          ;

                          //showBottomSheet(context, isSelected);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // actions: [
        //   ElevatedButton(
        //     onPressed: onPressed,
        //     child: const Text("Ok"),
        //   ),
        // ],
      ),
    );
  }

  buildType(BuildContext context, List<bool> isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomToggleButton(
          sizedBoxHeight: 40.h,
          sizedBoxWidth: 110.h,
          isActivity: isSelected[0],
          text: 'Women',
          onPressed: () {
            BlocProvider.of<TypeToggleBtnCubit>(context).selected(0);
          },
        ),
        CustomToggleButton(
          sizedBoxHeight: 40.h,
          sizedBoxWidth: 110.h,
          isActivity: isSelected[1],
          text: 'Men',
          onPressed: () {
            BlocProvider.of<TypeToggleBtnCubit>(context).selected(1);
          },
        ),
        CustomToggleButton(
          sizedBoxHeight: 40.h,
          sizedBoxWidth: 110.h,
          text: 'Kids',
          isActivity: isSelected[2],
          onPressed: () {
            BlocProvider.of<TypeToggleBtnCubit>(context).selected(2);
          },
        ),
      ],
    );
  }

  buildCategory(BuildContext context, List<bool> isSelected) {
    return Container(
      //height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomToggleButton(
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 110.h,
            isActivity: isSelected[0],
            text: 'Clothes',
            onPressed: () {
              BlocProvider.of<SingleToggleBtnCubit>(context).selected(0);
            },
          ),
          CustomToggleButton(
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 110.h,
            isActivity: isSelected[1],
            text: 'Shoes',
            onPressed: () {
              BlocProvider.of<SingleToggleBtnCubit>(context).selected(1);
            },
          ),
          CustomToggleButton(
            sizedBoxHeight: 40.h,
            sizedBoxWidth: 110.h,
            isActivity: isSelected[2],
            text: 'Accesories',
            onPressed: () {
              BlocProvider.of<SingleToggleBtnCubit>(context).selected(2);
            },
          ),
        ],
      ),
    );
  }

  titles(String title) {
    return SizedBox(
      height: 42.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyles.black16Bold),
      ),
    );
  }
}
