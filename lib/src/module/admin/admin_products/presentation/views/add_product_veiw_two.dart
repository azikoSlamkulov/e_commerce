//import 'dart:io';

import 'dart:developer';

// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_brands_list_view.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_categories_list_view.dart';

import 'package:e_commerce/src/core/presentation/app_widgets/add_images_widget.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/category_toggle_btn/category_toggle_btn_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/colors_and_sizes/colors_and_sizes_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/sizes_toggle_btn/sizes_toggle_btn_cubit.dart';
import 'package:e_commerce/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../admin_products.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';

//import '../../../../../config/locator.dart';

// import '../../../../../util/app_widgets/inputs/custom_text_form_field_tow.dart';
// import '../../logic/brand_cubit/brand_cubit.dart';
// import '../../logic/categories_bloc/categories_bloc.dart';
//

//import '../../widgets/titles_widget.dart';
// import '../../widgets/modal_bottom_sheet.dart';
// import '../../../../../util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// import 'home_view.dart';

class AddProductViewTwo extends StatelessWidget {
  const AddProductViewTwo({
    Key? key,
    //required this.productIndex,
  }) : super(key: key);

  //int productIndex;

  @override
  Widget build(BuildContext context) {
    //String brand = '';
    // final brands = BrandData().brands;
    // return NestedMobileBrandView(brands: brands);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        BlocProvider<CategoryToggleBtnCubit>(
          create: (context) => sl<CategoryToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
        BlocProvider<ColorsAndSizesCubit>(
          create: (context) => sl<ColorsAndSizesCubit>(),
        ),
        //BlocProvider<BrandsBloc>(create: (context) => sl<BrandsBloc>()),
        // BlocProvider<ProductBloc>(
        //   create: (context) => sl<ProductBloc>()..add(GetAllProductEvent()),
        // ),
        // BlocProvider<ProductCubit>(create: (context) => sl<ProductCubit>()),
        //BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        // BlocProvider<SingleToggleBtnCubit>(
        //     create: (context) => sl<SingleToggleBtnCubit>()),
        // BlocProvider<TypeToggleBtnCubit>(
        //     create: (context) => sl<TypeToggleBtnCubit>()),

        // BlocProvider<MultipleToogleBtnCubit>(
        //     create: (context) => sl<MultipleToogleBtnCubit>()),

        //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
        // BlocProvider<ShopBloc>(create: (context) => sl<ShopBloc>()),
      ],
      // child: BlocListener<ProductBloc, ProductState>(
      //   listener: (context, state) {
      //     if (state is CreatedProductState) {
      //       // CustomSnackbar().getSnackbar(
      //       //   context: context,
      //       //   title: state.isCreated ? 'Created' : 'Error',
      //       //   isError: state.isCreated ? false : true,
      //       // );
      //       //Navigator.pop(context);
      //     }
      //   },
      //   child: BlocBuilder<ProductBloc, ProductState>(
      //     builder: (context, state) {
      //       if (state is LoadingProductState) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (state is LoadedAllProductState) {
      //         return NestedAddProductView(
      //           productIndex: state.allProducts.length,
      //         );
      //       } else if (state is ProductFailureState) {
      //         //return MyErrorWidget('${state.exception}');
      //         return Text('');
      //       } else {
      //         //return const SomeError();,
      //         return Text('');
      //       }
      //     },
      //   ),
      // ),
      child: const NestedAddProductTwoView(),
    );
  }
}

final TextEditingController priseCtrl = TextEditingController();
final TextEditingController countCtrl = TextEditingController();
final TextEditingController descriptionCtrl = TextEditingController();

