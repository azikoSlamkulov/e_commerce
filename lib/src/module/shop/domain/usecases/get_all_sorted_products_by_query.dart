import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

// class GetAllSortedProductsByQuery {
//   final ProductRepo productRepo;
//   GetAllSortedProductsByQuery(this.productRepo);

//   Future<Either<Failure, List<ProductEntity>>>
//       getAllSortedProductsByQuery() async {
//     return await productRepo.getAllSortedProductsByQuery();
//   }
// }

class GetAllSortedProductsByQuery
    extends UseCase<List<ProductEntity>, GetAllSortedProductsByQueryParams> {
  final ProductRepo productRepo;
  GetAllSortedProductsByQuery(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetAllSortedProductsByQueryParams params) async {
    return await productRepo.getAllSortedProductsByQuery(
      fieldName: params.fieldName,
      query: params.query,
    );
  }
}

class GetAllSortedProductsByQueryParams extends Equatable {
  final String fieldName;
  final dynamic query;
  const GetAllSortedProductsByQueryParams({
    required this.fieldName,
    required this.query,
  });

  @override
  List<Object?> get props => [
        fieldName,
        query,
      ];
}
