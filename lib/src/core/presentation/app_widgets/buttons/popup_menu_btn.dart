// import 'package:e_commerce/src/util/util.dart';
//import 'package:e_commerce/lib.dart';

// class PopUpMenuBtn extends StatelessWidget {
//   const PopUpMenuBtn({
//     required this.choices,
//     required this.onSelected,
//     super.key,
//   });

//   final List<String> choices;
//   final Function(String)? onSelected;

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       icon: Icon(
//         Icons.more_vert,
//         size: 25.h,
//         color: AppColors.grey,
//       ),
//       onSelected: onSelected,
//       itemBuilder: (BuildContext context) {
//         return choices.map((String choice) {
//           return PopupMenuItem<String>(
//             value: choice,
//             child: Text(
//               choice,
//               style: AppTextStyles.black11,
//             ),
//           );
//         }).toList();
//       },
//     );
//   }
// }

// // class Constants {
// //   static const String firstItem = 'Add to favorites';
// //   static const String secondItem = 'Delete from the list';

// //   static const List<String> choices = <String>[
// //     firstItem,
// //     secondItem,
// //   ];
// // }

// // void choiceAction(c) {
// //   if (choice == Constants.firstItem) {
// //     print('I First Item');
// //   } else if (choice == Constants.secondItem) {
// //     print('I Second Item');
// //   }
// // }
