import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobilePaymentMethodsView extends StatelessWidget {
  const MobilePaymentMethodsView({
    required this.user,
    Key? key,
  }) : super(key: key);

  final UserEntity user;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentMethodsCubit>(),
      child: BlocListener<PaymentMethodsCubit, PaymentMethodsState>(
        listener: (context, state) {
          if (state is AddedPaymentCardState) {
            BlocProvider.of<PaymentMethodsCubit>(context).getAllPaymentCards(
              userId: user.userID!,
            );
          }

          if (state is SelectedPaymentCardState) {
            BlocProvider.of<PaymentMethodsCubit>(context).getAllPaymentCards(
              userId: user.userID!,
            );
          }
        },
        child: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
          builder: (context, state) {
            if (state is LoadingPaymentMethodsState) {
              return const LoadingWidget();
            } else if (state is PaymentMethodsInitial) {
              return NestedMobilePaymentMethodsView(
                paymentCards: user.paymentMethods as List<PaymentCardEntity>,
                user: user,
              );
            } else if (state is LoadedAllPaymentCardsState) {
              return NestedMobilePaymentMethodsView(
                paymentCards: state.paymentCards,
                user: user,
              );
            } else if (state is PaymentCardFailureState) {
              //return MyErrorWidget('${state.exception}');
              return Text('11111');
            }
            return Text('22222');
          },
        ),
      ),
    );
  }
}

class NestedMobilePaymentMethodsView extends StatelessWidget {
  const NestedMobilePaymentMethodsView({
    required this.paymentCards,
    required this.user,
    super.key,
  });

  final List<PaymentCardEntity> paymentCards;
  final UserEntity user;

