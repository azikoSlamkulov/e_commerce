import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_user_entity.dart';
import '../repositories/auth_repo.dart';

class SignUp extends UseCase<AuthUser, SignUpParams> {
  final AuthRepo authRepo;

  SignUp(this.authRepo);

  @override
  Future<Either<Failure, AuthUser>> call(SignUpParams params) async {
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
