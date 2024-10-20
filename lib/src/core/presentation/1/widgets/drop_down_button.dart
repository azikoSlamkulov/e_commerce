// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DropDownBtn extends StatefulWidget {
//   DropDownBtn({
//     //required this.items,
//     // required this.dropdownvalue,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DropDownBtn> createState() => _DropDownBtnState();
// }

// class _DropDownBtnState extends State<DropDownBtn> {
//   //final List<String>? items;
//   String dropdownValue = 'User';

//   //List of items in our dropdown menu
//   var items = [
//     'User',
//     'Admin',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       // Initial Value
//       //value: dropdownValue,

//       // Down Arrow Icon
//       //icon: const Icon(Icons.keyboard_arrow_down),
//       icon: Icon(
//         Icons.more_vert,
//         size: 25.h,
//         color: AppColors.grey,
//       ),

//       // Array list of items
//       items: items.map((String items) {
//         return DropdownMenuItem(
//           value: items,
//           child: Text(
//             items,
//             style: TextStyle(color: Colors.black),
//           ),
//         );
//       }).toList(),
//       // After selecting the desired option,it will
//       // change button value to selected value
//       onChanged: (String? newValue) {
//         dropdownValue = newValue!;
//         setState(() {});
//       },
//     );
//   }
// }
