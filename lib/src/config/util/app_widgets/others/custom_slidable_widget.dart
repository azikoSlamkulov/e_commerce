// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';



// class CustomSlidableWidget extends GetView<AdminController> {
//   CustomSlidableWidget({
//     this.index,
//     this.title,
//     this.subtitle,
//     this.isWorking,
//     this.listTile,
//     this.slidableAction1,
//     this.slidableAction2,
//     this.slidableAction3,
//     this.slidableAction4,
//     this.leading,
//     this.onTap,
//     Key? key,
//   }) : super(key: key);

//   final int? index;
//   final Widget? title;
//   final Widget? subtitle;
//   bool? isWorking;
//   Widget? listTile;
//   final Widget? slidableAction1;
//   final Widget? slidableAction2;
//   final Widget? slidableAction3;
//   final Widget? slidableAction4;
//   final Widget? leading;
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//         key: key,
//         startActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           children: [
//             slidableAction1!,
//             //slidableAction2!,
//             // SlidableAction(
//             //   onPressed: (context) {
//             //     // showDialog(
//             //     //   context: context,
//             //     //   builder: (BuildContext context) {
//             //     //     return AlertDialogWidget(
//             //     //       title: 'Удалить?',
//             //     //       function: () {
//             //     //         //provider.deleteDriverFromWorkingList(index);
//             //     //         Navigator.of(context).pop();
//             //     //         ShowSnackBar().showSnackBar(
//             //     //           context,
//             //     //           Text('Авто: ${_drivers.length}'),
//             //     //         );
//             //     //       },
//             //     //     );
//             //     //   },
//             //     // );
//             //   },
//             //   backgroundColor: const Color(0xFFFE4A49),
//             //   foregroundColor: Colors.white,
//             //   icon: Icons.delete,
//             //   label: 'Удалить',
//             // ),
//           ],
//         ),
//         endActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           //dismissible: DismissiblePane(onDismissed: () {}),
//           children: [
//             slidableAction3!,
//             slidableAction4!,
//             // SlidableAction(
//             //   onPressed: (context) {
//             //     //launch('tel://${_drivers[index].othersPhon}');
//             //   },
//             //   backgroundColor: Colors.pinkAccent,
//             //   foregroundColor: Colors.white,
//             //   icon: Icons.share,
//             //   label: 'O',
//             // ),
//             // SlidableAction(
//             //   onPressed: (context) {
//             //     // launch('tel://${_drivers[index].megaCom}');
//             //   },
//             //   backgroundColor: const Color(0xFF0392CF),
//             //   foregroundColor: Colors.white,
//             //   icon: Icons.save,
//             //   label: 'Mega',
//             // ),
//           ],
//         ),
//         child: listTile ??
//             Card(
//               child: ListTile(
//                 leading: leading,
//                 title: title,
//                 subtitle: subtitle,
//                 //trailing: Text('${_accCont.newPosition.value}'),
//                 onTap: onTap,
//               ),
//             )

//         // child: Card(
//         //   child: ListTile(
//         //       //leading: provider.index,
//         //       title: Row(
//         //         children: [
//         //           SizedBox(
//         //               width: 150, child: Text(_drivers[index].firstName)),
//         //           SizedBox(
//         //             height: 35,
//         //             child: CustomToggleButtonWidget(
//         //               isChecked: _drivers[index].isCheckedWage,
//         //               text: 'Зп',
//         //             ),
//         //           ),
//         //           const SizedBox(width: 5),
//         //           // SizedBox(
//         //           //   height: 35,
//         //           //   child: provider.plane != Planes.planeFalse
//         //           //       ? ToggleButtons(
//         //           //           children: const [
//         //           //             Text('План'),
//         //           //           ],
//         //           //           onPressed: (int planeIndex) {
//         //           //             provider.isSelectedTogglePlane(
//         //           //                 planeIndex, index);
//         //           //             provider.boolButtonPlane(planeIndex, index);
//         //           //           },
//         //           //           isSelected: provider.workingDrivers[index]
//         //           //               .isSelectedPlaneToggle,
//         //           //           selectedBorderColor: Colors.red,
//         //           //           selectedColor: Colors.red,
//         //           //           color: Colors.grey,
//         //           //           fillColor: Colors.white,
//         //           //         )
//         //           //       : const SizedBox(),
//         //           // ),
//         //           const SizedBox(width: 5),
//         //           // SizedBox(
//         //           //   height: 35,
//         //           //   child: provider.othersTextController.text.isNotEmpty
//         //           //       ? ToggleButtons(
//         //           //           children: const [
//         //           //             Text('Др'),
//         //           //           ],
//         //           //           onPressed: (int planeIndex) {
//         //           //             provider.isSelectedToggleOthers(
//         //           //                 planeIndex, index);
//         //           //             provider.boolButtonOthers(
//         //           //                 planeIndex, index);
//         //           //           },
//         //           //           isSelected: provider.workingDrivers[index]
//         //           //               .isSelectedOthersToggle,
//         //           //           selectedBorderColor: Colors.red,
//         //           //           selectedColor: Colors.red,
//         //           //           color: Colors.grey,
//         //           //           fillColor: Colors.white,
//         //           //         )
//         //           //       : const SizedBox(),
//         //           // )
//         //         ],
//         //       ),
//         //       onTap: () {
//         //         // showDialog(
//         //         //   context: context,
//         //         //   builder: (BuildContext context) {
//         //         //     return AlertDialogWidget(
//         //         //       title: 'Поменять водителя?',
//         //         //       function: () {
//         //         //         provider.getDriver(index);
//         //         //         if (provider.seconds == 60) {
//         //         //           provider.startTimer(context);
//         //         //         } else if (provider.seconds < 60) {
//         //         //           provider.stopTimer();
//         //         //           provider.startTimer(context);
//         //         //         } else if (provider.seconds == 0) {
//         //         //           showDialog(
//         //         //             context: context,
//         //         //             builder: (BuildContext context) {
//         //         //               return AlertDialogWidget(
//         //         //                 title: 'Время',
//         //         //                 function: () {
//         //         //                   provider.stopAudioPlayer();
//         //         //                   Navigator.of(context).pop();
//         //         //                 },
//         //         //               );
//         //         //             },
//         //         //           );
//         //         //         }

//         //         //         Navigator.of(context).pop();
//         //         //       },
//         //         //     );
//         //         //   },
//         //         // );
//         //       }),
//         // ),
//         );
//   }
// }
