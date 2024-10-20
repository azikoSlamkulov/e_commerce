import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCheckoutView extends StatelessWidget {
  const MobileCheckoutView({
    required this.allProducts,
    required this.totalAmount,
    required this.userId,
    Key? key,
  }) : super(key: key);

  final List<BagEntity> allProducts;
  final String totalAmount;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BagBloc, BagState>(
      listener: (context, state) {
        if (state is AddedOrderState) {
          BlocProvider.of<BagBloc>(context).add(
            ClearProductCartEvent(),
          );
        }
        if (state is ClearedProductCartState) {
          //context.goNamed(AppPage.success.toName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SuccessViewSecond(),
            ),
          );
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                sl<ProfileBloc>()..add(GetUserInfoEvent(userId)),
          ),
        ],
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileInitial) {
              BlocProvider.of<ProfileBloc>(context)
                  .add(GetUserInfoEvent(userId));
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is LoadingProfileState) {
                return const LoadingWidget();
              } else if (state is LoadedUserProfileState) {
                final ShippingAddressEntity shippingAddress;
                final PaymentCardEntity paymentCard;
                shippingAddress = state.user.shippingAddresses!.isNotEmpty
                    ? state.user.shippingAddresses!
                        .firstWhere((e) => e.isCheked == true)
                    : ShippingAddressEntity();
                paymentCard = state.user.paymentMethods!.isNotEmpty
                    ? state.user.paymentMethods!
                        .firstWhere((e) => e.isCheked == true)
                    : PaymentCardEntity();

                return NestedCheckoutView(
                  allProducts: allProducts,
                  totalAmount: double.parse(totalAmount),
                  user: state.user,
                  shippingAddress: shippingAddress,
                  paymentCard: paymentCard,
                );
              }
              return const Center(
                  child: Text(
                'Some Error',
                style: TextStyle(color: Colors.black),
              ));
            },
          ),
        ),
      ),
    );
  }
}

class NestedCheckoutView extends StatefulWidget {
  final List<BagEntity> allProducts;
  final double totalAmount;
  final UserEntity user;
  final ShippingAddressEntity shippingAddress;
  final PaymentCardEntity paymentCard;

  const NestedCheckoutView({
    super.key,
    required this.allProducts,
    required this.totalAmount,
    required this.user,
    required this.shippingAddress,
    required this.paymentCard,
  });

  @override
  State<NestedCheckoutView> createState() => _NestedCheckoutViewState();
}

class _NestedCheckoutViewState extends State<NestedCheckoutView> {
  ShippingAddressEntity getShippingAddress(
      List<ShippingAddressEntity> addresses) {
    return addresses.firstWhere((e) => e.isCheked == true);
  }

  PaymentCardEntity getPaymentCard(List<PaymentCardEntity> cards) {
    return cards.firstWhere((e) => e.isCheked == true);
  }

  bool isFinished = false;
  ShippingAddressEntity newaddress = ShippingAddressEntity();

  DelveryEntity selectedDeliveryMethod = DelveryEntity(
    id: 1,
    name: 'FedEx',
    days: 3,
    price: 15,
    image: AppAssets.fedex(width: 60.h, height: 37.h),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Checkout',
        showSearchBtn: false,
        showBackBtn: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20), // 36
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Shipping address
            const CheckoutTitleWidget(text: 'Shipping address'),
            20.verticalSpace,
            BlocProvider.value(
              value: BlocProvider.of<ProfileBloc>(context),
              child: CheckoutShippingAddressCardWidget(
                user: widget.user,
                shippingAddress: widget.shippingAddress,
                //shippingAddress: ShippingAddressEntity(),
              ),
            ),
            57.verticalSpace,

            /// Payment method
            BlocProvider.value(
              value: BlocProvider.of<ProfileBloc>(context),
              child: CheckoutPaymentCardWidget(
                user: widget.user,
                paymentCard: widget.paymentCard,
                //paymentCard: PaymentCardEntity(),
              ),
            ),
            57.verticalSpace,

            /// Delivery method
            const CheckoutTitleWidget(text: 'Delivery method'),
            21.verticalSpace,
            DeliveryCardToggleButton(
              selectedItemsCallback: (value) => setState(() {
                selectedDeliveryMethod = value;
              }),
            ),
            40.verticalSpace,

            /// Order info
            buildOrder(text: 'Order:', value: widget.totalAmount.toInt()),
            14.verticalSpace,
            buildOrder(text: 'Delivery:', value: selectedDeliveryMethod.price!),
            14.verticalSpace,
            buildOrder(
                text: 'Summary:',
                value: (widget.totalAmount + selectedDeliveryMethod.price!)
                    .toInt()),
            40.verticalSpace,

            /// Button
            CustomButton(
              onPressed: () => BlocProvider.of<BagBloc>(context).add(
                SetOrderEvent(
                  OrderEntity(
                    orderNumber: 1947034,
                    userID: widget.user.userID,
                    userName: widget.user.name,
                    trackingNumber: 'IW3475453455',
                    //status: 'delivered',
                    items: widget.allProducts,
                    // shippingAddress: getShippingAddress(
                    //   widget.user.shippingAddresses!
                    //       as List<ShippingAddressEntity>,
                    // ),
                    shippingAddress: widget.shippingAddress,
                    // paymentMethod: getPaymentCard(
                    //   widget.user.paymentMethods! as List<PaymentCardEntity>,
                    // ),
                    paymentMethod: widget.paymentCard,
                    deliveryMethod:
                        '${selectedDeliveryMethod.name}, ${selectedDeliveryMethod.days} days, ${selectedDeliveryMethod.price}',
                    discount: '10%, Personal promo code',
                    totalAmount:
                        (widget.totalAmount + selectedDeliveryMethod.price!)
                            .toInt(),
                  ),
                ),
              ),
              text: 'SUBMIT ORDER',
            ),
          ],
        ),
      ),
    );
  }

  buildOrder({required String text, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.grey16,
        ),
        Text(
          '$value\$',
          style: AppTextStyles.black16Bold,
        ),
      ],
    );
  }
}
