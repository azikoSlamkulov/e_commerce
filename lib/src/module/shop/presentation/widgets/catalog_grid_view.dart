import 'package:e_commerce/lib.dart';

class CatalogGridView extends StatelessWidget {
  const CatalogGridView({
    required this.products,
    super.key,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Expanded(
            child: GridView.builder(
              padding: REdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 17.h,
                //mainAxisSpacing: 17.h,
                mainAxisExtent: 315.h,
                crossAxisCount: 2,
                //childAspectRatio: 90.h / 140.h,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductVerticalContainer(
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
                );
              },
            ),
          )
        : Align(
            alignment: Alignment.center,
            child: Text(
              'Список пуст!',
              style: AppTextStyles.grey16,
            ),
          );
  }
}
