// import 'package:e_commerce/lib.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BagHorizontalCard2 extends StatefulWidget {
//   const BagHorizontalCard2({
//     super.key,
//     required this.product,
//     required this.onTap,
//     this.callback,
//   });

//   final BagEntity product;
//   final VoidCallback onTap;
//   final ValueSetter<double>? callback;

//   @override
//   State<BagHorizontalCard2> createState() => _BagHorizontalCard2State();
// }

// class _BagHorizontalCard2State extends State<BagHorizontalCard2> {
//   // @override
//   // void initState() {
//   //   _price = widget.product.pricePerUnit!;
//   //   super.initState();
//   // }

//   // int _quantity = 1;
//   // double? _price;

//   // void increment() => setState(() {
//   //       _quantity++;
//   //       _price = widget.product.pricePerUnit! * _quantity;
//   //       widget.callback!(_price!);
//   //     });

//   // void decrement() {
//   //   setState(() {
//   //     if (_quantity > 1) {
//   //       setState(() {
//   //         _quantity--;
//   //         _price = widget.product.pricePerUnit! * _quantity;
//   //       });
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Card(
//           color: Colors.white,
//           clipBehavior: Clip.hardEdge,
//           //elevation: 10,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0.r),
//           ),
//           //margin: REdgeInsets.only(bottom: 16),
//           //color: Colors.redAccent.shade100,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               /// Image
//               CachedNetworkImageWidget(
//                 imageUrl: widget.product.productImgUrl!,
//                 height: 131.h,
//                 width: 135.w,
//               ),
//               // Container(
//               //   height: 130.h,
//               //   width: 135.h,
//               //   decoration: BoxDecoration(
//               //     //color: Colors.greenAccent,
//               //     image: DecorationImage(
//               //       image: NetworkImage(widget.product.productImgUrl!),
//               //       fit: BoxFit.cover,
//               //     ),
//               //     borderRadius: BorderRadius.only(
//               //       topLeft: Radius.circular(10.r),
//               //       bottomLeft: Radius.circular(10.r),
//               //     ),
//               //   ),
//               // ),
//               // Image.network(
//               //   product.photoURL!,
//               //   fit: BoxFit.fill,
//               //   width: 140.h,
//               //   height: 155.h,
//               // ),
//               Expanded(
//                 child: Padding(
//                   padding: REdgeInsets.all(11),
//                   child: SizedBox(
//                     height: 100.h,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           //mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.product.name!,
//                               style: AppTextStyles.black16Bold,
//                             ),
//                             //10.verticalSpace,

//                             /// Color and size
//                             Row(
//                               children: [
//                                 Text(
//                                   'Color: ',
//                                   style: AppTextStyles.grey11,
//                                 ),
//                                 Text(
//                                   widget.product.color!,
//                                   style: AppTextStyles.black11,
//                                 ),
//                                 10.horizontalSpace,
//                                 Text(
//                                   'Size: ',
//                                   style: AppTextStyles.grey11,
//                                 ),
//                                 Text(
//                                   widget.product.size!,
//                                   style: AppTextStyles.black11,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),

//                         //10.verticalSpace,
//                         BlocBuilder<CounterCubit, CounterState>(
//                           builder: (context, state) {
//                             if (state is CounterNewState) {
//                               return Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   buildCounter(
//                                     widget.product.pricePerUnit!,
//                                     state.quantity,
//                                   ),

//                                   ///Prise
//                                   Text(
//                                     '${state.price}\$',
//                                     //'$_price\$',
//                                     // '${widget.product.cardTotalPrice}\$',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   // BlocBuilder<CounterCubit, CounterState>(
//                                   //   builder: (context, state) {
//                                   //     final price = widget.product.price! * _count;
//                                   //     return Text(
//                                   //       '$price\$',
//                                   //       style: TextStyle(
//                                   //         color: Colors.black,
//                                   //         fontSize: 14.sp,
//                                   //         fontWeight: FontWeight.bold,
//                                   //       ),
//                                   //     );
//                                   //   },
//                                   // ),
//                                   //20.horizontalSpace,
//                                 ],
//                               );
//                             }
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 buildCounter(
//                                   widget.product.pricePerUnit!,
//                                   1,
//                                 ),

//                                 ///Prise
//                                 Text(
//                                   '${widget.product.pricePerUnit!}\$',
//                                   //'$_price\$',
//                                   // '${widget.product.cardTotalPrice}\$',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 // BlocBuilder<CounterCubit, CounterState>(
//                                 //   builder: (context, state) {
//                                 //     final price = widget.product.price! * _count;
//                                 //     return Text(
//                                 //       '$price\$',
//                                 //       style: TextStyle(
//                                 //         color: Colors.black,
//                                 //         fontSize: 14.sp,
//                                 //         fontWeight: FontWeight.bold,
//                                 //       ),
//                                 //     );
//                                 //   },
//                                 // ),
//                                 //20.horizontalSpace,
//                               ],
//                             );
//                           },
//                         ),
//                         //11.verticalSpace,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 5.h,
//           right: 5.h,
//           child: popUpMenuBtn(),
//         ),
//       ],
//     );
//   }

//   buildCounter(double pricePerUnit, int quantity) {
//     return Expanded(
//       child: Row(
//         children: [
//           /// Decrement
//           SizedBox(
//             height: 36.h,
//             width: 36.h,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   side: BorderSide.none,
//                 ),
//                 //primary: bgColor,
//                 backgroundColor: AppColors.white,
//               ),
//               child: const Icon(
//                 Icons.remove,
//                 color: AppColors.black26,
//               ),
//               //onPressed: () => decrement(),
//               onPressed: () {
//                 BlocProvider.of<CounterCubit>(context).decrement(pricePerUnit);
//                 //decrement();
//                 // BlocProvider.of<BagBloc>(context).add(
//                 //   DecrementQuantityEvent(
//                 //     widget.product,
//                 //   ),
//                 // );
//                 // BlocProvider.of<BagBloc>(context).add(
//                 //   GetAllProductFromCartEvent(),
//                 // );
//               },
//             ),
//           ),
//           16.horizontalSpace,

//           /// Value
//           Text(
//             '$quantity',
//             style: const TextStyle(color: Colors.black, fontSize: 14),
//           ),
//           // BlocBuilder<BagBloc, BagState>(
//           //   builder: (context, state) {
//           //     return Text(
//           //       '${widget.product.quantity}',
//           //       style: const TextStyle(color: Colors.black, fontSize: 14),
//           //     );
//           //   },
//           // ),
//           16.horizontalSpace,

//           /// Increment
//           SizedBox(
//             height: 36.h,
//             width: 36.h,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   side: BorderSide.none,
//                 ),
//                 //primary: bgColor,
//                 backgroundColor: AppColors.white,
//               ),
//               child: const Icon(
//                 Icons.add,
//                 color: AppColors.black26,
//               ),
//               //onPressed: () => increment(),
//               onPressed: () {
//                 BlocProvider.of<CounterCubit>(context).decrement(pricePerUnit);
//                 //increment();
//                 // BlocProvider.of<BagBloc>(context).add(
//                 //   IncrementQuantityEvent(
//                 //     widget.product,
//                 //   ),
//                 // );
//                 // BlocProvider.of<BagBloc>(context).add(
//                 //   GetAllProductFromCartEvent(),
//                 // );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   popUpMenuBtn() {
//     return PopupMenuButton<String>(
//       icon: Icon(
//         Icons.more_vert,
//         size: 25.h,
//         color: AppColors.grey,
//       ),
//       onSelected: choiceAction,
//       itemBuilder: (BuildContext context) {
//         return Constants.choices.map((String choice) {
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

//   choiceAction(String choice) {
//     if (choice == Constants.firstItem) {
//       print('I First Item');
//     } else if (choice == Constants.secondItem) {
//       BlocProvider.of<BagBloc>(context).add(
//         DeleteProductFromCartEvent(widget.product.productID!),
//       );
//       setState(() {});
//       // log(widget.product.userID!);
//       // log(widget.product.productID!);
//       //print('I Second Item');
//     }
//   }
// }

// class Constants {
//   static const String firstItem = 'Add to favorites';
//   static const String secondItem = 'Delete from the list';

//   static const List<String> choices = <String>[
//     firstItem,
//     secondItem,
//   ];
// }



// // buildCounter(BuildContext context) {
// //   return Expanded(
// //     child: Row(
// //       children: [
// //         SizedBox(
// //           height: 36.h,
// //           width: 36.h,
// //           child: ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //               padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(50),
// //                 side: BorderSide.none,
// //               ),
// //               //primary: bgColor,
// //               backgroundColor: AppColors.white,
// //             ),
// //             child: const Icon(
// //               Icons.remove,
// //               color: AppColors.black26,
// //             ),
// //             onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
// //           ),
// //         ),
// //         16.horizontalSpace,
// //         BlocBuilder<CounterCubit, CounterState>(
// //           builder: (context, state) {
// //             return Text(
// //               state.count.toString(),
// //               style: const TextStyle(color: Colors.black, fontSize: 14),
// //             );
// //           },
// //         ),
// //         16.horizontalSpace,
// //         SizedBox(
// //           height: 36.h,
// //           width: 36.h,
// //           child: ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //               padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(50),
// //                 side: BorderSide.none,
// //               ),
// //               //primary: bgColor,
// //               backgroundColor: AppColors.white,
// //             ),
// //             child: const Icon(
// //               Icons.add,
// //               color: AppColors.black26,
// //             ),
// //             onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
