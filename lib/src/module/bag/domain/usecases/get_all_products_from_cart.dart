import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../entities/bag_entity.dart';
import '../repositories/bag_repo.dart';

class GetAllProductsFromCart
    extends UseCase<List<BagEntity>, GetAllProductsFromCartParams> {
  final BagRepo bagRepo;
  GetAllProductsFromCart(this.bagRepo);

  @override
  Future<Either<Failure, List<BagEntity>>> call(
      GetAllProductsFromCartParams params) async {
    return await bagRepo.getAllProductsFromCart(
      userID: params.userID,
    );
  }
}

class GetAllProductsFromCartParams extends Equatable {
  final String userID;

  const GetAllProductsFromCartParams({
    required this.userID,
  });

  @override
  List<Object?> get props => [
        userID,
      ];
}
