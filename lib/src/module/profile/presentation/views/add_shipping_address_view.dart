import 'dart:developer';

import 'package:e_commerce/lib.dart';

class MobileAddShippingAddressView extends StatelessWidget {
  const MobileAddShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final regionController = TextEditingController();
    final countryController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: 'Adding Shipping Address'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  addressTitles('Enter name'),
                  CustomTextFormField(
                    controller: nameController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    hintText: 'Name',
                  ),
                  10.verticalSpace,
                  addressTitles('Enter address'),
                  CustomTextFormField(
                    controller: addressController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    hintText: 'Address',
                  ),
                  10.verticalSpace,
                  addressTitles('Enter city'),
                  CustomTextFormField(
                    controller: cityController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    hintText: 'City',
                  ),
                  10.verticalSpace,
                  addressTitles('Enter region'),
                  CustomTextFormField(
                    controller: regionController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    hintText: 'Region',
                  ),
                  10.verticalSpace,
                  addressTitles('Enter country'),
                  CustomTextFormField(
                    controller: countryController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    hintText: 'Country',
                  ),
                  70.verticalSpace,
                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,

                    sizedBoxWidth: double.infinity,
                    //borderRadius: 30,
                    bgColor: AppColors.mainColor,
                    text: Text(
                      'SAVE ADDRESS',
                      style: AppTextStyles.white14,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // BlocProvider.of<BagBloc>(context).add(
                        //   SetProductToCartEvent(
                        //     BagEntity(
                        //       productID: product.id,
                        //       userID: userID,
                        //       name: product.categoryName,
                        //       color: product.color,
                        //       size: product.size,
                        //       price: product.price,
                        //       productImgUrl: product.imgUrl,
                        //     ),
                        //   ),
                        // );
                        log(nameController.text);
                        log(addressController.text);
                        log(cityController.text);
                        log(regionController.text);
                        log(countryController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

addressTitles(String title) {
  return Padding(
    padding: REdgeInsets.only(bottom: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.black16Bold,
      ),
    ),
  );
}
