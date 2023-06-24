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

class GetAllSortedProductsByQueryWithThreeValues extends UseCase<
    List<ProductEntity>, GetAllSortedProductsByQueryWithThreeValuesParams> {
  final ProductRepo productRepo;
  GetAllSortedProductsByQueryWithThreeValues(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetAllSortedProductsByQueryWithThreeValuesParams params) async {
    return await productRepo.getSortedListByQueryWithThreeValues(
      // firstFieldName: params.firstFieldName,
      // secondFieldName: params.secondFieldName,
      // thirdFieldName: params.thirdFieldName,
      firstQuery: params.firstQuery,
      secondQuery: params.secondQuery,
      thirdQuery: params.thirdQuery,
    );
  }
}

class GetAllSortedProductsByQueryWithThreeValuesParams extends Equatable {
  // final String firstFieldName;
  // final String secondFieldName;
  // final String thirdFieldName;
  final dynamic firstQuery;
  final dynamic secondQuery;
  final dynamic thirdQuery;
  const GetAllSortedProductsByQueryWithThreeValuesParams({
    // required this.firstFieldName,
    // required this.secondFieldName,
    // required this.thirdFieldName,
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
  });

  @override
  List<Object?> get props => [
        // firstFieldName,
        // secondFieldName,
        // thirdFieldName,
        firstQuery,
        secondQuery,
        thirdQuery,
      ];
}
