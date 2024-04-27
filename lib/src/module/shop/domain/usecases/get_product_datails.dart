// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class GetProductDatails
//     extends UseCase<ProductEntity, GetProductDatailsParams> {
//   final ProductRepo productRepo;
//   GetProductDatails(this.productRepo);

//   @override
//   Future<Either<Failure, ProductEntity>> call(
//       GetProductDatailsParams params) async {
//     return await productRepo.getProductDatails(productID: params.productID);
//   }
// }

// class GetProductDatailsParams extends Equatable {
//   final String productID;
//   const GetProductDatailsParams({required this.productID});

//   @override
//   List<Object?> get props => [
//         productID,
//       ];
// }
