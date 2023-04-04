import 'dart:developer';

import 'package:e_commerce/src/module/auth/presentation/logic/auth_bloc.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_state.dart';
import 'package:e_commerce/src/module/bag/presentation/logic/bloc/bag_bloc.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/rating_and_reviews_view.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/success_view.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/favorite_toggle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../locator.dart';
import '../../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../../../util/app_widgets/bar/custom_bottom_nav_bar.dart';
import '../../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../../util/app_widgets/custom_vertical_container.dart';
import '../../../../../core/data/remote/fake_data/fake_product_data.dart';
import '../../../../../util/app_widgets/dialogs/custom_snackbar.dart';
import '../../../../app/routes/router_utils.dart';
import '../../../../bag/domain/entities/bag_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../logic/product_bloc/product_bloc.dart';
import '../../logic/product_bloc/product_event.dart';
import '../../logic/product_bloc/product_state.dart';
import '../../widgets/custom_dropdown_menu.dart';
import '../../widgets/custom_list_view.dart';
import '../../widgets/custom_toggle_button.dart';
import 'mobile_catalog_view.dart';

class MobileProductDatail extends StatelessWidget {
  const MobileProductDatail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final allNewProducts = FakeProductData()
        .allFakeProducts
        .where((i) => i.isNew == true)
        .toList();
    return BlocListener<BagBloc, BagState>(
      listener: (context, state) {
        if (state is AddedProductToCartState) {
          Navigator.pop(context);
          CustomSnackbar().getSnackbar(context: context, title: 'Добавлен.');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SuccessView(),
          //   ),
          // );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return NestedMobileProductDatail(
              product: product,
              allNewProducts: allNewProducts,
              userID: state.user.userID!,
            );
          } else {
            return const Center(child: Text('Login'));
          }
        },
      ),
    );
    // return NestedMobileProductDatail(
    //   product: product,
    //   allNewProducts: allNewProducts,
    // );
  }
}

class NestedMobileProductDatail extends StatelessWidget {
  const NestedMobileProductDatail({
    super.key,
    required this.product,
    required this.allNewProducts,
    required this.userID,
  });

  final List<ProductEntity> allNewProducts;
  final ProductEntity product;
  final String userID;

  @override
  Widget build(BuildContext context) {
    final List<String> sizeItems = ['Size', 'XS', 'S', 'M', 'L', 'XL'];
    final List<String> colorItems = ['Color', 'Black', 'White', 'Red', 'Blue'];
    List<bool> isSelected = [false, false, false, false, false];
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '${product.category}',
        showShareBtn: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product image
            Container(
              height: 413.h,
              decoration: BoxDecoration(
                //color: Colors.greenAccent,
                image: DecorationImage(
                  image: NetworkImage(product.imgUrl!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
            ),

            /// choose size and color
            12.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropdownMenu(
                      items: sizeItems,
                      selectedItem: sizeItems[0],
                      validator: (itemIndex) {
                        if (itemIndex == sizeItems[0]) {
                          return 'ssss';
                          log('size');
                        }
                      },
                    ),
                    16.horizontalSpace,
                    CustomDropdownMenu(
                      items: colorItems,
                      selectedItem: colorItems[0],
                      validator: (itemIndex) {
                        if (itemIndex == colorItems[0]) {
                          return 'dddd';
                          //showBottomSheet(context, isSelected);
                          //log('color');
                        }
                      },
                    ),
                    16.horizontalSpace,
                    FavoriteToggleIconBtn(),
                  ],
                ),
              ),
            ),

            /// Product datails
            22.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.brand}',
                    style: AppTextStyles.black24Bold,
                  ),
                  Text(
                    '\$${product.price}',
                    style: AppTextStyles.black24Bold,
                  ),
                ],
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${product.category}',
                style: AppTextStyles.grey11,
              ),
            ),
            5.verticalSpace,
            ratingStar(product),

            /// Product
            20.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 120.h,
                //color: Colors.blue[400],
                child: Text(
                  'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                  style: AppTextStyles.black14,
                ),
              ),
            ),

            ///
            20.verticalSpace,
            brandBtn(
              context,
              'Item details',
              true,
              false,
              () {
                // GoRouter.of(context).goNamed(
                //   APP_PAGE.shopRatingAndReviews.toName,
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RatingAndReviewsView(),
                  ),
                );
              },
            ),
            brandBtn(
              context,
              'Shipping info',
              true,
              false,
              () {},
            ),
            brandBtn(
              context,
              'Support',
              true,
              true,
              () {},
            ),

            ///
            40.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You can also like this',
                    style: AppTextStyles.black18Bold,
                  ),
                  Text(
                    '12 items',
                    style: AppTextStyles.grey11,
                  ),
                ],
              ),
            ),

            /// Product list
            12.verticalSpace,
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allNewProducts.length,
                itemBuilder: (context, index) {
                  final product = allNewProducts[index];
                  return CustomVerticalContainer(
                    product: product,
                    onTap: () {
                      // GoRouter.of(context).goNamed(
                      //   APP_PAGE.shopProductCard.toName,
                      // );
                    },
                    //isSale: false,
                    sizedHeight: 220.h,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      ///
      bottomNavigationBar:
          bottomNavigationBar(context, isSelected, formKey, product, userID),
    );
  }
}

