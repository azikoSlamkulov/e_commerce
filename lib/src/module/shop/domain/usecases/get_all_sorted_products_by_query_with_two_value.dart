// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class GetAllSortedProductsByQueryWithTwoValues extends UseCase<
//     List<ProductEntity>, GetAllSortedProductsByQueryWithTwoValuesParams> {
//   final ProductRepo productRepo;
//   GetAllSortedProductsByQueryWithTwoValues(this.productRepo);

//   @override
//   Future<Either<Failure, List<ProductEntity>>> call(
//       GetAllSortedProductsByQueryWithTwoValuesParams params) async {
//     return await productRepo.getSortedListByQueryWithTwoValues(
//       firstQuery: params.firstQuery,
//       secondQuery: params.secondQuery,
//     );
//   }
// }

// class GetAllSortedProductsByQueryWithTwoValuesParams extends Equatable {
//   final dynamic firstQuery;
//   final dynamic secondQuery;
//   const GetAllSortedProductsByQueryWithTwoValuesParams({
//     required this.firstQuery,
//     required this.secondQuery,
//   });

//   @override
//   List<Object?> get props => [
//         firstQuery,
//         secondQuery,
//       ];
// }
