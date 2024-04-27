import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// final List<FilterModel> favoritesSizes = <FilterModel>[
//   const FilterModel(name: 'XS', isSelected: false),
//   const FilterModel(name: 'S', isSelected: false),
//   const FilterModel(name: 'L', isSelected: false),
//   const FilterModel(name: 'M', isSelected: false),
//   const FilterModel(name: 'XL', isSelected: false),
// ];

final List<String> favoritesSizes = <String>['XS', 'S', 'L', 'M', 'XL'];

class FavoriteButtonWidget extends StatelessWidget {
  FavoriteButtonWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  String favoriteSize = 'Size';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
            ),
            onPressed: () => AppBottomSheet.showBottomSheet(
              context: context,
              title: 'Select size',
              content: Column(
                children: [
                  22.verticalSpace,
                  SingleSelectToggleButton(
                    itemList: favoritesSizes,
                    selectedItemsCallback: (value) => favoriteSize = value,
                    containerHeight: 140,
                    sizedBoxWidth: 122.h,
                    isGridView: true,
                  ),
                  22.verticalSpace,
                  sbrandButton(context),
                  22.verticalSpace,
                  Padding(
                    padding: REdgeInsets.all(16),
                    child: CustomButton(
                      onPressed: () {
                        BlocProvider.of<FavoritesBloc>(context).add(
                          AddProductToFavoritesEvent(
                            product: FavoriteEntity(
                              productID: product.productID,
                              userID: state.user.userID,
                              size: 'XL',
                              color: 'Red',
                              categoryName: product.category!.categoryName,
                              brand: product.brand,
                              price: product.price,
                              newPrice: product.newPrice,
                              isSale: product.isSale,
                              sale: product.sale,
                              imgUrl: product.imgUrl,
                              createdDate: product.createdDate,
                            ),
                          ),
                        );
                      },
                      text: 'ADD TO FAVORITES',
                    ),
                  ),
                  22.verticalSpace,
                ],
              ),
            ),
            // onPressed: () => AppBottomSheet.showBottomSheet(
            //   context: context,
            //   title: 'Select size',
            //   content: Column(
            //     children: [
            //       /// Size buttons

            //       BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
            //         builder: (context, state) {
            //           if (state is SizesInitialState) {
            //             return buildSizeBtn(context, state.isSelected);
            //           } else if (state is SizesSelectedState) {
            //             return buildSizeBtn(context, state.isSelected);
            //           }

            //           return const Center(child: Text('Error'));
            //         },
            //       ),

            //       30.verticalSpace,

            //       // /// Size info button
            //       buildSizeInfoBtn(context),

            //       // Add to favorites button
            //       Padding(
            //         padding:
            //             REdgeInsets.symmetric(horizontal: 16, vertical: 30),
            //         child: CustomButton(
            //           onPressed: () {
            //             context.pop(context);
            //             BlocProvider.of<FavoritesBloc>(context).add(
            //               AddProductToFavoritesEvent(
            //                 product: FavoriteEntity(
            //                   productID: productID,
            //                   userID: state.user.userID,
            //                   productSize: 'XL',
            //                   // categoryName: product.categoryName,
            //                   // brand: product.brand,
            //                   // color: product.color,
            //                   // size: product.size,
            //                   // price: product.price,
            //                   // newPrice: product.newPrice,
            //                   // isSale: product.isSale,
            //                   // sale: product.sale,
            //                   // productImgUrl: product.imgUrl,
            //                   // createdDate: product.createdDate,
            //                 ),
            //               ),
            //             );
            //           },
            //           text: 'ADD TO FAVORITES',
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            child: Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 15.h,
            ),
            // child: isFavorite
            //     ? Icon(
            //         Icons.favorite,
            //         color: Colors.red,
            //         size: 15.h,
            //       )
            //     : Icon(
            //         Icons.favorite_outline,
            //         color: Colors.grey,
            //         size: 15.h,
            //       ),
          );
        } else {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 15.h,
            ),
            // child: isFavorite
            //     ? Icon(
            //         Icons.favorite,
            //         color: Colors.red,
            //         size: 15.h,
            //       )
            //     : Icon(
            //         Icons.favorite_outline,
            //         color: Colors.grey,
            //         size: 15.h,
            //       ),
          );
        }
      },
    );
  }
}

