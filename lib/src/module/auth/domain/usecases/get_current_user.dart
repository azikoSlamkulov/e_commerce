import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_user_entity.dart';
import '../repositories/auth_repo.dart';

class GetCurrentUser {
  final AuthRepo authRepo;
  GetCurrentUser(this.authRepo);

  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    return await authRepo.getCurrentUser();
  }
}
