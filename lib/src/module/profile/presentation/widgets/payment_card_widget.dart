import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/app_constants/app_constants.dart';
import '../../domain/domain.dart';
import '../logic/logic.dart';

class MasterCardWidget extends StatelessWidget {
  const MasterCardWidget({
    super.key,
    required this.card,
  });

  final PaymentCardEntity card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 216,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: card.isCheked! ? Colors.black : AppColors.greyDarker2,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAssets.chipIcon(width: 32, height: 24),
                Text(card.cardNumber!, style: AppTextStyles.white30),
                // Row(
                //   children: [
                //     Text('****  ****  ****  ', style: AppTextStyles.white32),
                //     90.verticalSpace,
                //     Text('3976', style: AppTextStyles.white32),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Holder Name',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          card.name!,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          card.expireDate!,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    AppAssets.mastercardWhite(width: 40, height: 32),
                    //image,
                  ],
                )
              ],
            ),
          ),
        ),
        //image,
        // Card(
        //   clipBehavior: Clip.hardEdge,
        //   child: image,
        // ),
        // Container(
        //   height: 216.h,
        //   decoration: BoxDecoration(
        //     //color: Colors.redAccent,
        //     // image: DecorationImage(
        //     //   image: AppAssets.card_1(),
        //     //   fit: BoxFit.cover,
        //     // ),
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),
        13.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: card.isCheked,
              //onChanged: (value) => onClicked(),
              activeColor: Colors.black,
              onChanged: (value) {
                if (card.isCheked == false) {
                  BlocProvider.of<PaymentMethodsCubit>(context)
                      .selectDefaultPaymentCard(
                    userId: card.userId!,
                    paymentCardId: card.id!,
                  );
                }
                // this.value = value!;
                // setState(() {});
              },
            ),
            Text('Use as default payment method', style: AppTextStyles.black14),
          ],
        ),
        25.verticalSpace,
      ],
    );
  }
}

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({
    super.key,
    required this.card,
  });

  final PaymentCardEntity card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 216,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: card.isCheked! ? Colors.black : AppColors.greyDarker2,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAssets.chipIcon(width: 32, height: 24),
                Text(card.cardNumber!, style: AppTextStyles.white30),
                // Row(
                //   children: [
                //     Text('****  ****  ****  ', style: AppTextStyles.white32),
                //     90.verticalSpace,
                //     Text('3976', style: AppTextStyles.white32),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Holder Name',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          card.name!,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          card.expireDate!,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    AppAssets.visa(width: 40, height: 32),
                    //image,
                  ],
                )
              ],
            ),
          ),
        ),
        //image,
        // Card(
        //   clipBehavior: Clip.hardEdge,
        //   child: image,
        // ),
        // Container(
        //   height: 216.h,
        //   decoration: BoxDecoration(
        //     //color: Colors.redAccent,
        //     // image: DecorationImage(
        //     //   image: AppAssets.card_1(),
        //     //   fit: BoxFit.cover,
        //     // ),
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),
        13.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: card.isCheked,
              //onChanged: (value) => onClicked(),
              activeColor: Colors.black,
              onChanged: (value) {
                if (card.isCheked == false) {
                  BlocProvider.of<PaymentMethodsCubit>(context)
                      .selectDefaultPaymentCard(
                    userId: card.userId!,
                    paymentCardId: card.id!,
                  );
                }

                // this.value = value!;
                // setState(() {});
              },
            ),
            Text('Use as default payment method', style: AppTextStyles.black14),
          ],
        ),
        25.verticalSpace,
      ],
    );
  }
}
