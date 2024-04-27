// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class GetProductsOfTheCollection
//     extends UseCase<List<ProductEntity>, GetProductsOfTheCollectionParams> {
//   final ProductRepo productRepo;
//   GetProductsOfTheCollection(this.productRepo);

//   @override
//   Future<Either<Failure, List<ProductEntity>>> call(
//       GetProductsOfTheCollectionParams params) async {
//     return await productRepo.getProductsOfTheCollection(
//       typeName: params.typeName,
//       collectionName: params.collectionName,
//     );
//   }
// }

// class GetProductsOfTheCollectionParams extends Equatable {
//   final String typeName;
//   final String collectionName;
//   const GetProductsOfTheCollectionParams({
//     required this.typeName,
//     required this.collectionName,
//   });

//   @override
//   List<Object?> get props => [
//         typeName,
//         collectionName,
//       ];
// }
