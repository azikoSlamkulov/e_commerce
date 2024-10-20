import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// class MobileCategoriesView extends StatelessWidget {
//   const MobileCategoriesView({
//     required this.type,
//     required this.collection,
//     Key? key,
//   }) : super(key: key);

//   final String type;
//   final String collection;

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<CategoriesBloc>(context).add(
//       GetCategoriesEvent(
//         type,
//         collection,
//       ),
//     );
//     return BlocBuilder<CategoriesBloc, CategoriesState>(
//       builder: (context, state) {
//         if (state is LoadingCategoriesState) {
//           //return const LoadingWidget();
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is LoadedCategoriesState) {
//           return NestedMobileCategoriesView(
//             type: type,
//             collection: collection,
//             //allCategories: state.allCategories,
//           );
//         } else if (state is CategoriesFailureState) {
//           //return MyErrorWidget('${state.exception}');
//           return const Text('');
//         } else {
//           //return const SomeError();,
//           return const Text('SomeError');
//         }
//       },
//     );
//   }
// }

class MobileCategoriesView extends StatelessWidget {
  const MobileCategoriesView({
    required this.type,
    required this.collection,
    // required this.allCategories,
    super.key,
  });

  final String type;
  final String collection;
  // final List<CategoryEntity> allCategories;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesBloc>(context).add(
      GetCategoriesEvent(
        type,
        collection,
      ),
    );
    List<CategoryEntity> allCategories = [];
    List<String> searchList = [];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
        showSearchBtn: true,
        searchList: searchList,
      ),
      body: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  onPressed: () => context.goNamed(
                    AppPage.catalog.name,
                    queryParams: {
                      'type': type,
                      'collection': collection,
                      'category': 'all',
                    },
                    extra: allCategories,
                  ),
                  text: 'VIEW ALL ITEMS',
                ),
                16.verticalSpace,
                Text(
                  'Choose category',
                  style: AppTextStyles.grey14,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is LoadingCategoriesState) {
                  //return const LoadingWidget();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedCategoriesState) {
                  allCategories = state.allCategories;
                  return ListView.separated(
                    padding: REdgeInsets.symmetric(vertical: 16),
                    itemCount: state.allCategories.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.grey[300],
                      height: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final category = state.allCategories[index];
                      searchList.add(category.categoryName!);
                      return ListTile(
                        contentPadding: REdgeInsets.symmetric(horizontal: 40),
                        minVerticalPadding: 1,
                        onTap: () {
                          context.goNamed(
                            AppPage.catalog.name,
                            queryParams: {
                              'type': type,
                              'collection': collection,
                              'category': category.categoryName!,
                            },
                            extra: allCategories,
                          );
                        },
                        title: Text(
                          category.categoryName!,
                          style: AppTextStyles.black16,
                        ),
                      );
                    },
                  );
                } else if (state is CategoriesFailureState) {
                  //return MyErrorWidget('${state.exception}');
                  return const Text('');
                } else {
                  //return const SomeError();,
                  return const Text('SomeError');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