  static GlobalKey<FormState> paymentMethodFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final cardNumberController = TextEditingController();
    final expireDateController = TextEditingController();
    final cvvController = TextEditingController();

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: CustomAppBar(
          title: 'Payment methods',
          onPressedBack: () {
            Navigator.pop(context, true);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your payment cards',
                  style: AppTextStyles.black16,
                ),
                30.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //itemExtent: 140.h,
                  padding: REdgeInsets.all(0),
                  itemCount: paymentCards.length,
                  itemBuilder: (context, index) {
                    final card = paymentCards[index];
                    return BlocProvider.value(
                      value: BlocProvider.of<PaymentMethodsCubit>(context),
                      child: card.cvv == 123
                          ? MasterCardWidget(card: card)
                          : VisaCardWidget(card: card),
                    );

                    // return buildCard(
                    //   name: card.name!,
                    //   cardNumber: card.cardNumber!,
                    //   expireDate: card.expireDate!,
                    //   image: card.cardImage!,
                    //   isCheked: card.isCheked!,
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          width: double.infinity,
          height: 80,
          child: Padding(
            padding: REdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  sizedBoxHeight: 36.w,
                  sizedBoxWidth: 160.w,
                  isOutlinedButton: true,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  text: 'Back',
                ),
                CustomButton(
                  sizedBoxHeight: 36.w,
                  sizedBoxWidth: 160.w,
                  onPressed: () {
                    AppBottomSheet.showBottomSheet(
                      context: context,
                      title: 'Adding Shipping Address',
                      content: paymentMethodBottomSheetContent(
                        context: context,
                        formKey: paymentMethodFormKey,
                        nameController: nameController,
                        cardNumberController: cardNumberController,
                        expireDateController: expireDateController,
                        cvvController: cvvController,
                        // countryController: countryController,
                      ),
                    );
                  },
                  text: 'Add new address',
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     padding: const EdgeInsets.all(10),
        //     shape: const CircleBorder(),
        //     backgroundColor: Colors.black,
        //   ),
        //   onPressed: () {
        //     AppBottomSheet.showBottomSheet(
        //       context: context,
        //       title: 'Add new card',
        //       content: paymentMethodBottomSheetContent(
        //         context: context,
        //         formKey: paymentMethodFormKey,
        //         nameController: nameController,
        //         cardNumberController: cardNumberController,
        //         expireDateController: expireDateController,
        //         cvvController: cvvController,
        //         // countryController: countryController,
        //       ),
        //     );
        //     // BlocProvider.value(
        //     //   value: BlocProvider.of<PaymentMethodsCubit>(context),
        //     //   child: addCardBottomSheet(
        //     //     context,
        //     //     _paymentMethodFormKey,
        //     //     nameController,
        //     //     cardNumberController,
        //     //     expireDateController,
        //     //     cvvController,
        //     //   ),
        //     // );
        //   },
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }

  Widget paymentMethodBottomSheetContent({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController cardNumberController,
    required TextEditingController expireDateController,
    required TextEditingController cvvController,
  }) {
    bool _isChecked = true;

    return Form(
      key: formKey,
      child: Column(
        children: [
          // Center(
          //   child: Padding(
          //     padding: REdgeInsets.only(top: 36),
          //     child: Text(
          //       'Add new card',
          //       style: AppTextStyles.black18Bold,
          //     ),
          //   ),
          // ),
          // 33.verticalSpace,
          CustomTextFormField(
            controller: nameController,
            sizedBoxHeight: 64.h,
            sizedBoxWidth: double.infinity,
            labelText: 'Name on card',
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: cardNumberController,
            sizedBoxHeight: 64.h,
            sizedBoxWidth: double.infinity,
            labelText: 'Card number',
            suffixIcon: AppAssets.mastercard(width: 5.h, height: 5.h),
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: expireDateController,
            sizedBoxHeight: 64.h,
            sizedBoxWidth: double.infinity,
            labelText: 'Expire date',
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: cvvController,
            sizedBoxHeight: 64.h,
            sizedBoxWidth: double.infinity,
            labelText: 'cvv',
            suffixIcon: AppAssets.helperIcon(width: 0.2.h, height: 0.2.h),
          ),
          10.verticalSpace,
          CustomCheckBox(
            isCheckedCallback: (value) => _isChecked = value,
            isTitle: true,
            title: 'Set as default payment method',
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Checkbox(
          //       value: true,
          //       //onChanged: (value) => onClicked(),
          //       activeColor: Colors.black,
          //       onChanged: (value) {
          //         // this.value = value!;
          //         // setState(() {});
          //       },
          //     ),
          //     Text(
          //       'Set as default payment method',
          //       style: AppTextStyles.black14,
          //     ),
          //   ],
          // ),
          20.verticalSpace,
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<PaymentMethodsCubit>(context).addNewPaymentCard(
                  newCard: PaymentCardEntity(
                    userId: user.userID,
                    name: nameController.text,
                    cardNumber: cardNumberController.text,
                    expireDate: expireDateController.text,
                    cvv: int.parse(cvvController.text),
                    isCheked: _isChecked,
                  ),
                );
                nameController.clear();
                cardNumberController.clear();
                expireDateController.clear();
                cvvController.clear();
                Navigator.pop(context);
              }
              // log(nameController.text);
              // log(addressController.text);
              // log(cityController.text);
              // log(regionController.text);
              // log(countryController.text);
              //log('countryController.text');
            },
            text: 'ADD CARD',
          ),
          25.verticalSpace,
        ],
      ),
    );
  }

  addCardBottomSheet(
    BuildContext context,
    GlobalKey<FormState> _paymentMethodFormKey,
    TextEditingController nameController,
    TextEditingController cardNumberController,
    TextEditingController expireDateController,
    TextEditingController cvvController,
  ) {
    bool _isChecked = true;

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 550.h,
            child: Form(
              key: _paymentMethodFormKey,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: REdgeInsets.only(top: 36),
                      child: Text(
                        'Add new card',
                        style: AppTextStyles.black18Bold,
                      ),
                    ),
                  ),
                  33.verticalSpace,
                  CustomTextFormField(
                    controller: nameController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Name on card',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: cardNumberController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Card number',
                    suffixIcon: AppAssets.mastercard(width: 5.h, height: 5.h),
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: expireDateController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Expire date',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: cvvController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'cvv',
                    suffixIcon:
                        AppAssets.helperIcon(width: 0.2.h, height: 0.2.h),
                  ),
                  10.verticalSpace,
                  CustomCheckBox(
                    isCheckedCallback: (value) => _isChecked = value,
                    isTitle: true,
                    title: 'Set as default payment method',
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Checkbox(
                  //       value: true,
                  //       //onChanged: (value) => onClicked(),
                  //       activeColor: Colors.black,
                  //       onChanged: (value) {
                  //         // this.value = value!;
                  //         // setState(() {});
                  //       },
                  //     ),
                  //     Text(
                  //       'Set as default payment method',
                  //       style: AppTextStyles.black14,
                  //     ),
                  //   ],
                  // ),
                  20.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      if (_paymentMethodFormKey.currentState!.validate()) {
                        BlocProvider.of<PaymentMethodsCubit>(context)
                            .addNewPaymentCard(
                          newCard: PaymentCardEntity(
                            userId: user.userID,
                            name: nameController.text,
                            cardNumber: cardNumberController.text,
                            expireDate: expireDateController.text,
                            cvv: int.parse(cvvController.text),
                            isCheked: _isChecked,
                          ),
                        );
                        nameController.clear();
                        cardNumberController.clear();
                        expireDateController.clear();
                        cvvController.clear();
                        Navigator.pop(context);
                      }
                      // log(nameController.text);
                      // log(addressController.text);
                      // log(cityController.text);
                      // log(regionController.text);
                      // log(countryController.text);
                      //log('countryController.text');
                    },
                    text: 'ADD CARD',
                  ),
                  25.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget buildCard({
  //   required String name,
  //   required String cardNumber,
  //   required String expireDate,
  //   required String image,
  //   required bool isCheked,
  // }) {
  //   //padding: REdgeInsets.symmetric(vertical: 16),
  //   return Column(
  //     children: [
  //       Container(
  //         height: 216,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: isCheked ? Colors.black : AppColors.greyDarker2,
  //         ),
  //         child: Padding(
  //           padding: REdgeInsets.symmetric(horizontal: 24, vertical: 34),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               AppAssets.chipIcon(width: 32, height: 24),
  //               Text(cardNumber, style: AppTextStyles.white32),
  //               // Row(
  //               //   children: [
  //               //     Text('****  ****  ****  ', style: AppTextStyles.white32),
  //               //     90.verticalSpace,
  //               //     Text('3976', style: AppTextStyles.white32),
  //               //   ],
  //               // ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Text(
  //                         'Card Holder Name',
  //                         style: AppTextStyles.white10,
  //                       ),
  //                       5.verticalSpace,
  //                       Text(
  //                         name,
  //                         style: AppTextStyles.white14Bold,
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       Text(
  //                         'Expiry Date',
  //                         style: AppTextStyles.white10,
  //                       ),
  //                       5.verticalSpace,
  //                       Text(
  //                         expireDate,
  //                         style: AppTextStyles.white14Bold,
  //                       ),
  //                     ],
  //                   ),
  //                   //AppAssets.visa(width: 40, height: 32),
  //                   //image,
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       //image,
  //       // Card(
  //       //   clipBehavior: Clip.hardEdge,
  //       //   child: image,
  //       // ),
  //       // Container(
  //       //   height: 216.h,
  //       //   decoration: BoxDecoration(
  //       //     //color: Colors.redAccent,
  //       //     // image: DecorationImage(
  //       //     //   image: AppAssets.card_1(),
  //       //     //   fit: BoxFit.cover,
  //       //     // ),
  //       //     borderRadius: BorderRadius.circular(10.r),
  //       //   ),
  //       // ),
  //       13.verticalSpace,
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Checkbox(
  //             value: isCheked,
  //             //onChanged: (value) => onClicked(),
  //             activeColor: Colors.black,
  //             onChanged: (value) {
  //               // this.value = value!;
  //               // setState(() {});
  //             },
  //           ),
  //           Text('Use as default payment method', style: AppTextStyles.black14),
  //         ],
  //       ),
  //       25.verticalSpace,
  //     ],
  //   );
  // }
}
