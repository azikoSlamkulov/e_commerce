import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetProductsByQuery
    extends UseCase<List<ProductEntity>, GetProductsByQueryParams> {
  final ProductRepo productRepo;
  GetProductsByQuery(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetProductsByQueryParams params) async {
    final Future<Either<Failure, List<ProductEntity>>> sortedProducts;
    switch (params.thirdQuery) {
      case 'all':
        sortedProducts = productRepo.getProductsOfTheCollection(
          typeName: params.firstQuery,
          collectionName: params.secondQuery,
        );
        break;
      case 'New':
        sortedProducts = productRepo.getSortedProductsByQuery(
          fieldName: 'isNew',
          query: true,
        );
        break;
      case 'Sale':
        sortedProducts = productRepo.getSortedProductsByQuery(
          fieldName: 'isSale',
          query: true,
        );
        break;
      default:
        sortedProducts = productRepo.getProductsOfTheCategory(
          typeName: params.firstQuery,
          collectionName: params.secondQuery,
          categoryName: params.thirdQuery,
        );
    }
    return sortedProducts;
  }
}

class GetProductsByQueryParams extends Equatable {
  final String firstQuery;
  final String secondQuery;
  final String thirdQuery;
  const GetProductsByQueryParams({
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
  });

  @override
  List<Object?> get props => [firstQuery, secondQuery, thirdQuery];
}