class NestedAddProductTwoView extends StatelessWidget {
  const NestedAddProductTwoView({
    super.key,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ProductSizeEntity addSelectedSize(String size) {
  //   return ProductSizeEntity(
  //     quantity: 5,
  //     size: size,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String selectedColor = 'Цвет не выбран';
    String smallImageUrl = '';
    //String smallImageName = '';
    List<String> selectedBigImagesList = [];

    String typedBrand = '';
    CategoryEntity typedCategory = const CategoryEntity();
    final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
    List<ProductSizeEntity> selectedSizeList = [];
    List<ProductColorEntity>? colorsAndSizesList = [];

    int colorItemCount = 1;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Add product',
        showSearchBtn: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Small Image
              const TitlesWidget(title: 'Main image'),
              SmallImageWidget(
                smallImageCallback: (value) {
                  smallImageUrl = value.imageUrl!;
                  //smallImageName = value.imageName!;
                },
              ),

              /// Prise and count
              // Form(
              //   key: _formKey,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const TitlesWidget(title: 'Prise'),
              //             Padding(
              //               padding: REdgeInsets.only(left: 16),
              //               child: CustomTextFormField(
              //                 controller: priseCtrl,
              //                 keyboardType: TextInputType.number,
              //                 sizedBoxHeight: 40.h,
              //                 //sizedBoxWidth: MediaQuery.of(context).size.width,
              //                 labelText: 'Enter prise',
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const TitlesWidget(title: 'Quantity'),
              //             Padding(
              //               padding: REdgeInsets.symmetric(horizontal: 16),
              //               child: CustomTextFormField(
              //                 controller: countCtrl,
              //                 keyboardType: TextInputType.number,
              //                 sizedBoxHeight: 40.h,
              //                 //sizedBoxWidth: MediaQuery.of(context).size.width,
              //                 labelText: 'Enter quantity',
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              //Color and sizes
              // BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
              //   builder: (context, state) {
              //     if (state is LoadedColorsAndSizesState) {
              //       colorsAndSizesList.add(state.colorsAndSizesList);
              //     }
              //     return ListView.builder(
              //       itemCount: colorsAndSizesList.length + 1,
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemBuilder: (context, index) {
              //         return BuildColorsAndSizesWidget(
              //           colorsAndSizesCallback: (value) =>
              //               colorsAndSizesList.add(value),
              //           bigImagesCallback: (value) =>
              //               selectedBigImagesList = value,
              //         );
              //       },
              //     );
              //   },
              // ),

              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<ColorsAndSizesCubit>(context)
                          ..getColors(),
                        child: ColorAndSizesView(),
                      ),
                      //builder: (context) => AddColorAndSizesWidget(),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => AddColorAndSizesView(),
                  //     //builder: (context) => AddColorAndSizesWidget(),
                  //   ),
                  // );
                },
                title: Text(
                  'Color and sizes',
                  style: AppTextStyles.black16Bold,
                ),
                subtitle: Text(
                  '',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14.sp,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
              Container(
                height: 5.h,
                color: Colors.white,
              ),
              //BuildColorsAndSizesWidget(),
              // ListView.builder(
              //   itemCount: colorsAndSizesList.length + 1,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     //final colorAndSize = colorsAndSizesList[index];
              //     return BuildColorsAndSizesWidget(
              //       colorsAndSizesCallback: (value) =>
              //           colorsAndSizesList.add(value),
              //       bigImagesCallback: (value) => selectedBigImagesList = value,
              //     );
              //   },
              // ),

              /// Main image
              // AddImagesWidget(
              //   smallImageCallback: (value) {
              //     imageUrl = value;
              //   },
              //   bigImagesCallback: (value) {
              //     bigImagesUrlList = value;
              //   },
              // ),

              Container(
                height: 5.h,
                color: Colors.white,
              ),

              /// Category
              BuildCategoryWidget(
                callbackSelectedCategory: (value) => typedCategory = value,
              ),

              Container(
                height: 5.h,
                color: Colors.white,
              ),

              /// Brand
              BuildBrandWidget(
                callbackSelectedBrand: (value) {
                  typedBrand = value;
                },
              ),
              Container(
                height: 5.h,
                color: Colors.white,
              ),

              /// Sale
              // BuildSaleWidget(
              //     //callbackSelectedCategory: (value) => typedCategory = value,
              //     // formKey: formKey,
              //     // collectionChoice: collectionChoice,
              //     // typeChoice: typeChoice,
              //     //typedCategory: typedCategory,
              //     // callbackSelectedCategory: (value) => typedCategory = value,
              //     // callbackSelectedType: (value) => typeChoice = value,
              //     // callbackSelectedCollection: (value) =>
              //     //     collectionChoice = value,
              //     ),

              // Container(
              //   height: 5.h,
              //   color: Colors.white,
              // ),

              /// Description
              const TitlesWidget(title: 'Description'),
              buildDescription(descriptionCtrl),

              /// buttons
            ],
          ),
        ),
      ),

      /// BottomNavigationBar
      bottomNavigationBar: Container(
        padding: REdgeInsets.only(
          left: 16,
          right: 16,
          //bottom: 15,
        ),
        height: 80.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
              sizedBoxHeight: 36.h,
              sizedBoxWidth: 160.w,
              borderRadius: 30,
              bgColor: Colors.white,
              isBorderSide: true,
              text: Text(
                'Discard',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              onPressed: () {
                priseCtrl.clear();
                countCtrl.clear();
                descriptionCtrl.clear();
                Navigator.pop(context);
              },
            ),
            CustomElevatedButton(
              sizedBoxHeight: 36.h,
              sizedBoxWidth: 160.w,
              borderRadius: 30,
              text: Text(
                'Apply',
                style: TextStyle(fontSize: 14.sp),
              ),
              onPressed: () {
                BlocProvider.of<ProductBloc>(context).add(
                  SetProductEvent(
                    ProductDatailEntity(
                      category: CategoryEntity(
                        typeName: typedCategory.typeName,
                        collectionName: typedCategory.collectionName,
                        categoryName: typedCategory.categoryName,
                      ),
                      brand: typedBrand,
                      color: selectedColor,
                      sizes: selectedSizeList,
                      price: double.parse(priseCtrl.text),
                      description: descriptionCtrl.text,
                      reviews: const [],
                      mainImgUrl: smallImageUrl,
                      imgUrlList: selectedBigImagesList,
                    ),
                  ),
                );
                priseCtrl.clear();
                countCtrl.clear();
                descriptionCtrl.clear();
                //Navigator.pop(context);

                log('colorsandSizesList ===>>> $colorsAndSizesList');
                // log('color ====>>>>  $selectedColor');
                // log('selectedSizeList ====>>>>  $selectedSizeList');
                // log('selectedBigImagesList ===>>> $selectedBigImagesList');
                // log('prise ====>>>>  ${priseCtrl.text}');
                // log('prise ====>>>>  ${priseCtrl.text}');
                // log('count ====>>>>  ${countCtrl.text}');
                // log('Color ====>>>>  $selectedColor');
                // log('Size ====>>>>  $selectedSize');
                // log('typedBrand ====>>>>  $typedBrand');
                // log('typeName ====>>>>  ${typedCategory.typeName!}');
                // log('collectionName ====>>>>  ${typedCategory.collectionName!}');
                // log('categoryName ====>>>>  ${typedCategory.categoryName!}');
                // log('imageUrl ====>>>>  $imageUrl');
                // log('bigImagesUrlList ====>>>>  $bigImagesUrlList');
              },
            ),
          ],
        ),
      ),
    );
  }
}

buildDescription(TextEditingController descriptionController) {
  return Padding(
    padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: CustomTextFormField(
      controller: descriptionController,
      sizedBoxHeight: 154.h,
      //sizedBoxWidth: MediaQuery.of(context).size.width,
      sizedBoxWidth: double.infinity,
      keyboardType: TextInputType.multiline,
      labelText: 'Enter description',
      fillColor: Colors.white,
      maxLines: 10,
    ),
  );
}
