import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/type_toggle_btn/type_toggle_btn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/domain/di/locator.dart';
import '../../../../../core/presentation/app_widgets/inputs/custom_text_form_field.dart';
import '../../../../../core/presentation/app_widgets/progress/progress.dart';

import '../../../../shop/presentation/widgets/titles_widget.dart';
import '../../admin_products.dart';

class MobileCategoriesListView extends StatelessWidget {
  const MobileCategoriesListView({
    Key? key,
    required this.typeChoice,
    required this.collectionChoice,
  }) : super(key: key);

  final String typeChoice;
  final String collectionChoice;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(
      typeChoice,
      collectionChoice,
    ));
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CreatedCategoryState) {
          BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(
            typeChoice,
            collectionChoice,
          ));
          CustomSnackbar().getSnackbar(
              context: context, title: '//${state.categoryName} добавлен.');
        }
        if (state is DeletedCategoryState) {
          if (state.isDeleted) {
            BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(
              typeChoice,
              collectionChoice,
            ));
            CustomSnackbar().getSnackbar(
              context: context,
              title: '${state.categoryName} удален.',
            );
          } else {
            BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(
              typeChoice,
              collectionChoice,
            ));
            CustomSnackbar().getSnackbar(
              context: context,
              title: 'Ошибка!',
              isError: true,
            );
          }
        }
      },
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            //return const LoadingWidget();
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedCategoriesState) {
            return NestedMobileCategoriesListView(
              allCategories: state.allCategories,
              typeChoice: typeChoice,
              collectionChoice: collectionChoice,
            );
          } else if (state is CategoriesFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
          }
          return Text('');
        },
      ),
    );
  }
}

class NestedMobileCategoriesListView extends StatelessWidget {
  NestedMobileCategoriesListView({
    super.key,
    required this.allCategories,
    required this.typeChoice,
    required this.collectionChoice,
  });

  final List<CategoryEntity> allCategories;
  String typeChoice;
  String collectionChoice;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Category',
        showSearchBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Add category button
          Padding(
            padding: REdgeInsets.only(left: 16, right: 16, top: 22),
            child: CustomElevatedButton(
              sizedBoxHeight: 50.h,
              sizedBoxWidth: double.infinity,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              text: Text(
                'ADD NEW CATEGORY',
                style: AppTextStyles.white14,
              ),
              onPressed: () {
                AppCustomBottomSheet().showBottomSheet(
                  context: context,
                  title: 'Add Category',
                  content: MultiBlocProvider(
                    providers: [
                      BlocProvider<TypeToggleBtnCubit>(
                        create: (context) => sl<TypeToggleBtnCubit>(),
                      ),
                      BlocProvider<SingleToggleBtnCubit>(
                        create: (context) => sl<SingleToggleBtnCubit>(),
                      ),
                    ],
                    child: addCategoryContent(
                      context: context,
                      formKey: formKey,
                      controller: controller,
                      callbackTypeChoice: (value) => typeChoice = value,
                      callbackCollectionChoice: (value) =>
                          collectionChoice = value,
                    ),
                  ),
                  btnText: 'ADD CATEGORY',
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        collectionChoice != '' &&
                        typeChoice != '') {
                      BlocProvider.of<CategoriesBloc>(context).add(
                        SetCategoryEvent(
                          typeChoice,
                          collectionChoice,
                          controller.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Text(
              'Choose category from $typeChoice $collectionChoice',
              style: AppTextStyles.grey14,
            ),
          ),

          /// Categories ListView
          Expanded(
            child: ListView.separated(
              itemCount: allCategories.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final category = allCategories[index];
                return ListTile(
                  onTap: () {
                    BlocProvider.of<CategoriesBloc>(context).add(
                      TypedCategoryEvent(
                        category.typeName!,
                        category.collectionName!,
                        category.categoryName!,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  title: Text(
                    category.categoryName!,
                    style: AppTextStyles.black16,
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<CategoriesBloc>(context)
                  //         .add(DeleteCategoryEvent(
                  //       id: category.id!,
                  //       categoryName: category.categoryName!,
                  //     ));
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete,
                  //     color: AppColors.mainColor,
                  //   ),
                  // ),
                  contentPadding: REdgeInsets.symmetric(horizontal: 16),
                  minVerticalPadding: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget addCategoryListContent({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController controller,
  required ValueSetter<String> callbackTypeChoice,
  required ValueSetter<String> callbackCollectionChoice,
}) {
  return Form(
    key: formKey,
    child: SingleChildScrollView(
      child: Column(
        children: [
          22.verticalSpace,
          const TitlesWidget(title: 'Enter category name'),
          CustomTextFormField(
            controller: controller,
            sizedBoxHeight: 40,
            //sizedBoxWidth: MediaQuery.of(context).size.width,
            sizedBoxWidth: double.infinity,
            labelText: 'Category name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым!';
              }
              return null;
            },
          ),
          20.verticalSpace,
          const TitlesWidget(title: 'Select type'),
          BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
            builder: (context, state) {
              if (state is TypeInitialState) {
                return buildType(context, state.isSelected);
              } else if (state is TypeSelectedState) {
                callbackTypeChoice(state.typeChoice);
                return buildType(context, state.isSelected);
              }
              return const Center(child: Text('Error'));
            },
          ),
          20.verticalSpace,
          const TitlesWidget(title: 'Select collection'),
          BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
            builder: (context, state) {
              if (state is SingleInitialState) {
                return buildCategory(context, state.isSelected);
              } else if (state is SingleSelectedState) {
                callbackCollectionChoice(state.collectionChoice);
                return buildCategory(context, state.isSelected);
              }
              return const Center(child: Text('Error'));
            },
          ),
        ],
      ),
    ),
  );
}
