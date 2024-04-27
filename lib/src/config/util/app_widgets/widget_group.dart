import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetGroup extends StatelessWidget {
  WidgetGroup({
    required this.allCategories,
    required this.type,
    required this.collection,
    required this.category,
    super.key,
  });

  final List<CategoryEntity>? allCategories;
  final String type;
  final String collection;
  final String category;

  String itemName = 'Newest';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        allCategories!.isNotEmpty
            ? Container(
                color: Colors.white,
                height: 46.h,
                width: double.infinity,
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: allCategories!.length,
                  itemBuilder: (context, index) {
                    final newCategory = allCategories![index];
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: Text(
                        newCategory.categoryName!,
                        style: AppTextStyles.white14,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8.h),
                )
                // : CustomElevatedButton(
                //     text: const Text('CATEGORIES'),
                //     onPressed: () {
                //       context.goNamed(
                //         AppPage.collections.toName,
                //       );
                //     },
                //   ),

                )
            : SizedBox(),
        Container(
          color: Colors.white,
          height: 44.h,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Filters
                TextButton.icon(
                  onPressed: () {
                    // context.goNamed(
                    //   AppPage.catalogFilters.toName,
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileCatalogFiltersView(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Filters',
                    style: AppTextStyles.black11,
                  ),
                ),

                // Sort
                ProductSortWidget(
                  selectedSortBtnCallback: (value) => itemName = value,
                ),
                // TextButton.icon(
                //   onPressed: () {
                //     bottomSheet(
                //       context,
                //       // type,
                //       // collection,
                //       // category,
                //     );
                //   },
                //   icon: const Icon(
                //     Icons.swap_vert_outlined,
                //     color: Colors.black,
                //   ),
                //   label: BlocListener<SortToggleBtnCubit, SortToggleBtnState>(
                //     listener: (context, state) {
                //       // if (state is InitialState) {
                //       //   _choice = state.selectedText;
                //       //   BlocProvider.of<ProductBloc>(context).add(
                //       //     GetFakeSortedListEvent(
                //       //       type: type,
                //       //       collection: collection,
                //       //       category: category,
                //       //       choice: state.selectedText,
                //       //     ),
                //       //   );
                //       // } else if (state is SelectedState) {
                //       //   _choice = state.selectedText;
                //       //   BlocProvider.of<ProductBloc>(context).add(
                //       //     GetFakeSortedListEvent(
                //       //       type: type,
                //       //       collection: collection,
                //       //       category: category,
                //       //       choice: state.selectedText,
                //       //     ),
                //       //   );
                //       // }
                //     },
                //     child: BlocBuilder<SortToggleBtnCubit, SortToggleBtnState>(
                //       builder: (context, state) {
                //         return Text(
                //           state.selectedText,
                //           style: AppTextStyles.black11,
                //         );
                //       },
                //     ),
                //   ),
                // ),

                /// Orientation
                IconButton(
                  onPressed: () {
                    BlocProvider.of<OrientationCubit>(context).getOrientation();
                  },
                  icon: BlocBuilder<OrientationCubit, OrientationState>(
                    builder: (context, state) {
                      return state.orientation
                          ? const Icon(
                              Icons.view_list,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.view_module,
                              color: Colors.black,
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

bottomSheet(
  BuildContext context,
  // String type,
  // String collection,
  // String category,
) {
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
                  'Sort by',
                  style: AppTextStyles.black18Bold,
                ),
              ),
            ),
            33.verticalSpace,
            // SortToggleButton(
            //   selectedSortText: (value) {},
            //   // type: type,
            //   // collection: collection,
            //   // category: category,
            // ),
            // button(context, 'Popular', false, () => log('Popular')),
            // button(context, 'Newest', false, () => log('Newest')),
            // button(context, 'Customer review', false,
            //     () => log('Customer review')),
            // button(context, 'Price: lowest to high', true,
            //     () => log('Price: lowest to high')),
            // button(context, 'Price: highest to low', false,
            //     () => log('Price: highest to low')),
          ],
        ),
      );
    },
  );
}
