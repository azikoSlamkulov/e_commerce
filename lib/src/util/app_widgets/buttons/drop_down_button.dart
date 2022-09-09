// import 'package:flutter/material.dart';

// class DropDownButton extends StatelessWidget {
//   DropDownButton({
//     required this.items,
//     // required this.dropdownvalue,
//     Key? key,
//   }) : super(key: key);

//   final List<String>? items;
//   // final String? dropdownvalue;

//   // Initial Selected Value
//   String dropdownvalue = 'User';

//   // List of items in our dropdown menu
//   // var items = [
//   //   'User',
//   //   'Admin',
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       // Initial Value
//       value: dropdownvalue,

//       // Down Arrow Icon
//       icon: const Icon(Icons.keyboard_arrow_down),

//       // Array list of items
//       items: items.map((String items) {
//         return DropdownMenuItem(
//           value: items,
//           child: Text(items),
//         );
//       }).toList(),
//       // After selecting the desired option,it will
//       // change button value to selected value
//       onChanged: (String? newValue) {
//         dropdownvalue = newValue!;
//       },
//     );
//   }
// }
