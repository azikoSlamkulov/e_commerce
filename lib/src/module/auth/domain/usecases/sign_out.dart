import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class SignOut {
  final AuthRepo authRepo;
  SignOut(this.authRepo);

  Future<Either<Failure, bool?>> signOut() async {
    return await authRepo.signOut();
  }
}
