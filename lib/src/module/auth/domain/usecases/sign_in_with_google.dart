import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import '../entities/auth_user_entity.dart';
import '../repositories/auth_repo.dart';

class SignInWithGoogle {
  final AuthRepo authRepo;

  SignInWithGoogle(this.authRepo);

  Future<Either<Failure, AuthUser>> signInWithGoogle() async {
    return await authRepo.signInWithGoogle();
  }
}
