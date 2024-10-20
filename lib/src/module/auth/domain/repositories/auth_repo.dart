// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/error/failure.dart';
// import '../entities/auth_user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../../lib.dart';

abstract class AuthRepo {
  // Current User
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  // Sign Up
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
  });

  // Sign In
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  // Sign Out
  Future<Either<Failure, bool>> signOut();

  //Future<Either<Failure, bool?>> checkPhoneExist();
}
