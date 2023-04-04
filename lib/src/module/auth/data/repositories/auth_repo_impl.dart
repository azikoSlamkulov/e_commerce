import 'dart:developer';

import 'package:e_commerce/src/module/shop/data/data_source/local/local_product_data.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/remote/firebase/firestore.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../shop/data/data_source/remote/remote_product.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_source/local/local_auth_data.dart';
import '../data_source/remote/firebase_auth_data.dart';
import '../data_source/remote/firebase_auth_with_firestore.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.remoteAuth,
    required this.localAuth,
  });

  final FirebaseAuthData remoteAuth;
  final LocalAuth localAuth;

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    try {
      final userFromCache = localAuth.getUserFromCache();

      if (userFromCache != null) {
        log('Current User =====>>>>> _userFromCache');
        return Right(userFromCache);
      } else {
        final userFromServer = await remoteAuth.getCurrentUser();
        if (userFromServer != null) {
          log('userFromServer =====>>>>> NULL');
          return Right(userFromServer);
        }
      }
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser = await remoteAuth.signUp(
        email: email,
        password: password,
      );
      return Right(currentUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithGoogle() async {
    try {
      final currentUser = await remoteAuth.signInWithGoogle();
      localAuth.addUserToCache(currentUser);
      log('cach ====>>>>>   user saved to cache');
      return Right(currentUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
    // try {
    //   // final userCredential = await remoteAuth.signInWithFacebook();
    //   // if (userCredential != null) {
    //   //   localAuth.addUserToCache(userCredential);
    //   //   log('cach ====>>>>>   user saved to cache ${userCredential.email}');
    //   // }
    //   // return Right(userCredential!);

    //   final currentUser = await remoteAuth.signInWithFacebook();
    //   final isUserExists = await remoteAuth.checkUserExistsFromForestore(
    //     userID: currentUser!.userID!,
    //   );
    //   if (isUserExists) {
    //     final userModel = await remoteAuth.getUserFromForestore(
    //       userID: currentUser.userID!,
    //     );
    //     localAuth.addUserToCache(userModel);
    //     return Right(userModel);
    //   } else {
    //     final isCreatedUser =
    //         await remoteAuth.createUserToFirestore(user: currentUser);
    //     if (isCreatedUser) {
    //       final userModel = await remoteAuth.getUserFromForestore(
    //         userID: currentUser.userID!,
    //       );
    //       localAuth.addUserToCache(userModel);
    //       return Right(userModel);
    //     }
    //   }
    //   return const Right(AuthUser());
    // } on ServerException {
    //   return Left(ServerFailure());
    // }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final currentUser =
          await remoteAuth.signInWithEmail(email: email, password: password);
      localAuth.addUserToCache(currentUser);
      log('cach ====>>>>>   user saved to cache');
      return Right(currentUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await remoteAuth.signOut();
      await localAuth.clearCache();
      log('cach =====>>>>>   cach cleared');
      return const Right(true);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
