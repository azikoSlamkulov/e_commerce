import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class SetOrder extends UseCase<bool, SetOrderParams> {
  final BagRepo bagRepo;
  SetOrder(this.bagRepo);

  @override
  Future<Either<Failure, bool>> call(SetOrderParams params) async {
    return await bagRepo.setOrder(order: params.order);
  }
}

class SetOrderParams extends Equatable {
  final OrderEntity order;

  const SetOrderParams({required this.order});

  @override
  List<Object?> get props => [order];
}
