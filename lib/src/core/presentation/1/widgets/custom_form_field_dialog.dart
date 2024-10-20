// import 'package:flutter/material.dart';

// class CustomFormFieldDialog {
//   getDialog({
//     //final BuildContext? context,
//     final TextEditingController? controller,
//     final TextInputType? keyboardType,
//     final String? title,
//     final String? contentText,
//     final String? hintText,
//     final Widget? content,
//     final bool? autofocus,
//     final String? Function(String?)? validator,
//     final Function(String)? onChanged,
//     Function? onTap,
//     required Function? onPressed,
//     Function? onPressed2,
//     Key? key,
//   }) {
//     Get.defaultDialog(
//       //barrierDismissible: false,
//       title: title!,
//       content: Stack(
//         //clipBehavior: Clip.none,
//         //overflow: Overflow.visible,
//         children: [
//           Positioned(
//             right: -25.0,
//             top: -60.0,
//             child: InkResponse(
//               onTap: () {
//                 Get.back();
//                 controller!.clear();
//               },
//               child: const CircleAvatar(
//                 child: Icon(Icons.close),
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ),
//           Form(
//             key: key,
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // To make the card compact
//               children: [
//                 TextFormField(
//                   controller: controller!,
//                   keyboardType: keyboardType,
//                   autofocus: autofocus!,
//                   //style: AppTextStyles.mulishBlack16w600,
//                   //style: TextStyle(color: AppColors.white),
//                   decoration: InputDecoration(
//                     focusColor: AppColors.red,
//                     hintText: hintText!,
//                     // hintStyle: AppTextStyles.mulishBlack14w600.copyWith(
//                     //   color: AppColors.black.withOpacity(0.5),
//                     // ),
//                     //prefixText: prefixText,
//                     //prefix: prefix,
//                     //prefixIcon: prefixIcon,
//                     //suffix: suffix,
//                     //suffixIcon: suffixIcon,
//                     fillColor: AppColors.textFormFieldBgColor,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 0.0,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 13, 116, 196),
//                         //color: Color.fromARGB(255, 20, 126, 24),
//                         width: 2,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: AppColors.red,
//                         width: 2.5,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
//                     // errorStyle: AppTextStyles.mulishMainColor16w600,
//                   ),
//                   validator: validator ??
//                       (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Поле не должно быть пустым!';
//                         }
//                         return null;
//                       },
//                   onChanged: onChanged,
//                   //autofocus: autofocus!,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       confirm: Column(
//         children: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 100),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(24),
//                 )),
//             onPressed: () => onPressed!(),
//             //onPressed: () => Get.back(),
//             child: Text(
//               "OK",
//               //style: AppTextStyles.mulishBlack14w600,
//             ),
//           ),
//           // SizedBox(height: 20),
//           // ElevatedButton(
//           //   style: ElevatedButton.styleFrom(
//           //       padding: EdgeInsets.symmetric(horizontal: 100),
//           //       shape: RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.circular(24),
//           //       )),
//           //   onPressed: () {
//           //     Get.back();
//           //     controller.clear();
//           //   },
//           //   //onPressed: () => Get.back(),
//           //   child: Text(
//           //     "Cancel",
//           //     //style: AppTextStyles.mulishBlack14w600,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
