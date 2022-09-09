// import 'package:flutter/material.dart';

// class CustomDialog {
//   getDialog({
//     String? title,
//     String? contentText,
//     Widget? content,
//     bool isError = false,
//     required Function? onPressed,
//   }) {
//     Get.defaultDialog(
//       barrierDismissible: false,
//       title: title ?? 'Ошибка!',
//       titleStyle: isError
//           ? AppTextStyles.mulishRed18w900
//           : AppTextStyles.mulishBlack18w600,
//       content: Container(
//         width: Get.size.width,
//         child: Column(
//           mainAxisSize: MainAxisSize.min, // To make the card compact
//           children: <Widget>[
//             isError
//                 ? AppAssets.error(
//                     width: 100,
//                     height: 100,
//                   )
//                 : SizedBox(),
//             SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16),
//               child: Text(
//                 contentText!,
//                 maxLines: 4,
//                 textAlign: TextAlign.center,
//                 //style: AppTextStyles.mulishBlack14w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//       confirm: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 100),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//             )),
//         onPressed: () => onPressed!(),
//         child: Text(
//           "OK",
//           //style: AppTextStyles.mulishBlack14w600,
//         ),
//       ),
//     );
//   }
// }
