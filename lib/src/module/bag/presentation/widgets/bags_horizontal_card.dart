import 'dart:developer';

import 'package:e_commerce/src/module/bag/bag.dart';
import 'package:e_commerce/src/module/bag/presentation/logic/counter/counter.dart';
import 'package:e_commerce/src/module/bag/presentation/widgets/counter_widget.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/bag_entity.dart';

class BagHorizontalCard extends StatefulWidget {
  const BagHorizontalCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final BagEntity product;
  final VoidCallback onTap;

  @override
  State<BagHorizontalCard> createState() => _BagHorizontalCardState();
}

class _BagHorizontalCardState extends State<BagHorizontalCard> {
  @override
  void initState() {
    _price = widget.product.price!;
    super.initState();
  }

  int _quantity = 1;
  double? _price;

  void increment() => setState(() {
        _quantity++;
        _price = _price! + widget.product.price!;
      });

  void decrement() {
    setState(() {
      if (_quantity > 1) {
        setState(() {
          _quantity--;
          _price = _price! - widget.product.price!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        //color: Colors.blue,
        clipBehavior: Clip.hardEdge,
        //elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        margin: REdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
        //color: Colors.redAccent.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Image
            Container(
              height: 155.h,
              width: 135.h,
              decoration: BoxDecoration(
                //color: Colors.greenAccent,
                image: DecorationImage(
                  image: NetworkImage(widget.product.productImgUrl!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
            ),
            // Image.network(
            //   product.photoURL!,
            //   fit: BoxFit.fill,
            //   width: 140.h,
            //   height: 155.h,
            // ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            11.verticalSpace,

                            ///Item
                            Text(
                              widget.product.name!,
                              style: AppTextStyles.black16Bold,
                            ),
                            10.verticalSpace,

                            /// Color and size
                            Row(
                              children: [
                                Text(
                                  'Color: ',
                                  style: AppTextStyles.grey11,
                                ),
                                Text(
                                  widget.product.color!,
                                  style: AppTextStyles.black11,
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Size: ',
                                  style: AppTextStyles.grey11,
                                ),
                                Text(
                                  widget.product.size!,
                                  style: AppTextStyles.black11,
                                ),
                              ],
                            ),
                          ],
                        ),
                        popUpMenuBtn(),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCounter(),

                        ///Prise
                        Text(
                          '$_price\$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // BlocBuilder<CounterCubit, CounterState>(
                        //   builder: (context, state) {
                        //     final price = widget.product.price! * _count;
                        //     return Text(
                        //       '$price\$',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 14.sp,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     );
                        //   },
                        // ),
                        20.horizontalSpace,
                      ],
                    ),
                    11.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCounter() {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: 36.h,
            width: 36.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide.none,
                ),
                //primary: bgColor,
                backgroundColor: AppColors.white,
              ),
              child: const Icon(
                Icons.remove,
                color: AppColors.black26,
              ),
              onPressed: () => decrement(),
            ),
          ),
          16.horizontalSpace,
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '$_quantity',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              );
            },
          ),
          16.horizontalSpace,
          SizedBox(
            height: 36.h,
            width: 36.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide.none,
                ),
                //primary: bgColor,
                backgroundColor: AppColors.white,
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.black26,
              ),
              onPressed: () => increment(),
            ),
          ),
        ],
      ),
    );
  }

  popUpMenuBtn() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        size: 25.h,
        color: AppColors.grey,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: AppTextStyles.black11,
            ),
          );
        }).toList();
      },
    );
  }

  choiceAction(String choice) {
    if (choice == Constants.firstItem) {
      print('I First Item');
    } else if (choice == Constants.secondItem) {
      BlocProvider.of<BagBloc>(context).add(
        DeleteProductFromCartEvent(
          widget.product.userID!,
          widget.product.productID!,
        ),
      );
      setState(() {});
      // log(widget.product.userID!);
      // log(widget.product.productID!);
      //print('I Second Item');
    }
  }
}

class Constants {
  static const String firstItem = 'Add to favorites';
  static const String secondItem = 'Delete from the list';

  static const List<String> choices = <String>[
    firstItem,
    secondItem,
  ];
}



// buildCounter(BuildContext context) {
//   return Expanded(
//     child: Row(
//       children: [
//         SizedBox(
//           height: 36.h,
//           width: 36.h,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 side: BorderSide.none,
//               ),
//               //primary: bgColor,
//               backgroundColor: AppColors.white,
//             ),
//             child: const Icon(
//               Icons.remove,
//               color: AppColors.black26,
//             ),
//             onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
//           ),
//         ),
//         16.horizontalSpace,
//         BlocBuilder<CounterCubit, CounterState>(
//           builder: (context, state) {
//             return Text(
//               state.count.toString(),
//               style: const TextStyle(color: Colors.black, fontSize: 14),
//             );
//           },
//         ),
//         16.horizontalSpace,
//         SizedBox(
//           height: 36.h,
//           width: 36.h,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 side: BorderSide.none,
//               ),
//               //primary: bgColor,
//               backgroundColor: AppColors.white,
//             ),
//             child: const Icon(
//               Icons.add,
//               color: AppColors.black26,
//             ),
//             onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
//           ),
//         ),
//       ],
//     ),
//   );
// }