// buildSizeBtn(BuildContext context, List<bool> isSelected) {
//   return BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
//     builder: (context, state) {
//       if (state is SizesSelectedState) {
//         return Padding(
//           padding: REdgeInsets.symmetric(horizontal: 16),
//           child: Container(
//             height: 100.h,
//             // padding: REdgeInsets.symmetric(
//             //   horizontal: 16,
//             //   vertical: 24,
//             // ),
//             //color: Colors.red,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomToggleButton(
//                       sizedBoxHeight: 40.h,
//                       sizedBoxWidth: 122.h,
//                       isActivity: isSelected[0],
//                       text: 'XS',
//                       onPressed: () {
//                         BlocProvider.of<SizesToggleBtnCubit>(context)
//                             .selected(0);
//                       },
//                     ),
//                     CustomToggleButton(
//                       sizedBoxHeight: 40.h,
//                       sizedBoxWidth: 122.h,
//                       isActivity: isSelected[1],
//                       text: 'S',
//                       onPressed: () {
//                         BlocProvider.of<SizesToggleBtnCubit>(context)
//                             .selected(1);
//                       },
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomToggleButton(
//                       sizedBoxHeight: 40.h,
//                       sizedBoxWidth: 122.h,
//                       text: 'L',
//                       isActivity: isSelected[2],
//                       onPressed: () {
//                         BlocProvider.of<SizesToggleBtnCubit>(context)
//                             .selected(2);
//                       },
//                     ),
//                     CustomToggleButton(
//                       sizedBoxHeight: 40.h,
//                       sizedBoxWidth: 122.h,
//                       isActivity: isSelected[3],
//                       text: 'M',
//                       onPressed: () {
//                         BlocProvider.of<SizesToggleBtnCubit>(context)
//                             .selected(3);
//                       },
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CustomToggleButton(
//                       sizedBoxHeight: 40.h,
//                       sizedBoxWidth: 122.h,
//                       isActivity: isSelected[4],
//                       text: 'XL',
//                       onPressed: () {
//                         BlocProvider.of<SizesToggleBtnCubit>(context)
//                             .selected(4);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//       return Padding(
//         padding: REdgeInsets.symmetric(horizontal: 16),
//         child: Container(
//           height: 100.h,
//           // padding: REdgeInsets.symmetric(
//           //   horizontal: 16,
//           //   vertical: 24,
//           // ),
//           //color: Colors.red,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomToggleButton(
//                     sizedBoxHeight: 40.h,
//                     sizedBoxWidth: 122.h,
//                     isActivity: isSelected[0],
//                     text: 'XS',
//                     onPressed: () {
//                       BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
//                     },
//                   ),
//                   CustomToggleButton(
//                     sizedBoxHeight: 40.h,
//                     sizedBoxWidth: 122.h,
//                     isActivity: isSelected[1],
//                     text: 'L',
//                     onPressed: () {
//                       BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
//                     },
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomToggleButton(
//                     sizedBoxHeight: 40.h,
//                     sizedBoxWidth: 122.h,
//                     text: 'S',
//                     isActivity: isSelected[2],
//                     onPressed: () {
//                       BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
//                     },
//                   ),
//                   CustomToggleButton(
//                     sizedBoxHeight: 40.h,
//                     sizedBoxWidth: 122.h,
//                     isActivity: isSelected[3],
//                     text: 'XL',
//                     onPressed: () {
//                       BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
//                     },
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomToggleButton(
//                     sizedBoxHeight: 40.h,
//                     sizedBoxWidth: 122.h,
//                     isActivity: isSelected[4],
//                     text: 'M',
//                     onPressed: () {
//                       BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// buildSizeInfoBtn(BuildContext context) {
//   return ListTile(
//     shape: const Border(
//       top: BorderSide(color: Colors.black12, width: 0.5),
//       bottom: BorderSide(color: Colors.black12, width: 0.5),
//     ),
//     onTap: () {
//       // GoRouter.of(context).goNamed(
//       //   APP_PAGE.shopBrand.toName,
//       // );
//     },
//     title: Text(
//       'Size info',
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }
