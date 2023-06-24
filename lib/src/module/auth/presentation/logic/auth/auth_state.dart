// import 'package:equatable/equatable.dart';

// import '../../domain/entities/auth_user_entity.dart';

part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {
  final AuthUserEntity user;
  const AuthenticatedState(this.user);
  @override
  List<Object> get props => [user];
}

class AuthenticatedAdminState extends AuthState {
  final AuthUserEntity user;
  const AuthenticatedAdminState(this.user);
  @override
  List<Object> get props => [user];
}

class OtpVerificationState extends AuthState {
  final String phoneNumber;
  const OtpVerificationState(this.phoneNumber);
  @override
  List<Object> get props => [phoneNumber];
}

class LinkOtpVerificationState extends AuthState {
  final String phoneNumber;
  const LinkOtpVerificationState(this.phoneNumber);
  @override
  List<Object> get props => [phoneNumber];
}

class AuthenticationFailureState extends AuthState {
  final String message;
  const AuthenticationFailureState(this.message);
  @override
  List<Object> get props => [message];
}

class OpenSignUpState extends AuthState {}

class OpenSignInState extends AuthState {}

class OpenPasswordRecoveryState extends AuthState {}

class OpenSignInWithEmailState extends AuthState {}

class SignUpState extends AuthState {
  final AuthUserEntity user;
  SignUpState(this.user);
  @override
  List<Object> get props => [user];
}

// class UserInfoState extends AuthState {
//   final UserCredential user;
//   UserInfoState(this.user);
//   @override
//   List<Object> get props => [user];
// }
