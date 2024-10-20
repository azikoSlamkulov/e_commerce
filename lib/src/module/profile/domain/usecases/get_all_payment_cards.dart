import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetAllPaymentCards
    extends UseCase<List<PaymentCardEntity>, GetAllCardsParams> {
  final ProfileRepo profileRepo;
  GetAllPaymentCards(this.profileRepo);

  @override
  Future<Either<Failure, List<PaymentCardEntity>>> call(
      GetAllCardsParams params) async {
    return await profileRepo.getAllPaymentCards(
      userId: params.userId,
    );
  }
}

class GetAllCardsParams extends Equatable {
  final String userId;
  const GetAllCardsParams({
    required this.userId,
  });

  @override
  List<Object?> get props => [
        userId,
      ];
}
