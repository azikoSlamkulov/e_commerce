// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:e_commerce/lib.dart';

// class CustomBottomSheet {
//   showCustomBottomSheet({
//     required BuildContext context,
//     required final String title,
//     Widget? content,
//     required VoidCallback onPressed,
//     final bool? showBtn = true,
//     final String? btnText = '',
//     //final double? sizedBoxHeight,
//   }) {
//     return showModalBottomSheet<void>(
//       isScrollControlled: true,
//       context: context,
//       backgroundColor: AppColors.bgColorMain,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.r),
//           topRight: Radius.circular(30.r),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Wrap(
//           children: [
//             SingleChildScrollView(
//               child: SizedBox(
//                 //height: sizedBoxHeight ?? 400.h,
//                 child: Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: Padding(
//                           padding: REdgeInsets.only(top: 25),
//                           child: Text(
//                             title,
//                             style: AppTextStyles.black18Bold,
//                           ),
//                         ),
//                       ),
//                       25.verticalSpace,
//                       //content,
//                       showBtn!
//                           ? Padding(
//                               padding: REdgeInsets.only(
//                                 left: 16,
//                                 right: 16,
//                                 bottom: 16,
//                                 top: 36,
//                               ),
//                               child: CustomElevatedButton(
//                                 sizedBoxHeight: 48.h,
//                                 sizedBoxWidth:
//                                     MediaQuery.of(context).size.width,
//                                 borderRadius: 30,
//                                 bgColor: AppColors.mainColor,
//                                 text: Text(
//                                   btnText!,
//                                   style: AppTextStyles.white14,
//                                 ),
//                                 onPressed: onPressed,
//                               ),
//                             )
//                           : const SizedBox(),
//                       15.verticalSpace,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
