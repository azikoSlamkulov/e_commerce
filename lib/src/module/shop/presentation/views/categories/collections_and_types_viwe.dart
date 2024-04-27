import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCollectionsAndTypesView extends StatelessWidget {
  const MobileCollectionsAndTypesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TabBarCubit>(),
      child: const NestedCollectionsAndTypesView(),
    );
  }
}

class NestedCollectionsAndTypesView extends StatelessWidget {
  const NestedCollectionsAndTypesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = ['Women', 'Men', 'Kids'];

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Collections',
        showSearchBtn: true,
        showBackBtn: false,
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

            /// List of collections
            //256 x 154
            BlocBuilder<TabBarCubit, TabBarState>(
              builder: (context, state) {
                return Expanded(
                  child: Padding(
                    padding: REdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CollectionsCardWidget(
                          collectionName: 'Sale',
                          selectedTabIndex: state.selectedTabIndex,
                        ),
                        5.verticalSpace,
                        CollectionsCardWidget(
                          collectionName: 'New',
                          image: AppAssets.collectionsNew(
                            width: 171.w,
                            height: 110.h,
                          ),
                          selectedTabIndex: state.selectedTabIndex,
                        ),
                        5.verticalSpace,
                        CollectionsCardWidget(
                          collectionName: 'Clothes',
                          image: AppAssets.collectionsClothes(
                            width: 171.w,
                            height: 110.h,
                          ),
                          selectedTabIndex: state.selectedTabIndex,
                        ),
                        5.verticalSpace,
                        CollectionsCardWidget(
                          collectionName: 'Shoes',
                          image: AppAssets.collectionsShoes(
                            width: 171.w,
                            height: 110.h,
                          ),
                          selectedTabIndex: state.selectedTabIndex,
                        ),
                        5.verticalSpace,
                        CollectionsCardWidget(
                          collectionName: 'Accesories',
                          image: AppAssets.collectionsAccesories(
                            width: 171.w,
                            height: 110.h,
                          ),
                          selectedTabIndex: state.selectedTabIndex,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
