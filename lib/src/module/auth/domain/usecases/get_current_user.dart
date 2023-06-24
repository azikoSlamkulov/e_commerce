import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetCurrentUser {
  final AuthRepo authRepo;
  GetCurrentUser(this.authRepo);

  Future<Either<Failure, AuthUserEntity?>> getCurrentUser() async {
    return await authRepo.getCurrentUser();
  }
}
