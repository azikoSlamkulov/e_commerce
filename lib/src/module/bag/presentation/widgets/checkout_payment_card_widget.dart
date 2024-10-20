import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/app_constants/app_constants.dart';
import '../../../auth/domain/domain.dart';
import '../../../profile/profile.dart';
import 'widgets.dart';

class CheckoutPaymentCardWidget extends StatefulWidget {
  const CheckoutPaymentCardWidget(
      {required this.user, required this.paymentCard, super.key});

  final UserEntity user;
  final PaymentCardEntity paymentCard;

  @override
  State<CheckoutPaymentCardWidget> createState() =>
      _CheckoutPaymentCardWidgetState();
}

class _CheckoutPaymentCardWidgetState extends State<CheckoutPaymentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.paymentCard != PaymentCardEntity()
        ? Column(
            children: [
              Padding(
                padding: REdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CheckoutTitleWidget(text: 'Payment'),
                    InkWell(
                      onTap: () async {
                        final isTrue = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobilePaymentMethodsView(
                              user: widget.user,
                              //isCheckout: true,
                            ),
                          ),
                        );
                        if (isTrue) {
                          setState(() {
                            context.read<ProfileBloc>().add(
                                  GetUserInfoEvent(widget.user.userID!),
                                );
                          });
                        }
                      },
                      child: Text('Change', style: AppTextStyles.red14),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 38.h,
                    width: 64.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: AppAssets.mastercard(width: 64.h, height: 38.h),
                  ),
                  17.horizontalSpace,
                  // Text('***** ***** ***** ***3947', style: AppTextStyles.black14),
                  Text('${widget.paymentCard.cardNumber}',
                      style: AppTextStyles.black14),
                ],
              ),
            ],
          )
        : SizedBox(
            height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: REdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CheckoutTitleWidget(text: 'Payment'),
                      InkWell(
                        onTap: () async {
                          final isTrue = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MobilePaymentMethodsView(
                                user: widget.user,
                                //isCheckout: true,
                              ),
                            ),
                          );
                          if (isTrue) {
                            setState(() {
                              context.read<ProfileBloc>().add(
                                    GetUserInfoEvent(widget.user.userID!),
                                  );
                            });
                          }
                        },
                        child: Text('Change', style: AppTextStyles.red14),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Платежная карта не выбрана!',
                  style: AppTextStyles.black14Bold,
                ),
              ],
            ),
          );
  }
}
