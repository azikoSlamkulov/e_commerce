import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagHorizontalCard extends StatefulWidget {
  const BagHorizontalCard({
    super.key,
    required this.product,
    //required this.productCallback,
  });

  final BagEntity product;
  //final ValueSetter<BagEntity> productCallback;

  @override
  State<BagHorizontalCard> createState() => _BagHorizontalCardState();
}

class _BagHorizontalCardState extends State<BagHorizontalCard> {
  double totalCardAmount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CounterCubit>()
        ..getPrise(widget.product.pricePerUnit!, widget.product.quantity!),
      child: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          context.read<BagBloc>().add(
                AddNewQuantityEvent(
                  BagEntity(
                    productID: widget.product.productID,
                    name: widget.product.name,
                    color: widget.product.color,
                    size: widget.product.size,
                    pricePerUnit: widget.product.pricePerUnit,
                    cardTotalPrice: state.cardTotalPrice,
                    quantity: state.quantity,
                    productImgUrl: widget.product.productImgUrl,
                  ),
                ),
              );
        },
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Image
                  CachedNetworkImageWidget(
                    imageUrl: widget.product.productImgUrl!,
                    height: 131.h,
                    width: 135.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.all(11),
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.name!,
                                  style: AppTextStyles.black16Bold,
                                ),
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
                            BlocBuilder<CounterCubit, CounterState>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          /// Decrement
                                          SizedBox(
                                            height: 36.h,
                                            width: 36.h,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  side: BorderSide.none,
                                                ),
                                                backgroundColor:
                                                    AppColors.white,
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColors.black26,
                                              ),
                                              onPressed: () =>
                                                  BlocProvider.of<CounterCubit>(
                                                          context)
                                                      .decrement(),
                                            ),
                                          ),
                                          16.horizontalSpace,

                                          /// Quantity
                                          Text(
                                            '${widget.product.quantity}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          ),
                                          16.horizontalSpace,

                                          /// Increment
                                          SizedBox(
                                            height: 36.h,
                                            width: 36.h,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  side: BorderSide.none,
                                                ),
                                                backgroundColor:
                                                    AppColors.white,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.black26,
                                              ),
                                              onPressed: () =>
                                                  BlocProvider.of<CounterCubit>(
                                                          context)
                                                      .increment(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Prise
                                    Text(
                                      '${widget.product.cardTotalPrice}\$',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5.h,
              right: 5.h,
              child: popUpMenuBtn(),
            ),
          ],
        ),
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
        DeleteProductFromCartEvent(widget.product.productID!),
      );
      setState(() {});
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
