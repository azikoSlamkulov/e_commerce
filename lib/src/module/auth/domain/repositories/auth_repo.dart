import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_user_entity.dart';

abstract class AuthRepo {
  // Current User
  Future<Either<Failure, AuthUser?>> getCurrentUser();

  // Sign Up
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
  });

  // Sign In
  Future<Either<Failure, AuthUser>> signInWithGoogle();

  Future<Either<Failure, AuthUser>> signInWithFacebook();

  Future<Either<Failure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  });

  // Sign Out
  Future<Either<Failure, bool>> signOut();

  //Future<Either<Failure, bool?>> checkPhoneExist();
}
