import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileShippingAddressView extends StatelessWidget {
  const MobileShippingAddressView({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    String userID;
    return BlocProvider(
      create: (context) => sl<ShippingAddressCubit>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            userID = state.user.userID!;
            BlocProvider.of<ShippingAddressCubit>(context).getShippingAddress(
              userId: userID,
            );

            return BlocListener<ShippingAddressCubit, ShippingAddressState>(
              listener: (context, state) {
                if (state is AddedShippingAddresState) {
                  BlocProvider.of<ShippingAddressCubit>(context)
                      .getShippingAddress(
                    userId: userID,
                  );
                }
              },
              child: BlocBuilder<ShippingAddressCubit, ShippingAddressState>(
                builder: (context, state) {
                  if (state is LoadingShippingAddresState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedShippingAddressState) {
                    return NestedShippingAddressView(
                      addressList: state.addressList,
                      userId: userID,
                    );
                  } else if (state is FailureState) {
                    //return MyErrorWidget('${state.exception}');
                    return Text('11111');
                  }
                  return Text('22222');
                },
              ),
            );
          } else if (state is UnAuthenticatedState) {
            return AuthCheckView();
          }
          return const Center(
            child: Text(
              'Some Error',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}

class NestedShippingAddressView extends StatelessWidget {
  final List<AddressEntity> addressList;
  final String userId;

  NestedShippingAddressView({
    super.key,
    required this.addressList,
    required this.userId,
  });

  // List<AddressEntity> addressList = [
  //   AddressEntity(
  //     id: '1',
  //     name: 'Jane Doe',
  //     address: 'Toktogul, 45',
  //     city: 'Bishkek',
  //     // region: '',
  //     // country: 'Kyrgyzstan',
  //     isCheked: true,
  //   ),
  //   AddressEntity(
  //     id: '2',
  //     name: 'Jane Doe',
  //     address: 'Toktogul, 45',
  //     city: 'Bishkek',
  //     // region: '',
  //     // country: 'Kyrgyzstan',
  //     isCheked: false,
  //   ),
  //   AddressEntity(
  //     id: '3',
  //     name: 'Jane Doe',
  //     address: 'Toktogul, 45',
  //     city: 'Bishkek',
  //     // region: '',
  //     // country: 'Kyrgyzstan',
  //     isCheked: false,
  //   ),
  // ];

  // final String _text = 'aaa';
  final GlobalKey<FormState> _shippingAddressFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String name = 'aaa';
    const String address = 'ss';
    const String city = 'dd';
    const String region = 'ff';
    const String country = 'ggg';
    // final nameController = TextEditingController()..text = name;
    // final addressController = TextEditingController()..text = address;
    // final cityController = TextEditingController()..text = city;
    // final regionController = TextEditingController()..text = region;
    // final countryController = TextEditingController()..text = country;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: 'Shipping Address'),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: ListView.builder(
          //itemExtent: 140.h,
          itemCount: addressList.length,
          itemBuilder: (context, index) {
            final address = addressList[index];
            return Card(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(address.name!, style: AppTextStyles.black14Bold),
                        InkWell(
                            onTap: () {
                              AppBottomSheet.showBottomSheet(
                                context: context,
                                title: 'Adding Shipping Address',
                                content: buildBottomSheetContent(
                                  context: context,
                                  formKey: _shippingAddressFormKey,
                                  // nameController: nameController,
                                  // addressController: addressController,
                                  // cityController: cityController,
                                  // regionController: regionController,
                                  // countryController: countryController,
                                ),
                              );
                            },
                            child: Text('Edit', style: AppTextStyles.red14)),
                      ],
                    ),
                    12.verticalSpace,
                    Text(address.address!, style: AppTextStyles.black14),
                    5.verticalSpace,
                    Text(
                      '${address.city},  Kyrgyzstan',
                      style: AppTextStyles.black14,
                    ),
                    14.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: address.isCheked,
                          //onChanged: (value) => onClicked(),
                          activeColor: Colors.black,
                          onChanged: (value) {
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
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          AppBottomSheet.showBottomSheet(
            context: context,
            title: 'Adding Shipping Address',
            content: buildBottomSheetContent(
              context: context,
              formKey: _shippingAddressFormKey,
              // nameController: nameController,
              // addressController: addressController,
              // cityController: cityController,
              // regionController: regionController,
              // countryController: countryController,
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildBottomSheetContent({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    // required TextEditingController nameController,
    // required TextEditingController addressController,
    // required TextEditingController cityController,
    // required TextEditingController regionController,
    // required TextEditingController countryController,
    // required bool isEdit,
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
            title: 'Use as the shipping address',
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     CustomCheckBox(
          //       isCheckedCallback: (value) => _isChecked = value,
          //     ),
          //     Text(
          //       'Use as the shipping address',
          //       style: AppTextStyles.black14,
          //     ),
          //   ],
          // ),
          20.verticalSpace,
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ShippingAddressCubit>(context)
                    .addShippingAddress(
                  address: AddressEntity(
                    userId: userId,
                    name: nameController.text,
                    address: addressController.text,
                    city: cityController.text,
                    isCheked: _isChecked,
                  ),
                );
                // log(nameController.text);
                // log(addressController.text);
                // log(cityController.text);
                //log(regionController.text);
                //log(countryController.text);
                //log(_isChecked.toString());
                nameController.clear();
                addressController.clear();
                cityController.clear();
                //regionController.clear();
                //countryController.clear();
                Navigator.pop(context);
              }
            },
            text: 'SAVE ADDRESS',
          ),
          25.verticalSpace,
        ],
      ),
    );
  }
}
