import 'package:e_commerce/lib.dart';

class MobilePaymentMethodsView extends StatelessWidget {
  const MobilePaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardEntity> cards = [
      CardEntity(
        id: '1',
        name: 'Jennyfer Doe',
        cardNumber: '5546 8205 3693 3947',
        expireDate: '05/23',
        cvv: '567',
        //cardImage: AppAssets.cardImage_1(width: double.infinity, height: 270.h),
        cardImage: AppAssets.mastercardWhite(width: 40, height: 32),
        isCheked: true,
      ),
      CardEntity(
        id: '2',
        name: 'Jane Doe',
        cardNumber: '5546 8205 3693 3947',
        expireDate: '05/23',
        cvv: '',
        //cardImage: AppAssets.cardImage_2(width: double.infinity, height: 270.h),
        cardImage: AppAssets.visa(width: 40, height: 32),
        isCheked: false,
      ),
      // CardEntity(
      //   id: '2',
      //   name: 'Jane Doe',
      //   cardNumber: '5546 8205 3693 3947',
      //   expireDate: '05/23',
      //   cvv: '',
      //   //cardImage: AppAssets.cardImage_2(width: double.infinity, height: 270.h),
      //   cardImage: AppAssets.visa(width: 40, height: 32),
      //   isCheked: false,
      // ),
    ];

    final nameController = TextEditingController();
    final cardNumberController = TextEditingController();
    final expireDateController = TextEditingController();
    final cvvController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: 'Payment methods'),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 36),
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
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return buildCard(
                    name: card.name!,
                    cardNumber: card.cardNumber!,
                    expireDate: card.expireDate!,
                    image: card.cardImage!,
                    isCheked: card.isCheked!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          addCardBottomSheet(
            context,
            nameController,
            cardNumberController,
            expireDateController,
            cvvController,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildCard({
    required String name,
    required String cardNumber,
    required String expireDate,
    required Image image,
    required bool isCheked,
  }) {
    //padding: REdgeInsets.symmetric(vertical: 16),
    return Column(
      children: [
        Container(
          height: 216,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isCheked ? Colors.black : AppColors.greyDarker2,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAssets.chipIcon(width: 32, height: 24),
                Text(cardNumber, style: AppTextStyles.white32),
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
                      children: [
                        Text(
                          'Card Holder Name',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          name,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Expiry Date',
                          style: AppTextStyles.white10,
                        ),
                        5.verticalSpace,
                        Text(
                          expireDate,
                          style: AppTextStyles.white14Bold,
                        ),
                      ],
                    ),
                    //AppAssets.visa(width: 40, height: 32),
                    image,
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
              value: isCheked,
              //onChanged: (value) => onClicked(),
              activeColor: Colors.black,
              onChanged: (value) {
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

  addCardBottomSheet(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController cardNumberController,
    TextEditingController expireDateController,
    TextEditingController cvvController,
  ) {
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
        final formKey = GlobalKey<FormState>();
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 550.h,
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
                        'Set as default payment method',
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
                      'ADD CARD',
                      style: AppTextStyles.white14,
                    ),
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   // BlocProvider.of<BagBloc>(context).add(
                      //   //   SetProductToCartEvent(
                      //   //     BagEntity(
                      //   //       productID: product.id,
                      //   //       userID: userID,
                      //   //       name: product.categoryName,
                      //   //       color: product.color,
                      //   //       size: product.size,
                      //   //       price: product.price,
                      //   //       productImgUrl: product.imgUrl,
                      //   //     ),
                      //   //   ),
                      //   // );
                      //   log(nameController.text);
                      //   log(addressController.text);
                      //   log(cityController.text);
                      //   log(regionController.text);
                      //   log(countryController.text);
                      // }
                    },
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
