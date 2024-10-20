import 'dart:developer';

import 'package:e_commerce/src/module/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../logic/logic.dart';

class ShippingAddressCardWidget extends StatefulWidget {
  const ShippingAddressCardWidget({
    super.key,
    required this.address,
    required this.user,
    //this.addressCallback,

    //required this.onTap,
  });

  final ShippingAddressEntity address;
  final UserEntity user;
  //final ValueSetter<ShippingAddressEntity>? addressCallback;
  //final VoidCallback onTap;

  @override
  State<ShippingAddressCardWidget> createState() =>
      _ShippingAddressCardWidgetState();
}

class _ShippingAddressCardWidgetState extends State<ShippingAddressCardWidget> {
  final GlobalKey<FormState> _shippingAddressFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  // final regionController = TextEditingController();
  // final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.address.userName!,
                    style: AppTextStyles.black14Bold),
                //TODO Добавить способ изменения адреса
                InkWell(
                    onTap: () {
                      AppBottomSheet.showBottomSheet(
                        context: context,
                        title: 'Adding Shipping Address',
                        content: shippingAddressBottomSheetContent(
                          context: context,
                          userId: widget.user.userID!,
                          formKey: _shippingAddressFormKey,
                          nameController: nameController,
                          addressController: addressController,
                          cityController: cityController,
                          // regionController: regionController,
                          // countryController: countryController,
                        ),
                      );
                    },
                    child: Text('Edit', style: AppTextStyles.red14)),
              ],
            ),
            12.verticalSpace,
            Text(widget.address.address!, style: AppTextStyles.black14),
            5.verticalSpace,
            Text(
              '${widget.address.city},  ${widget.address.country}',
              style: AppTextStyles.black14,
            ),
            14.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: widget.address.isCheked,
                  //onChanged: (value) => onClicked(),
                  activeColor: Colors.black,
                  //onChanged: widget.onTap,
                  onChanged: (value) {
                    if (widget.address.isCheked == false) {
                      BlocProvider.of<ShippingAddressCubit>(context)
                          .selectDefaultShippingAddress(
                        userId: widget.address.userId!,
                        addressId: widget.address.id!,
                      );
                    }

                    // this.value = value!;
                    // setState(() {});
                  },
                ),
                Text('Use as the shipping address',
                    style: AppTextStyles.black14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget shippingAddressBottomSheetContent({
  required BuildContext context,
  required String userId,
  required GlobalKey<FormState> formKey,
  required TextEditingController nameController,
  required TextEditingController addressController,
  required TextEditingController cityController,
  // required TextEditingController regionController,
  // required TextEditingController countryController,
  // // required bool isEdit,
  // String? name,
  // String? address,
  // String? city,
  // String? region,
  // String? country,
}) {
  bool _isChecked = true;

  return Form(
    key: formKey,
    child: Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          sizedBoxHeight: 64.h,
          //sizedBoxWidth: double.infinity,
          initialValue: 'sss',
          labelText: 'Full name',
        ),
        10.verticalSpace,
        CustomTextFormField(
          controller: addressController,
          sizedBoxHeight: 64.h,
          //sizedBoxWidth: double.infinity,
          labelText: 'Address',
        ),
        10.verticalSpace,
        CustomTextFormField(
          controller: cityController,
          sizedBoxHeight: 64.h,
          sizedBoxWidth: double.infinity,
          labelText: 'City',
        ),
        // 10.verticalSpace,
        // CustomTextFormField(
        //   controller: regionController,
        //   sizedBoxHeight: 64.h,
        //   //sizedBoxWidth: double.infinity,
        //   labelText: 'Region',
        // ),
        // 10.verticalSpace,
        // CustomTextFormField(
        //   controller: countryController,
        //   sizedBoxHeight: 64.h,
        //   //sizedBoxWidth: double.infinity,
        //   labelText: 'Country',
        // ),
        10.verticalSpace,
        CustomCheckBox(
          isCheckedCallback: (value) => _isChecked = value,
          isTitle: true,
          title: 'Set as default shipping address',
        ),
        20.verticalSpace,
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<ShippingAddressCubit>(context).addShippingAddress(
                address: ShippingAddressEntity(
                  userId: userId,
                  userName: nameController.text,
                  address: addressController.text,
                  city: cityController.text,
                  country: 'Kyrgyzstan',
                  isCheked: _isChecked,
                ),
              );
              nameController.clear();
              addressController.clear();
              cityController.clear();
              //regionController.clear();
              //countryController.clear();
              Navigator.pop(context);
            }
            // log(nameController.text);
            // log(addressController.text);
            // log(cityController.text);
            //log(regionController.text);
            //log(countryController.text);
            //log(_isChecked.toString());
          },
          text: 'SAVE ADDRESS',
        ),
        25.verticalSpace,
      ],
    ),
  );
}
