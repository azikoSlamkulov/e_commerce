import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/app_widgets/inputs/custom_text_form_field.dart';
import '../../admin_products.dart';

class MobileBrandListView extends StatelessWidget {
  const MobileBrandListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<BrandsBloc>().add(GetAllBrandsEvent());
    BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
    return BlocListener<BrandsBloc, BrandsState>(
      listener: (context, state) {
        if (state is CreatedBrandState) {
          BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
          CustomSnackbar().getSnackbar(
            context: context,
            title: '${state.brandName} добавлен.',
          );
        }
        if (state is DeletedBrandState) {
          BlocProvider.of<BrandsBloc>(context).add(GetAllBrandsEvent());
          CustomSnackbar().getSnackbar(
            context: context,
            title: '${state.brandName} удален.',
          );
        }
      },
      child: BlocBuilder<BrandsBloc, BrandsState>(
        builder: (context, state) {
          if (state is BrandLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllBrandsState) {
            return NestedMobileBrandListView(
              allBrands: state.allBrands,
            );
          } else if (state is BrandsFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedMobileBrandListView extends StatelessWidget {
  const NestedMobileBrandListView({super.key, required this.allBrands});

  final List<BrandEntity> allBrands;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Brand',
        showSearchBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///SearchBar
          // Padding(
          //   padding: REdgeInsets.only(left: 16, right: 16, top: 22),
          //   child: CustomSearchBar(),
          // ),

          /// button
          Padding(
            padding: REdgeInsets.only(left: 16, right: 16, top: 22),
            child: CustomElevatedButton(
              sizedBoxHeight: 50.h,
              sizedBoxWidth: MediaQuery.of(context).size.width,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              //isBorderSide: true,
              text: Text(
                'ADD NEW BRAND',
                style: AppTextStyles.white14,
              ),
              onPressed: () {
                AppCustomBottomSheet().showBottomSheet(
                  context: context,
                  title: 'Add new brand',
                  btnText: 'ADD BRAND',
                  onPressed: () {
                    BlocProvider.of<BrandsBloc>(context)
                        .add(SetBrandEvent(controller.text));
                    controller.clear();
                    Navigator.pop(context);
                  },
                  content: CustomTextFormField(
                    controller: controller,
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Enter brand name',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Text(
              'Choose brand',
              style: AppTextStyles.grey14,
            ),
          ),

          /// Brand ListView
          Expanded(
            child: ListView.separated(
              itemCount: allBrands.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final brand = allBrands[index];
                return ListTile(
                  onTap: () {
                    BlocProvider.of<BrandsBloc>(context).add(
                      TypedBrandsEvent(brand.name!),
                    );
                    Navigator.pop(context);
                  },
                  title: Text(
                    brand.name!,
                    style: AppTextStyles.black16,
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<BrandsBloc>(context).add(
                  //       DeleteBrandEvent(brand.id!, brand.name!),
                  //     );
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
