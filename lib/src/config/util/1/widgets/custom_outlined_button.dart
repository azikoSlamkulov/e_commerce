// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';

// class CustomOutlinedButton extends StatelessWidget {
//   const CustomOutlinedButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//     this.sizedBoxHeight = 48.0,
//     this.sizedBoxWidth = double.infinity,
//     this.bgColor = AppColors.mainColor,
//     this.textColor = AppColors.white,
//   }) : super(key: key);

//   final String text;
//   final VoidCallback onPressed;
//   final double sizedBoxHeight;
//   final double sizedBoxWidth;
//   final Color bgColor;
//   final Color textColor;

//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle buttonStyles = OutlinedButton.styleFrom(
//       minimumSize: Size(sizedBoxWidth, sizedBoxHeight),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//       ),
//       side: const BorderSide(
//         color: Colors.black,
//         //style: BorderStyle.solid,
//       ),
//     );

//     return OutlinedButton(
//       style: buttonStyles,
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: AppTextStyles.black14,
//       ),
//     );
//   }
// }
