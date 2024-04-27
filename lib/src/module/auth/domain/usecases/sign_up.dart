import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UseCase<AuthUserEntity, SignUpParams> {
  final AuthRepo authRepo;

  SignUp(this.authRepo);

  @override
  Future<Either<Failure, AuthUserEntity>> call(SignUpParams params) async {
    return await authRepo.signUp(
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;

  const SignUpParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
