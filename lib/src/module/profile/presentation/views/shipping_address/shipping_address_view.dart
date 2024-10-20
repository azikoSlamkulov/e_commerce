import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/entities/entities.dart';
import '../../logic/logic.dart';
import '../../widgets/widgets.dart';

class MobileShippingAddressView extends StatelessWidget {
  const MobileShippingAddressView({
    required this.user,
    //required this.isCheckout,
    //this.addressCallback,
    Key? key,
  }) : super(key: key);

  final UserEntity user;
  //final bool isCheckout;
  //final ValueSetter<ShippingAddressEntity>? addressCallback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShippingAddressCubit>(),
      child: BlocListener<ShippingAddressCubit, ShippingAddressState>(
        listener: (context, state) {
          if (state is AddedShippingAddresState) {
            BlocProvider.of<ShippingAddressCubit>(context).getShippingAddress(
              userId: user.userID!,
            );
          }

          if (state is UpdatedShippingAddresState) {
            BlocProvider.of<ShippingAddressCubit>(context).getShippingAddress(
              userId: user.userID!,
            );
          }
        },
        child: BlocBuilder<ShippingAddressCubit, ShippingAddressState>(
          builder: (context, state) {
            if (state is LoadingShippingAddresState) {
              return const LoadingWidget();
            } else if (state is InitialShippingAddresState) {
              return NestedShippingAddressView(
                addressList:
                    user.shippingAddresses as List<ShippingAddressEntity>,
                user: user,
                //isCheckout: isCheckout,
              );
            } else if (state is LoadedShippingAddressState) {
              return NestedShippingAddressView(
                addressList: state.addressList,
                user: user,
                //isCheckout: isCheckout,
                //addressCallback: addressCallback,
              );
            } else if (state is ShippingAddresFailureState) {
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

class NestedShippingAddressView extends StatelessWidget {
  final List<ShippingAddressEntity> addressList;
  final UserEntity user;
  //final bool isCheckout;
  //final ValueSetter<ShippingAddressEntity>? addressCallback;

  NestedShippingAddressView({
    super.key,
    required this.addressList,
    required this.user,
    //required this.isCheckout,
    //this.addressCallback,
  });

  final GlobalKey<FormState> _shippingAddressFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  // final regionController = TextEditingController();
  // final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // const String name = 'aaa';
    // const String address = 'ss';
    // const String city = 'dd';
    // const String region = 'ff';
    // const String country = 'ggg';
    // final nameController = TextEditingController()..text = name;
    // final addressController = TextEditingController()..text = address;
    // final cityController = TextEditingController()..text = city;
    // final regionController = TextEditingController()..text = region;
    // final countryController = TextEditingController()..text = country;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: CustomAppBar(
          title: 'Shipping Address',
          onPressedBack: () {
            Navigator.pop(context, true);
          },
        ),
        body: buildBodyShippngAddress(),
        //floatingActionButton: buildFloatingActionButtonShippngAddress(context),
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
                      content: shippingAddressBottomSheetContent(
                        context: context,
                        userId: user.userID!,
                        formKey: _shippingAddressFormKey,
                        nameController: nameController,
                        addressController: addressController,
                        cityController: cityController,
                        // regionController: regionController,
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
      ),
    );
  }

  Widget buildBodyShippngAddress() {
    return Padding(
      padding: REdgeInsets.all(16),
      child: ListView.builder(
        //itemExtent: 140.h,
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          final address = addressList[index];
          return BlocProvider.value(
            value: BlocProvider.of<ShippingAddressCubit>(context),
            child: ShippingAddressCardWidget(
              address: address,
              user: user,
              //addressCallback: addressCallback,
              // onTap: () {
              //   // BlocProvider.of<ShippingAddressCubit>(context)
              //   //     .selectDefaultShippingAddress(
              //   //   userId: address.userId!,
              //   //   addressId: address.id!,
              //   // );
              //   if (isCheckout) {
              //     context.read<ProfileBloc>().add(InitialUserInfoEvent());
              //     BlocProvider.of<ShippingAddressCubit>(context)
              //         .selectDefaultShippingAddress(
              //       userId: address.userId!,
              //       addressId: address.id!,
              //     );
              //     //Navigator.pop(context);
              //   }
              // },
            ),
          );
        },
      ),
    );
  }

  Widget buildFloatingActionButtonShippngAddress(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
      ),
      onPressed: () {
        AppBottomSheet.showBottomSheet(
          context: context,
          title: 'Adding Shipping Address',
          content: shippingAddressBottomSheetContent(
            context: context,
            userId: user.userID!,
            formKey: _shippingAddressFormKey,
            nameController: nameController,
            addressController: addressController,
            cityController: cityController,
            // regionController: regionController,
            // countryController: countryController,
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
