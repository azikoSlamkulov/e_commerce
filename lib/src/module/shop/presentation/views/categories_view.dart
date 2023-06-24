import 'package:e_commerce/lib.dart';

// class MobileCategoriesSecondView extends StatelessWidget {
//   const MobileCategoriesSecondView({
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
//         if (state is LoadingState) {
//           //return const LoadingWidget();
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is LoadedCategoriesState) {
//           return NestedMobileCategoriesSecondView(
//             type: type,
//             collection: collection,
//             allCategories: state.allCategories,
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
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,
                    sizedBoxWidth: double.infinity,
                    borderRadius: 30,
                    text: Text(
                      'VIEW ALL ITEMS',
                      style: AppTextStyles.white14,
                    ),
                    onPressed: () {
                      context.goNamed(
                        AppPage.catalog.name,
                        queryParams: {
                          'type': type,
                          'collection': collection,
                          'category': 'all',
                        },
                        extra: allCategories,
                      );
                    },
                  ),
                  16.verticalSpace,
                  Text(
                    'Choose category',
                    style: AppTextStyles.grey14,
                  ),
                ],
              )),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is LoadingState) {
                //return const LoadingWidget();
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadedCategoriesState) {
                allCategories = state.allCategories;
                return Expanded(
                  child: ListView.separated(
                    padding: REdgeInsets.symmetric(vertical: 16),
                    itemCount: state.allCategories.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final category = state.allCategories[index];
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
                  ),
                );
              } else if (state is CategoriesFailureState) {
                //return MyErrorWidget('${state.exception}');
                return const Text('');
              } else {
                //return const SomeError();,
                return const Text('SomeError');
              }
            },
          )
        ],
      ),
    );
  }
}
