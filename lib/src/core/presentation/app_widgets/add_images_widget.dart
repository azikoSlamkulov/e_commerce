// import 'dart:developer';

// import 'package:e_commerce/lib.dart';
// import 'package:e_commerce/src/module/admin/admin_products/admin_products.dart';
// import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/big_image/big_image_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddImagesWidget extends StatelessWidget {
//   AddImagesWidget({
//     required this.smallImageCallback,
//     required this.bigImagesCallback,
//     this.height,
//     this.bgColor,
//     super.key,
//   });

//   final ValueSetter<String>? smallImageCallback;
//   final ValueSetter<List<String>>? bigImagesCallback;
//   final double? height;
//   final Color? bgColor;

//   String smallImageUrl = '';
//   List<String> smallImageUrlList = [];
//   List<String> bigImageUrlList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Small Image
//         const TitlesWidget(title: 'Main image'),
//         Container(
//           height: height ?? 132.h,
//           width: double.infinity,
//           color: bgColor ?? Colors.white,
//           child: Padding(
//             padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: BlocBuilder<ImageCubit, ImageState>(
//                 builder: (context, state) {
//                   if (state is LoadingState) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (state is LoadedImageUrlState) {
//                     return InkWell(
//                       onTap: () {
//                         //BlocProvider.of<ImageCubit>(context).cleareImages();
//                         BlocProvider.of<ImageCubit>(context)
//                             .getAllSmallImages();
//                         AppBottomSheet.showBottomSheet(
//                           context: context,
//                           title: 'Image',
//                           //content: imageContent(),
//                           content: imageContent(context, ''),
//                         );
//                         // showCustomBottomSheet(
//                         //   context: context,
//                         //   title: 'Image',
//                         //   onPressed: () {
//                         //     // BlocProvider.of<ImageCubit>(context).getImages(
//                         //     //   imageController.text,
//                         //     // );
//                         //     //Navigator.pop(context);
//                         //   },
//                         //   // imgUrlList: state.imageList,
//                         // );
//                       },
//                       child: Container(
//                         margin: REdgeInsets.only(right: 8),
//                         width: 100,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(state.imageUrl),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                   return InkWell(
//                     onTap: () {
//                       // BlocProvider.value(
//                       //   value: BlocProvider.of<ImageCubit>(context)
//                       //       .getAllSmallImages(),
//                       //       ch
//                       // );
//                       BlocProvider.of<ImageCubit>(context).getAllSmallImages();
//                       AppBottomSheet.showBottomSheet(
//                         context: context,
//                         title: 'Image',
//                         //content: imageContent(),
//                         content: imageContent(context, ''),
//                       );
//                       // showCustomBottomSheet(
//                       //   context: context,
//                       //   title: 'Image',
//                       //   onPressed: () {
//                       //     // BlocProvider.of<ImageCubit>(context).getImages(
//                       //     //   imageController.text,
//                       //     // );
//                       //     //Navigator.pop(context);
//                       //   },
//                       // );
//                     },
//                     child: Container(
//                       margin: REdgeInsets.only(right: 8),
//                       width: 100,
//                       child: const Icon(
//                         Icons.add_a_photo,
//                         size: 60,
//                         color: AppColors.grey,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),

