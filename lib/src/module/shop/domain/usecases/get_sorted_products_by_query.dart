import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetSortedProductsByQuery
    extends UseCase<List<ProductEntity>, GetSortedProductsByQueryParams> {
  final ProductRepo productRepo;
  GetSortedProductsByQuery(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetSortedProductsByQueryParams params) async {
    return await productRepo.getSortedProductsByQuery(
      fieldName: params.fieldName,
      query: params.query,
    );
  }
}

class GetSortedProductsByQueryParams extends Equatable {
  final String fieldName;
  final dynamic query;
  const GetSortedProductsByQueryParams({
    required this.fieldName,
    required this.query,
  });

  @override
  List<Object?> get props => [
        fieldName,
        query,
      ];
}
