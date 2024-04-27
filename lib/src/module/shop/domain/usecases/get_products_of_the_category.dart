// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class GetProductsOfTheCategory
//     extends UseCase<List<ProductEntity>, GetProductsOfTheCategoryParams> {
//   final ProductRepo productRepo;
//   GetProductsOfTheCategory(this.productRepo);

//   @override
//   Future<Either<Failure, List<ProductEntity>>> call(
//       GetProductsOfTheCategoryParams params) async {
//     return await productRepo.getProductsOfTheCategory(
//       typeName: params.typeName,
//       collectionName: params.collectionName,
//       categoryName: params.categoryName,
//     );
//   }
// }

// class GetProductsOfTheCategoryParams extends Equatable {
//   final String typeName;
//   final String collectionName;
//   final String categoryName;
//   const GetProductsOfTheCategoryParams({
//     required this.typeName,
//     required this.collectionName,
//     required this.categoryName,
//   });

//   @override
//   List<Object?> get props => [
//         typeName,
//         collectionName,
//         categoryName,
//       ];
// }
