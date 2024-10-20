import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/type_toggle_btn/type_toggle_btn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../admin_products.dart';

class BuildCategoryWidget extends StatelessWidget {
  const BuildCategoryWidget({
    required this.callbackSelectedCategory,
    super.key,
  });
  final ValueSetter<CategoryEntity> callbackSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is TypedCategoryState) {
          callbackSelectedCategory(state.typedCategory);
          return ListTileBtnWidget(
            text: 'Category',
            subtitle:
                '${state.typedCategory.typeName},  ${state.typedCategory.collectionName},  ${state.typedCategory.categoryName}',
            onTap: () => onPressed(context),
          );
        }
        return ListTileBtnWidget(
          text: 'Category',
          subtitle: 'Категория не выбрана',
          onTap: () => onPressed(context),
        );
      },
    );
  }
}

onPressed(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  String collectionChoice = '';
  String typeChoice = '';
  return AppCustomBottomSheet().showBottomSheet(
    context: context,
    title: 'Category',
    btnText: 'CONTINUE',
    onPressed: () {
      if (collectionChoice != '' || typeChoice != '') {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MobileCategoriesListView(
              typeChoice: typeChoice,
              collectionChoice: collectionChoice,
            ),
          ),
        );
      }
    },
    content: MultiBlocProvider(
      providers: [
        BlocProvider<TypeToggleBtnCubit>(
          create: (context) => sl<TypeToggleBtnCubit>(),
        ),
        BlocProvider<SingleToggleBtnCubit>(
          create: (context) => sl<SingleToggleBtnCubit>(),
        ),
      ],
      child: Form(
        key: formKey,
        child: SizedBox(
          child: Column(
            children: [
              const TitlesWidget(title: 'Select type'),
              BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
                builder: (context, state) {
                  if (state is TypeInitialState) {
                    return buildType(context, state.isSelected);
                  } else if (state is TypeSelectedState) {
                    typeChoice = state.typeChoice;
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
                    collectionChoice = state.collectionChoice;
                    return buildCategory(context, state.isSelected);
                  }
                  return const Center(child: Text('Error'));
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

buildType(BuildContext context, List<bool> isSelected) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        isActivity: isSelected[0],
        text: 'Women',
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(0);
        },
      ),
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        isActivity: isSelected[1],
        text: 'Men',
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(1);
        },
      ),
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        text: 'Kids',
        isActivity: isSelected[2],
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(2);
        },
      ),
    ],
  );
}

buildCategory(BuildContext context, List<bool> isSelected) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        isActivity: isSelected[0],
        text: 'Clothes',
        onPressed: () {
          BlocProvider.of<SingleToggleBtnCubit>(context).selected(0);
        },
      ),
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        isActivity: isSelected[1],
        text: 'Shoes',
        onPressed: () {
          BlocProvider.of<SingleToggleBtnCubit>(context).selected(1);
        },
      ),
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 110.h,
        isActivity: isSelected[2],
        text: 'Accesories',
        onPressed: () {
          BlocProvider.of<SingleToggleBtnCubit>(context).selected(2);
        },
      ),
    ],
  );
}
