// import 'package:flutter/material.dart';

// class CustomSnackBarWidget extends StatelessWidget {
//   CustomSnackBarWidget({
//     required this.title,
//     this.contentText,
//     this.borderColor,
//     this.colorText,
//     this.backgroundColor,
//     this.messageText,
//     Key? key,
//   }) : super(key: key);

//   final String? title;
//   final String? contentText;
//   final Color? borderColor;
//   final Color? colorText;
//   final Color? backgroundColor;
//   final Widget? messageText;

//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       backgroundColor: Colors.redAccent,
//       duration: const Duration(seconds: 2),
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.only(
//         bottom: MediaQuery.of(context).size.height - 135,
//       ),
//       content: Padding(
//         padding: const EdgeInsets.only(top: 50),
//         child: Center(
//           child: Text(title!),
//         ),
//       ),
//     );
//   }
// }
