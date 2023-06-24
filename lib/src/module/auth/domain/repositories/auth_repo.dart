// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/error/failure.dart';
// import '../entities/auth_user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../../lib.dart';

abstract class AuthRepo {
  // Current User
  Future<Either<Failure, AuthUserEntity?>> getCurrentUser();

  // Sign Up
  Future<Either<Failure, AuthUserEntity>> signUp({
    required String email,
    required String password,
  });

  // Sign In
  Future<Either<Failure, AuthUserEntity>> signInWithGoogle();

  Future<Either<Failure, AuthUserEntity>> signInWithFacebook();

  Future<Either<Failure, AuthUserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  // Sign Out
  Future<Either<Failure, bool>> signOut();

  //Future<Either<Failure, bool?>> checkPhoneExist();
}
