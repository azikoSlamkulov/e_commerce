// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SortToggleButton extends StatefulWidget {
//   const SortToggleButton({
//     required this.selectedSortText,
//     super.key,
//     // required this.type,
//     // required this.collection,
//     // required this.category,
//     // this.allCategories,
//   });

//   // final String type;
//   // final String collection;
//   // final String category;
//   // final List<FakeCategoryEntity>? allCategories;
//   final ValueSetter<String> selectedSortText;

//   @override
//   State<SortToggleButton> createState() => _SortToggleButtonState();
// }

// List<bool> isSelected = [false, true, false, false, false];
// String? _choice;

// class _SortToggleButtonState extends State<SortToggleButton> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SortToggleBtnCubit, SortToggleBtnState>(
//       builder: (context, state) {
//         return ToggleButtons(
//           isSelected: isSelected,
//           direction: Axis.vertical,
//           color: Colors.black54,
//           selectedColor: Colors.white,
//           fillColor: Colors.red,
//           splashColor: Colors.red,
//           renderBorder: false,
//           constraints: BoxConstraints(
//             minHeight: 48.h,
//             minWidth: MediaQuery.of(context).size.width,
//             // minWidth: double.infinity,
//           ),
//           children: [
//             text('Popular'),
//             text('Newest'),
//             text('Customer review'),
//             text('Price: lowest to high'),
//             text('Price: highest to low'),
//           ],
//           onPressed: (int newIndex) {
//             for (int index = 0; index < isSelected.length; index++) {
//               if (index == newIndex) {
//                 isSelected[index] = true;
//               } else {
//                 isSelected[index] = false;
//               }
//             }
//             switch (newIndex) {
//               case 0:
//                 _choice = 'Popular';
//                 break;
//               case 1:
//                 _choice = 'Newest';
//                 break;
//               case 2:
//                 _choice = 'Customer review';
//                 break;
//               case 3:
//                 _choice = 'Price: lowest to high';
//                 break;
//               case 4:
//                 _choice = 'Price: highest to low';
//                 break;
//             }
//             widget.selectedSortText(_choice!);
//             setState(() {});

//             // BlocProvider.of<SortToggleBtnCubit>(context)
//             //     .getSelectedIndex(newIndex);

//             Navigator.pop(context);
//           },
//         );
//       },
//     );
//   }
// }

// text(String text) {
//   return Padding(
//     padding: REdgeInsets.symmetric(horizontal: 16),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 16.sp),
//       ),
//     ),
//   );
// }
