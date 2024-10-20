import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class SignInWithGoogle {
  final AuthRepo authRepo;

  SignInWithGoogle(this.authRepo);

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return await authRepo.signInWithGoogle();
  }
}
