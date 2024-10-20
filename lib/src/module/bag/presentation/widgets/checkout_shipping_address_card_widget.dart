import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../profile/domain/domain.dart';
import '../../../profile/presentation/logic/logic.dart';
import '../../../profile/presentation/views/shipping_address/shipping_address.dart';

class CheckoutShippingAddressCardWidget extends StatefulWidget {
  const CheckoutShippingAddressCardWidget({
    required this.user,
    required this.shippingAddress,
    super.key,
  });

  final UserEntity user;
  final ShippingAddressEntity shippingAddress;

  @override
  State<CheckoutShippingAddressCardWidget> createState() =>
      _CheckoutShippingAddressCardWidgetState();
}

class _CheckoutShippingAddressCardWidgetState
    extends State<CheckoutShippingAddressCardWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.shippingAddress != ShippingAddressEntity()
        ? Card(
            color: Colors.white,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.shippingAddress.userName!,
                          style: AppTextStyles.black14Bold),
                      InkWell(
                        onTap: () async {
                          final isTrue = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MobileShippingAddressView(
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
                  12.verticalSpace,
                  Text(widget.shippingAddress.address!,
                      style: AppTextStyles.black14),
                  5.verticalSpace,
                  Text(
                    '${widget.shippingAddress.city}, ${widget.shippingAddress.country}',
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
            ),
          )
        : Card(
            color: Colors.white,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: SizedBox(
                height: 70.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Адрес доставки не выбран!',
                      style: AppTextStyles.black14Bold,
                    ),
                    10.verticalSpace,
                    InkWell(
                      onTap: () async {
                        final isTrue = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileShippingAddressView(
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
            ),
          );
  }
}