bottomNavigationBar(
  BuildContext context,
  List<bool> isSelected,
  GlobalKey<FormState> formKey,
  ProductEntity product,
  String userID,
) {
  return Container(
    padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
    height: 112.h,
    color: Colors.white,
    child: CustomElevatedButton(
      sizedBoxHeight: 48.h,
      sizedBoxWidth: MediaQuery.of(context).size.width,
      borderRadius: 30,
      bgColor: AppColors.mainColor,
      text: Text(
        'ADD TO CART',
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
      onPressed: () {
        BlocProvider.of<BagBloc>(context).add(
          SetProductToCartEvent(
            BagEntity(
              productID: product.id,
              userID: userID,
              name: product.category,
              color: product.color,
              size: product.size,
              price: product.price,
              productImgUrl: product.imgUrl,
            ),
          ),
        );
        // if (formKey.currentState!.validate()) {
        //   //showBottomSheet(context, isSelected);
        //   // BlocProvider.of<ProductBloc>(context).add(
        //   //   AddToCartEvent(
        //   //     product: BagEntity(
        //   //       productID: product.id,
        //   //       userID: '',
        //   //       name: product.category,
        //   //       color: product.color,
        //   //       size: product.size,
        //   //       price: product.price,
        //   //       productImgUrl: product.imgUrl,
        //   //     ),
        //   //   ),
        //   // );
        // }
      },
    ),
  );
}

ratingStar(ProductEntity product) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        RatingBarIndicator(
          rating: 3,
          //rating: product.rating!,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unratedColor: Colors.black12,
          itemCount: 5,
          itemSize: 15.0.h,
          direction: Axis.horizontal,
        ),
        5.horizontalSpace,
        Text(
          //'(${product.totalUser})',
          '(105)',
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        )
      ],
    ),
  );
}

brandBtn(BuildContext context, String text, bool isTop, bool isBottom,
    VoidCallback onTap) {
  return ListTile(
    shape: Border(
      top: isTop
          ? const BorderSide(color: Colors.black12, width: 0.5)
          : BorderSide.none,
      bottom: isBottom
          ? const BorderSide(color: Colors.black12, width: 0.5)
          : BorderSide.none,
    ),
    onTap: onTap,
    title: Text(
      text,
      style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}

bottomSheetBtn(BuildContext context, List<bool> isSelected) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 352.h,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: REdgeInsets.only(top: 36),
                child: Text(
                  'Select size',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            22.verticalSpace,
            categoryBtn(context, isSelected),
            30.verticalSpace,
            sbrandButton(context),
            //30.verticalSpace,
            Padding(
              padding: REdgeInsets.all(16),
              child: CustomElevatedButton(
                sizedBoxHeight: 48.h,
                sizedBoxWidth: MediaQuery.of(context).size.width,
                borderRadius: 30,
                bgColor: AppColors.mainColor,
                text: Text(
                  'ADD TO CART',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                onPressed: () {
                  bottomSheetBtn(context, isSelected);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

categoryBtn(BuildContext context, List<bool> isSelected) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 100.h,
      // padding: REdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 24,
      // ),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[0],
                text: 'XS',
                onPressed: () {
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
                },
              ),
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[1],
                text: 'L',
                onPressed: () {
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                text: 'S',
                isActivity: isSelected[2],
                onPressed: () {
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(2);
                },
              ),
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[3],
                text: 'XL',
                onPressed: () {
                  // BlocProvider.of<CategoryToggleBtnCubit>(context).selected(3);
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[4],
                text: 'M',
                onPressed: () {
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(4);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

sbrandButton(BuildContext context) {
  return ListTile(
    shape: const Border(
      top: BorderSide(color: Colors.black12, width: 0.5),
      bottom: BorderSide(color: Colors.black12, width: 0.5),
    ),
    onTap: () {
      // GoRouter.of(context).goNamed(
      //   APP_PAGE.shopBrand.toName,
      // );
    },
    title: Text(
      'Size info',
      style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