//         // Big Images
//         const TitlesWidget(title: 'Big images'),
//         Container(
//           height: height ?? 132.h,
//           width: double.infinity,
//           color: bgColor ?? Colors.white,
//           child: BlocBuilder<ImageCubit, ImageState>(
//             builder: (context, state) {
//               if (state is LoadedImageUrlState) {
//                 bigImageUrlList = state.imageList;
//                 return Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: state.imageList.length,
//                       itemBuilder: (context, index) {
//                         final image = state.imageList[index];
//                         final oldSmallImage = state.imageUrl;
//                         return image == ''
//                             ? InkWell(
//                                 onTap: () {
//                                   AppBottomSheet.showBottomSheet(
//                                     context: context,
//                                     title: 'Image',
//                                     content:
//                                         imageContent(context, oldSmallImage),
//                                   );
//                                 },
//                                 child: Container(
//                                   margin: REdgeInsets.only(right: 8),
//                                   width: 100,
//                                   child: const Icon(
//                                     Icons.add_a_photo,
//                                     size: 60,
//                                     color: AppColors.grey,
//                                   ),
//                                 ),
//                               )
//                             : InkWell(
//                                 onTap: () {},
//                                 child: Container(
//                                   margin: REdgeInsets.only(right: 8),
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: NetworkImage(image),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                       },
//                     ),
//                   ),
//                 );
//               }
//               return Container(
//                 height: height ?? 132.h,
//                 width: double.infinity,
//                 color: bgColor ?? Colors.white,
//                 child: const Center(
//                   child: Text(
//                     'Выберите основное изображение!',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget imageContent(BuildContext context, String oldSmallImage) {
//     //Small image
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Small images',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         10.verticalSpace,
//         BlocBuilder<ImageCubit, ImageState>(
//           builder: (context, state) {
//             if (state is LoadingState) {
//               return SizedBox(
//                 height: 150.h,
//                 child: Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 10),
//                   child: const Center(child: CircularProgressIndicator()),
//                 ),
//               );
//             } else if (state is LoadedAllSmallImagesUrlState) {
//               return SizedBox(
//                 height: 150.h,
//                 child: Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 10),
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: state.imageList.length,
//                     itemBuilder: (context, index) {
//                       final smallImage = state.imageList[index];
//                       return BlocBuilder<BigImageCubit, BigImageState>(
//                         builder: (context, state) {
//                           if (state is LoadedAllBigImagesUrlState) {
//                             return smallImageUrl == smallImage.imageUrl!
//                                 ? InkWell(
//                                     onTap: () {
//                                       //callback!(smallImage);
//                                       smallImageUrl = smallImage.imageUrl!;
//                                       BlocProvider.of<BigImageCubit>(context)
//                                           .getAllBigImages(
//                                               folderName:
//                                                   smallImage.imageName!);
//                                     },
//                                     child: Container(
//                                       //color: Colors.red,
//                                       margin: REdgeInsets.only(right: 8),
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               oldSmallImage != ''
//                                                   ? oldSmallImage
//                                                   : smallImage.imageUrl!),
//                                           fit: BoxFit.cover,
//                                         ),
//                                         border: Border.all(color: Colors.blue),
//                                       ),
//                                     ),
//                                   )
//                                 : InkWell(
//                                     onTap: () {
//                                       //callback!(smallImage);
//                                       smallImageUrl = smallImage.imageUrl!;
//                                       BlocProvider.of<BigImageCubit>(context)
//                                           .getAllBigImages(
//                                               folderName:
//                                                   smallImage.imageName!);
//                                     },
//                                     child: Container(
//                                       //color: Colors.red,
//                                       margin: REdgeInsets.only(right: 8),
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               oldSmallImage != ''
//                                                   ? oldSmallImage
//                                                   : smallImage.imageUrl!),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                             ;
//                           }
//                           return InkWell(
//                             onTap: () {
//                               //callback!(smallImage);
//                               smallImageUrl = smallImage.imageUrl!;
//                               BlocProvider.of<BigImageCubit>(context)
//                                   .getAllBigImages(
//                                       folderName: smallImage.imageName!);
//                             },
//                             child: Container(
//                               //color: Colors.red,
//                               margin: REdgeInsets.only(right: 8),
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(oldSmallImage != ''
//                                       ? oldSmallImage
//                                       : smallImage.imageUrl!),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               );
//             }
//             return SizedBox(
//               height: 150.h,
//               child: Padding(
//                 padding: REdgeInsets.symmetric(horizontal: 10),
//               ),
//             );
//           },
//         ),
//         30.verticalSpace,

//         // Big image
//         const Text(
//           'Big images',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         10.verticalSpace,
//         BlocBuilder<BigImageCubit, BigImageState>(
//           builder: (context, state) {
//             if (state is LoadingBigImageState) {
//               return SizedBox(
//                 height: 150.h,
//                 child: Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 10),
//                   child: const Center(child: CircularProgressIndicator()),
//                 ),
//               );
//             } else if (state is LoadedAllBigImagesUrlState) {
//               return SizedBox(
//                 height: 150.h,
//                 child: Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 10),
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: state.bigImageList.length,
//                     //itemCount: 5,
//                     itemBuilder: (context, index) {
//                       final image = state.bigImageList[index];
//                       bigImageUrlList.clear();
//                       bigImageUrlList.addAll(state.bigImageList);
//                       return InkWell(
//                         onTap: () {},
//                         child: Container(
//                           //color: Colors.red,
//                           margin: REdgeInsets.only(right: 8),
//                           width: 100,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(image),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             }
//             return SizedBox(
//               height: 150.h,
//               child: Padding(
//                 padding: REdgeInsets.symmetric(horizontal: 10),
//                 child: const Center(
//                   child: Text(
//                     'Выберите основное изображение!',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         20.verticalSpace,
//         Padding(
//           padding: REdgeInsets.all(16),
//           child: CustomElevatedButton(
//             sizedBoxHeight: 48.h,
//             sizedBoxWidth: MediaQuery.of(context).size.width,
//             borderRadius: 30,
//             bgColor: AppColors.mainColor,
//             text: Text(
//               'Ok',
//               style: AppTextStyles.white14,
//             ),
//             //onPressed: onPressed,
//             onPressed: () {
//               smallImageCallback!(smallImageUrl);
//               bigImagesCallback!(bigImageUrlList);
//               BlocProvider.of<ImageCubit>(context).getSmallAndBigImages(
//                 smallImage: smallImageUrl,
//                 bigImages: bigImageUrlList,
//               );
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         15.verticalSpace,
//       ],
//     );
//   }

//   // showCustomBottomSheet({
//   //   required BuildContext context,
//   //   required String title,
//   //   required VoidCallback onPressed,
//   //   //required List<String> imgUrlList,
//   // }) {
//   //   return showModalBottomSheet<void>(
//   //     context: context,
//   //     backgroundColor: Colors.white,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(30.r),
//   //         topRight: Radius.circular(30.r),
//   //       ),
//   //     ),
//   //     builder: (BuildContext context) {
//   //       return BlocProvider(
//   //         create: (context) => sl<ImageCubit>()..getAllSmallImages(),
//   //         child: BlocBuilder<ImageCubit, ImageState>(
//   //           builder: (context, state) {
//   //             if (state is LoadingState) {
//   //               return const Center(child: CircularProgressIndicator());
//   //             } else if (state is LoadedAllSmallImagesUrlState) {
//   //               return SizedBox(
//   //                 height: 600.h, // 352
//   //                 child: Padding(
//   //                   padding: REdgeInsets.symmetric(horizontal: 30),
//   //                   child: Column(
//   //                     crossAxisAlignment: CrossAxisAlignment.start,
//   //                     children: [
//   //                       Center(
//   //                         child: Padding(
//   //                           padding: REdgeInsets.only(top: 36),
//   //                           child: Text(
//   //                             title,
//   //                             style: AppTextStyles.black18Bold,
//   //                           ),
//   //                         ),
//   //                       ),
//   //                       33.verticalSpace,
//   //                       SizedBox(
//   //                         height: 150.h,
//   //                         child: ListView.builder(
//   //                           scrollDirection: Axis.horizontal,
//   //                           itemCount: state.imageList.length,
//   //                           //itemCount: 5,
//   //                           itemBuilder: (context, index) {
//   //                             final image = state.imageList[index];
//   //                             return InkWell(
//   //                               onTap: () {
//   //                                 //callback!(image);
//   //                                 BlocProvider.of<ImageCubit>(context)
//   //                                     .getImages(image);
//   //                               },
//   //                               child: Container(
//   //                                 //color: Colors.red,
//   //                                 margin: REdgeInsets.only(right: 8),
//   //                                 width: 100,
//   //                                 decoration: BoxDecoration(
//   //                                   image: DecorationImage(
//   //                                     image: NetworkImage(image),
//   //                                     fit: BoxFit.cover,
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             );
//   //                           },
//   //                         ),
//   //                       ),
//   //                       30.verticalSpace,
//   //                       Padding(
//   //                         padding: REdgeInsets.all(16),
//   //                         child: CustomElevatedButton(
//   //                           sizedBoxHeight: 48.h,
//   //                           sizedBoxWidth: MediaQuery.of(context).size.width,
//   //                           borderRadius: 30,
//   //                           bgColor: AppColors.mainColor,
//   //                           text: Text(
//   //                             'Ok',
//   //                             style: AppTextStyles.white14,
//   //                           ),
//   //                           //onPressed: onPressed,
//   //                           onPressed: () {},
//   //                         ),
//   //                       ),
//   //                       15.verticalSpace,
//   //                     ],
//   //                   ),
//   //                 ),
//   //               );
//   //             }
//   //             return Text('');
//   //           },
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
// }



