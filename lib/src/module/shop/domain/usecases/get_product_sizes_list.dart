// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class GetProductSizesList
//     extends UseCase<List<ProductSizeEntity>, GetProductSizesListParams> {
//   final ProductRepo productRepo;
//   GetProductSizesList(this.productRepo);

//   @override
//   Future<Either<Failure, List<ProductSizeEntity>>> call(
//       GetProductSizesListParams params) async {
//     return await productRepo.getProductSizesList(productID: params.productID);
//   }
// }

// class GetProductSizesListParams extends Equatable {
//   final String productID;
//   const GetProductSizesListParams({required this.productID});

//   @override
//   List<Object?> get props => [
//         productID,
//       ];
// }
