import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repo.dart';

class SignOut {
  final AuthRepo authRepo;
  SignOut(this.authRepo);

  Future<Either<Failure, bool?>> signOut() async {
    return await authRepo.signOut();
  }
}
