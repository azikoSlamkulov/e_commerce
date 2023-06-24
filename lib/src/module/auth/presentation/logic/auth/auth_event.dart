// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class GetCurrentUserEvent extends AuthEvent {}

class CancelEvent extends AuthEvent {}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInWithEmailEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}

class OpenSignUpEvent extends AuthEvent {}

class OpenSignInEvent extends AuthEvent {}

class OpenPasswordRecoveryEvent extends AuthEvent {}

//class RegistWithPhoneEvent extends AuthEvent {}



//class OpenSignInWithEmailEvent extends AuthEvent {}
