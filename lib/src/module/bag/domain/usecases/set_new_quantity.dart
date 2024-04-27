import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class SetNewQuantity extends UseCase<bool, SetNewQuantityParams> {
  final BagRepo bagRepo;
  SetNewQuantity(this.bagRepo);

  @override
  Future<Either<Failure, bool>> call(SetNewQuantityParams params) async {
    return await bagRepo.setNewQuantity(
      productID: params.productID,
      newQuantity: params.newQuantity,
      cardTotalPrice: params.cardTotalPrice,
    );
  }
}

class SetNewQuantityParams extends Equatable {
  final String productID;
  final int newQuantity;
  final double cardTotalPrice;

  const SetNewQuantityParams({
    required this.productID,
    required this.newQuantity,
    required this.cardTotalPrice,
  });

  @override
  List<Object?> get props => [productID, newQuantity, cardTotalPrice];
}
