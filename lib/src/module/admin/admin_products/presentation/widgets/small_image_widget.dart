import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/admin_products.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/big_image/big_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/domain.dart';

class SmallImageWidget extends StatefulWidget {
  SmallImageWidget({
    required this.smallImageCallback,
    this.height,
    this.bgColor,
    super.key,
  });

  final ValueSetter<ProductSmallImageEntity>? smallImageCallback;
  final double? height;
  final Color? bgColor;

  @override
  State<SmallImageWidget> createState() => _SmallImageWidgetState();
}

class _SmallImageWidgetState extends State<SmallImageWidget> {
  ProductSmallImageEntity selectedImage = const ProductSmallImageEntity();
  List<String> smallImageUrlList = [];
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 132.h,
      width: double.infinity,
      color: widget.bgColor ?? Colors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              // if (state is LoadingState) {
              //   return const Center(child: CircularProgressIndicator());
              // } else
              if (state is LoadedSelectedSmallImageState) {
                return InkWell(
                  onTap: () {
                    //BlocProvider.of<ImageCubit>(context).cleareImages();
                    //BlocProvider.of<ImageCubit>(context).getAllSmallImages();
                    AppBottomSheet.showBottomSheet(
                      context: context,
                      title: 'Image',
                      content: imageContent(context, ''),
                    );
                  },
                  child: Container(
                    margin: REdgeInsets.only(right: 8),
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.selectedSmallImage.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  // BlocProvider.value(
                  //   value: BlocProvider.of<ImageCubit>(context)
                  //       .getAllSmallImages(),
                  //       ch
                  // );
                  BlocProvider.of<ImageCubit>(context).getAllSmallImages();
                  AppBottomSheet.showBottomSheet(
                    context: context,
                    title: 'Image',
                    //content: imageContent(),
                    content: imageContent(context, ''),
                  );
                },
                child: Container(
                  margin: REdgeInsets.only(right: 8),
                  width: 100,
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 60,
                    color: AppColors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget imageContent(BuildContext context, String oldSmallImage) {
    //Small image
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Small images',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is LoadedAllSmallImagesUrlState) {
              return SizedBox(
                height: 150.h,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.imageList.length,
                    itemBuilder: (context, index) {
                      final image = state.imageList[index];
                      return InkWell(
                        onTap: () {
                          selectedImage = image;
                          //setState(() {});
                        },
                        child: Container(
                          //color: Colors.red,
                          margin: REdgeInsets.only(right: 8),
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image.imageUrl!),
                              fit: BoxFit.cover,
                            ),
                            border: selectedImage == image.imageUrl!
                                ? Border.all(color: Colors.blue, width: 2.5)
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return SizedBox(
              height: 150.h,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          },
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
            //onPressed: onPressed,
            onPressed: () {
              widget.smallImageCallback!(selectedImage);
              //bigImagesCallback!(bigImageUrlList);
              BlocProvider.of<ImageCubit>(context).getSelectedSmallImage(
                selectedImage,
              );
              Navigator.pop(context);
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}

// showCustomBottomSheet({
//   required BuildContext context,
//   required String title,
//   required VoidCallback onPressed,
//   required TextEditingController imageController,
//   required TextEditingController smallImageController,
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
//         height: 600.h, // 352
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
//                     'Ok',
//                     style: AppTextStyles.white14,
//                   ),
//                   onPressed: onPressed,
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
