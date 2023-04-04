import 'dart:developer';

import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../domain/entities/category_entity.dart';
import '../../logic/categories_bloc/categories_bloc.dart';

class MobileCategoriesSecondView extends StatelessWidget {
  const MobileCategoriesSecondView({
    Key? key,
    required this.type,
    required this.collection,
    //required this.object,
  }) : super(key: key);

  final String type;
  final String collection;
  //List<CategoryEntity> object;

  @override
  Widget build(BuildContext context) {
    log(type);
    BlocProvider.of<CategoriesBloc>(context).add(
      GetCategoriesEvent(
        type,
        collection,
      ),
    );
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is LoadingState) {
          //return const LoadingWidget();
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedCategoriesState) {
          return NestedMobileCategoriesSecondView(
            type: type,
            collection: collection,
            allCategories: state.allCategories,
          );
        } else if (state is CategoriesFailureState) {
          //return MyErrorWidget('${state.exception}');
          return Text('');
        } else {
          //return const SomeError();,
          return Text('');
        }
      },
    );
    // log(type);
    // log(collection);
    // final fakeCategories = FakeCategoriesData()
    //     .FakeCategories
    //     .where((i) => i.type == type)
    //     .toList()
    //     .where((i) => i.collection == collection)
    //     .toList();
    // return NestedMobileCategoriesSecondView(
    //   type: type,
    //   collection: collection,
    //   allCategories: fakeCategories,
    // );
  }
}

class NestedMobileCategoriesSecondView extends StatelessWidget {
  const NestedMobileCategoriesSecondView({
    super.key,
    required this.type,
    required this.collection,
    required this.allCategories,
  });

  final String type;
  final String collection;
  final List<CategoryEntity> allCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
        showSearchBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.all(16),
            child: CustomElevatedButton(
              sizedBoxHeight: 48.h,
              sizedBoxWidth: MediaQuery.of(context).size.width,
              borderRadius: 30,
              text: Text(
                'VIEW ALL ITEMS',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                context.goNamed(
                  "shopCatalog",
                  queryParams: {
                    'type': type,
                    'collection': collection,
                    'category': 'all',
                  },
                  extra: allCategories,
                );
              },
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Choose category',
              style: AppTextStyles.grey14,
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: allCategories.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final category = allCategories[index];
                  return ListTile(
                    title: Text(
                      category.category!,
                      style: AppTextStyles.black16,
                    ),
                    onTap: () {
                      // GoRouter.of(context).goNamed(
                      //   APP_PAGE.shopCatalog.toName,
                      // );
                      context.goNamed(
                        "shopCatalog",
                        queryParams: {
                          'type': type,
                          'collection': collection,
                          'category': category.category!,
                          // 'isNew': 'false',
                          // 'isSale': 'false',
                        },
                        extra: allCategories,
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MobileCatalogView(
                      //       type: type,
                      //       collection: collection,
                      //       category: category.name!,
                      //     ),
                      //   ),
                      // );
                    },
                    contentPadding: REdgeInsets.symmetric(horizontal: 30),
                    minVerticalPadding: 1,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
