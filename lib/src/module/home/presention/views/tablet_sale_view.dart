import 'package:e_commerce/src/util/product_data.dart';
import 'package:e_commerce/src/module/home/presention/widgets/custom_list_view.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/router_utils.dart';
import '../widgets/slider_carusel.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({
//     Key? key,
//     //required this.product,
//   }) : super(key: key);

//   //final ProductEntity product;

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
//             return HomeView2(
//               allProducts: state.allSortedProducts,
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

class TabletSaleView extends StatelessWidget {
  const TabletSaleView({
    super.key,
    //required this.allProducts,
  });

  //final List<ProductEntity> allProducts;

  @override
  Widget build(BuildContext context) {
    final allSaleProducts = ProductData().allSaleProducts;
    final allNewProducts = ProductData().allNewProducts;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: 180.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgImage11.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.w,
                    bottom: 32.h,
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              CustomListView(
                allProducts: allSaleProducts,
                title: 'Sale',
                subTitle: 'Super summer sale',
                isSale: true,
              ),
              CustomListView(
                allProducts: allNewProducts,
                title: 'New',
                subTitle: 'You’ve never seen it before!',
                isSale: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
