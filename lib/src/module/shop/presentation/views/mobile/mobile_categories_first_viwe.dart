import 'package:e_commerce/src/util/app_constants/assets/app_assets.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_widgets/bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../locator.dart';

import '../../logic/tab_bar/tab_bar_cubit.dart';
import '../../widgets/collections_card_widget.dart';

class MobileCategoriesFirstView extends StatelessWidget {
  const MobileCategoriesFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TabBarCubit>(),
      child: const NestedMobileCategoriesFirstView(),
    );
  }
}

class NestedMobileCategoriesFirstView extends StatelessWidget {
  const NestedMobileCategoriesFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = ['Women', 'Men', 'Kids'];
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Categories',
        showSearchBtn: true,
      ),
      body: Center(
        child: Column(
          children: [
            /// TabBar

            DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Container(
                height: 44.h,
                color: Colors.white,
                child: TabBar(
                  onTap: (value) {
                    BlocProvider.of<TabBarCubit>(context)
                        .getSelectedTabIndex(value);
                  },
                  isScrollable: false,
                  labelStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  labelColor: Colors.black,
                  unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                  unselectedLabelColor: Colors.black45,
                  indicatorColor: Colors.red,
                  tabs: items.map((e) => Tab(text: e)).toList(),
                ),
              ),
            ),

            /// List of Categories

            //256 x 154
            BlocBuilder<TabBarCubit, TabBarState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CollectionsCardWidget(
                      collectionName: 'Sale',
                      selectedTabIndex: state.selectedTabIndex,
                    ),
                    CollectionsCardWidget(
                      collectionName: 'New',
                      image: AppAssets.collectionsNew(
                        width: 171.w,
                        height: 110.h,
                      ),
                      selectedTabIndex: state.selectedTabIndex,
                    ),
                    CollectionsCardWidget(
                      collectionName: 'Clothes',
                      image: AppAssets.collectionsClothes(
                        width: 171.w,
                        height: 110.h,
                      ),
                      selectedTabIndex: state.selectedTabIndex,
                    ),
                    CollectionsCardWidget(
                      collectionName: 'Shoes',
                      image: AppAssets.collectionsShoes(
                        width: 171.w,
                        height: 110.h,
                      ),
                      selectedTabIndex: state.selectedTabIndex,
                    ),
                    CollectionsCardWidget(
                      collectionName: 'Accesories',
                      image: AppAssets.collectionsAccesories(
                        width: 171.w,
                        height: 110.h,
                      ),
                      selectedTabIndex: state.selectedTabIndex,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
