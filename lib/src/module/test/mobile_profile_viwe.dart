// import 'dart:developer';

// import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../util/app_constants/text_styles/app_text_styles.dart';
// import '../../../auth/presentation/logic/auth_bloc.dart';
// import '../../../auth/presentation/logic/auth_event.dart';

// class MobileProfileViwe extends StatefulWidget {
//   const MobileProfileViwe({Key? key}) : super(key: key);

//   @override
//   State<MobileProfileViwe> createState() => _MobileProfileViweState();
// }

// class _MobileProfileViweState extends State<MobileProfileViwe> {
//   TextEditingController heightController = TextEditingController();
//   TextEditingController widthController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     //int? widthValue = widthController.text.compareTo(_);
//     double? heightValue = 0;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           //padding: const EdgeInsets.only(
//           // right: index == allProducts.length - 1 ? 15 : 0,
//           // left: index == allProducts.length - 1 ? 15 : 15,
//           //),
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Profile View'),
//             AppSized.h50,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('heigh'),
//                 AppSized.w20,
//                 Text(heightController.text),
//               ],
//             ),
//             AppSized.h20,
//             AppSized.h20,
//             ElevatedButton(
//               onPressed: () async {
//                 log('screenWidth ===>>>> ${MediaQuery.of(context).size.width}');
//                 log('screenHeight ===>>>> ${MediaQuery.of(context).size.height}');
//               },
//               child: const Text('Размер экрана'),
//             ),
//             AppSized.h30,
//             adminButton(context, 'Admin', true, true, () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => const MobileAdminView(),
//               //   ),
//               // );
//             }),
//             AppSized.h100,
//             ElevatedButton(
//               onPressed: () async {
//                 BlocProvider.of<AuthBloc>(context).add(
//                   SignOutEvent(),
//                 );
//               },
//               child: const Text('Выход'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// adminButton(
//   BuildContext context,
//   String text,
//   bool isTop,
//   bool isBottom,
//   VoidCallback onTap,
// ) {
//   return ListTile(
//     shape: Border(
//       top: isTop
//           ? const BorderSide(color: Colors.black12, width: 0.5)
//           : BorderSide.none,
//       bottom: isBottom
//           ? const BorderSide(color: Colors.black12, width: 0.5)
//           : BorderSide.none,
//     ),
//     onTap: onTap,
//     title: Text(
//       text,
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }
