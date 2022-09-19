import 'package:e_commerce/src/module/home/domain/entities/product_entity.dart';
import 'package:e_commerce/src/module/home/presention/logic/product_bloc.dart';
import 'package:e_commerce/src/module/home/presention/logic/product_event.dart';
import 'package:e_commerce/src/module/home/presention/logic/product_state.dart';
import 'package:e_commerce/src/module/home/presention/widgets/custom_list_view.dart';
import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../locator.dart';
import '../../util/app_constants/assets/app_assets.dart';
import '../../util/app_widgets/buttons/toggle_icon_button.dart';
import '../../util/product_data.dart';

// class AllNewProductsView extends StatelessWidget {
//   AllNewProductsView({
//     Key? key,
//     //required this.allSortedProducts,
//   }) : super(key: key);

//   //final List<ProductEntity> allSortedProducts;

//   @override
//   Widget build(BuildContext context) {

//     return BlocProvider(
//       create: (context) => sl<ProductBloc>()
//         ..add(const GetAllSortedProductsByQueryEvent('isNew', true)),
//       child: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is LoadingState) {
//             //return const LoadingWidget();
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is LoadedAllSortedProductsByQueryState) {
//             return NewView(
//               allProductsNew: state.allSortedProducts,
//               //allProductsNew: allSortedProducts,
//             );
//           } else if (state is ProductFailureState) {
//             //return MyErrorWidget('${state.exception}');
//             return Text('');
//           } else {
//             //return const SomeError();,
//             return Text('');
//           }
//         },
//       ),
//       //child: UserProfile2View(),
//     );
//   }
// }

class AllNewProductsView extends StatelessWidget {
  AllNewProductsView({
    Key? key,
    //required this.allProductsNew,
  }) : super(key: key);

  //final List<ProductEntity> allProductsNew;

  @override
  Widget build(BuildContext context) {
    final allProductsNew = ProductData().allNewProducts;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                //color: Colors.red,
                margin: const EdgeInsets.only(bottom: 15),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AppAssets.saleBg(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // const Positioned(
              //   bottom: 15,
              //   left: 15,
              //   child: Text(
              //     'Street clothes',
              //     style: TextStyle(
              //         fontSize: 34,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white),
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: gridView(allProductsNew),
          ),
        ],
      ),
    );
  }
}

gridView(List<ProductEntity> allProducts) {
  return GridView.builder(
    //physics: const NeverScrollableScrollPhysics(),
    //shrinkWrap: true,
    itemCount: allProducts.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 90 / 170,
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) {
      final product = allProducts[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: container(product),
      );
    },
  );
}

container(ProductEntity product) {
  return Container(
    //margin: EdgeInsets.only(top: 15),
    //color: Colors.blue,
    //margin: const EdgeInsets.only(left: 15),
    width: 167,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 260,
          child: Stack(
            children: [
              Container(
                //color: Colors.red,

                height: 236,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.photoURL!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: product.isSale! ? Colors.red : Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product.isSale! ? '-${product.sale}%' : 'New',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                right: -14,
                child: ToggleIconBtn(isFavorite: product.isFavorite!),
              ),
              Positioned(
                bottom: 0,
                left: -1,
                child: Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    AppSized.w5,
                    const Text(
                      '(10)',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        AppSized.h5,
        Text(
          product.brand!,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        AppSized.h5,
        Text(
          product.item!,
          style: const TextStyle(fontSize: 16),
        ),
        AppSized.h5,
        Row(
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough),
            ),
            AppSized.w5,
            Text(
              '\$${product.newPrice}',
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ],
        ),
      ],
    ),
  );
}