// // showCustomBottomSheet({
// //   required BuildContext context,
// //   required String title,
// //   required VoidCallback onPressed,
// //   required TextEditingController imageController,
// //   required TextEditingController smallImageController,
// // }) {
// //   return showModalBottomSheet<void>(
// //     context: context,
// //     backgroundColor: Colors.white,
// //     shape: RoundedRectangleBorder(
// //       borderRadius: BorderRadius.only(
// //         topLeft: Radius.circular(30.r),
// //         topRight: Radius.circular(30.r),
// //       ),
// //     ),
// //     builder: (BuildContext context) {
// //       return SizedBox(
// //         height: 600.h, // 352
// //         child: Padding(
// //           padding: REdgeInsets.symmetric(horizontal: 30),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Center(
// //                 child: Padding(
// //                   padding: REdgeInsets.only(top: 36),
// //                   child: Text(
// //                     title,
// //                     style: AppTextStyles.black18Bold,
// //                   ),
// //                 ),
// //               ),
// //               33.verticalSpace,
// //               Padding(
// //                 padding: REdgeInsets.symmetric(horizontal: 16),
// //                 child: CustomTextFormField(
// //                   controller: imageController,
// //                   keyboardType: TextInputType.text,
// //                   sizedBoxHeight: 40.h,
// //                   sizedBoxWidth: MediaQuery.of(context).size.width,
// //                   //sizedBoxWidth: 50,
// //                   labelText: 'Enter image',
// //                 ),
// //               ),
// //               20.verticalSpace,
// //               Padding(
// //                 padding: REdgeInsets.symmetric(horizontal: 16),
// //                 child: CustomTextFormField(
// //                   controller: smallImageController,
// //                   keyboardType: TextInputType.text,
// //                   sizedBoxHeight: 40.h,
// //                   sizedBoxWidth: MediaQuery.of(context).size.width,
// //                   //sizedBoxWidth: 50,
// //                   labelText: 'Enter small image',
// //                 ),
// //               ),
// //               30.verticalSpace,
// //               Padding(
// //                 padding: REdgeInsets.all(16),
// //                 child: CustomElevatedButton(
// //                   sizedBoxHeight: 48.h,
// //                   sizedBoxWidth: MediaQuery.of(context).size.width,
// //                   borderRadius: 30,
// //                   bgColor: AppColors.mainColor,
// //                   text: Text(
// //                     'Ok',
// //                     style: AppTextStyles.white14,
// //                   ),
// //                   onPressed: onPressed,
// //                 ),
// //               ),
// //               15.verticalSpace,
// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }
