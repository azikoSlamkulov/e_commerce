import 'package:e_commerce/lib.dart';

class MobileShippingAddressView extends StatelessWidget {
  const MobileShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AddressEntity> addressList = [
      AddressEntity(
        id: '1',
        name: 'Jane Doe',
        address: 'Toktogul, 45',
        city: 'Bishkek',
        region: '',
        country: 'Kyrgyzstan',
        isCheked: true,
      ),
      AddressEntity(
        id: '2',
        name: 'Jane Doe',
        address: 'Toktogul, 45',
        city: 'Bishkek',
        region: '',
        country: 'Kyrgyzstan',
        isCheked: false,
      ),
      AddressEntity(
        id: '3',
        name: 'Jane Doe',
        address: 'Toktogul, 45',
        city: 'Bishkek',
        region: '',
        country: 'Kyrgyzstan',
        isCheked: false,
      ),
    ];

    // final nameController = TextEditingController();
    // final addressController = TextEditingController();
    // final cityController = TextEditingController();
    // final regionController = TextEditingController();
    // final countryController = TextEditingController();
    // final formKey = GlobalKey<FormState>();

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
                              addShippingAddressBottomSheet(
                                context: context,
                                isEdit: true,
                              );
                            },
                            child: Text('Edit', style: AppTextStyles.red14)),
                      ],
                    ),
                    12.verticalSpace,
                    Text(address.address!, style: AppTextStyles.black14),
                    5.verticalSpace,
                    Text(
                      '${address.city},  ${address.country}',
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
          addShippingAddressBottomSheet(
            context: context,
            isEdit: false,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  addShippingAddressBottomSheet({
    required BuildContext context,
    required bool isEdit,
    String? name,
    String? address,
    String? city,
    String? region,
    String? country,
  }) {
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
        final nameController = TextEditingController();
        final addressController = TextEditingController();
        final cityController = TextEditingController();
        final regionController = TextEditingController();
        final countryController = TextEditingController();
        final formKey = GlobalKey<FormState>();
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 620.h,
            child: Form(
              key: formKey,
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
                    initialValue: 'sss',
                    labelText: 'Full name',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: addressController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Address',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: cityController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'City',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: regionController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Region',
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: countryController,
                    sizedBoxHeight: 64.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Country',
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        //onChanged: (value) => onClicked(),
                        activeColor: Colors.black,
                        onChanged: (value) {
                          // this.value = value!;
                          // setState(() {});
                        },
                      ),
                      Text(
                        'Use as the shipping address',
                        style: AppTextStyles.black14,
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,
                    sizedBoxWidth: double.infinity,
                    borderRadius: 30,
                    bgColor: AppColors.mainColor,
                    text: Text(
                      'SAVE ADDRESS',
                      style: AppTextStyles.white14,
                    ),
                    onPressed: () {},
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
}
