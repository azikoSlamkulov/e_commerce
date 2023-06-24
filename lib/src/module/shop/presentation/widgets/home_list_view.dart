import 'package:e_commerce/lib.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: products.isNotEmpty
          ? ListView.separated(
              padding: REdgeInsets.symmetric(horizontal: 13),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                //final isNew = DateTimeFormatter().isNew(product.createdDate!);
                return SizedBox(
                  width: 155.h,
                  child: ProductVerticalContainer(
                    product: product,
                    onTap: () {
                      // GoRouter.of(context).goNamed(
                      //   APP_PAGE.shopProductCard.toName,
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MobileProductDatailView(product: product),
                        ),
                      );
                    },
                    //isSale: false,
                    //sizedHeight: 220.h,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 13.h),
            )
          : Align(
              alignment: Alignment.center,
              child: Text(
                'Список пуст!',
                style: AppTextStyles.grey16,
              ),
            ),
    );
  }
}
