import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetFiltiredProducts
    extends UseCase<List<ProductEntity>, GetFiltiredProductsParams> {
  final ProductRepo productRepo;
  GetFiltiredProducts(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetFiltiredProductsParams params) async {
    return await productRepo.getFiltiredProducts(
      priceRange: params.priceRange,
      colors: params.colors,
      sizes: params.sizes,
      categories: params.categories,
      brands: params.brands,
    );
  }
}

class GetFiltiredProductsParams extends Equatable {
  final List<String> priceRange;
  final List<String> colors;
  final List<String> sizes;
  final List<String> categories;
  final List<String> brands;
  const GetFiltiredProductsParams({
    required this.priceRange,
    required this.colors,
    required this.sizes,
    required this.categories,
    required this.brands,
  });

  @override
  List<Object?> get props => [
        priceRange,
        colors,
        sizes,
        categories,
        brands,
      ];
}
