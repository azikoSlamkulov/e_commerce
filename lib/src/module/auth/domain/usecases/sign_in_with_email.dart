import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_user_entity.dart';
import '../repositories/auth_repo.dart';

class SignInWithEmail extends UseCase<AuthUser, SignInWithEmailParams> {
  final AuthRepo authRepo;

  SignInWithEmail(this.authRepo);

  @override
  Future<Either<Failure, AuthUser>> call(SignInWithEmailParams params) async {
    return await authRepo.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInWithEmailParams extends Equatable {
  final String email;
  final String password;

  const SignInWithEmailParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
