import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../../../bag/presentation/widgets/swipeable_button_animation_page.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => sl<ProductBloc>()..add(GetNewAndSaleProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            return const LoadingWidget();
          } else if (state is LoadedProductsState) {
            return NestedMobileHomeView(
              newProducts:
                  state.allProducts.where((i) => i.isNew == true).toList(),
              topProducts: const [],
            );
          } else if (state is ProductFailureState) {
            return MyErrorWidget(message: state.message);
          }
          return const SomeErrorWidget();
        },
      ),
    );
  }
}

class NestedMobileHomeView extends StatelessWidget {
  const NestedMobileHomeView({
    super.key,
    required this.newProducts,
    required this.topProducts,
  });

  final List<ProductEntity> newProducts;
  final List<ProductEntity> topProducts;

  @override
  Widget build(BuildContext context) {
    // bool isFinished = false;

    // return Scaffold(
    //   appBar: buildHomeAppBar(),
    //   backgroundColor: Colors.blue,
    //   body: buildHomeBody(
    //     context,
    //     isFinished,
    //   ),
    // );
    return Scaffold(
      //body: buildBody(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Big Banner
              const BigBannerWdget(),

              33.verticalSpace,

              /// New  product list
              CustomHorizontalListViewWidget(
                products: newProducts,
                title: 'New',
                subtitle: 'You’ve never seen it before!',
              ),

              33.verticalSpace,

              /// Top sales  product list
              CustomHorizontalListViewWidget(
                products: topProducts,
                title: 'Top',
                subtitle: 'Top salse of the week.',
              ),

              /// Company info
              //const CompanyInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar buildHomeAppBar() {
    return CustomAppBar(
      title: 'Home',
      showSearchBtn: true,
    );
  }

  // Widget buildHomeBody(
  //   BuildContext context,
  //   bool isFinished,
  // ) {
  //   return Center(
  //     child: SizedBox(
  //       //height: 48,
  //       child: SwipeableButtonView(
  //         onFinish: () async {
  //           Navigator.push(
  //             context,
  //             PageTransition(
  //               child: const CompletedScreen(),
  //               type: PageTransitionType.fade,
  //             ),
  //           );
  //         },
  //         onWaitingProcess: () {
  //           Future.delayed(const Duration(seconds: 2), () async {
  //             // BlocBuilder<BagBloc, BagState>(

  //             //   builder: (context, state) {
  //             //     bool isFinished = false;
  //             //     if (state is AddedOrderState) {
  //             //       isFinished = state.isCreated;
  //             //     }
  //             //     return Container();
  //             //   },
  //             // );

  //             setState(() {
  //               isFinished = true;
  //             });
  //           });
  //         },
  //         isFinished: isFinished,
  //         activeColor: Colors.red,
  //         buttonWidget: const Icon(
  //           Icons.arrow_forward_ios,
  //           color: Colors.black,
  //         ),
  //         buttonText: "  Slider to Pay",
  //         buttontextstyle: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 22,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  buildBody({
    required BuildContext context,
  }) {
    List<String> imagesUrl = [];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppAddImagesWidget(
            callback: (value) {
              final imageUrl = value;
              imagesUrl.add(imageUrl);
            },
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.folder,
                      size: 70,
                      color: AppColors.red,
                    ),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 70,
                      color: AppColors.red,
                    ),
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
