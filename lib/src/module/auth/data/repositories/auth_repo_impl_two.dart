// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:dartz/dartz.dart';

// import '../../../../core/error/exception.dart';
// import '../../../../core/error/failure.dart';
// import '../../domain/entities/auth_user_entity.dart';
// import '../../domain/repositories/auth_repo.dart';
// import '../data_source/local_auth_data.dart';
// import '../data_source/remote_auth_two.dart';

// class AuthRepoImplTwo implements AuthRepo {
//   AuthRepoImplTwo({
//     required this.remoteAuth,
//     required this.localAuth,
//   });

//   final FirebaseAuthDBTwo remoteAuth;
//   final LocalAuth localAuth;

//   @override
//   Future<Either<Failure, AuthUser?>> getCurrentUser() async {
//     try {
//       final userFromCache = localAuth.getUserFromCache();

//       if (userFromCache != null) {
//         log('Current User =====>>>>> _userFromCache');
//         return Right(userFromCache);
//       } else {
//         final userFromServer = await remoteAuth.getCurrentUser();
//         if (userFromServer == null) {
//           log('userFromServer =====>>>>> NULL');
//           return const Right(null);
//         } else {
//           final isUserExists = await remoteAuth.checkUserExistsFromForestore(
//               userID: userFromServer.uid);
//           if (isUserExists) {
//             final currentUser = await remoteAuth.getUserFromForestore(
//                 userID: userFromServer.uid);
//             log('Current User =====>>>>> userFromServer');
//             return Right(currentUser);
//           } else {
//             log('Current User =====>>>>> user not at firestore');
//             return const Right(null);
//           }
//         }
//       }
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, AuthUser>> signUp({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final currentUser = await remoteAuth.signUp(
//         email: email,
//         password: password,
//       );
//       return Right(currentUser);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, AuthUser>> signInWithGoogle() async {
//     try {
//       final currentUser = await remoteAuth.signInWithGoogle();
//       final isUserExists = await remoteAuth.checkUserExistsFromForestore(
//         userID: currentUser.userID!,
//       );
//       if (isUserExists) {
//         final userModel = await remoteAuth.getUserFromForestore(
//           userID: currentUser.userID!,
//         );
//         localAuth.addUserToCache(userModel);
//         return Right(userModel);
//       } else {
//         final isCreatedUser =
//             await remoteAuth.createUserToFirestore(user: currentUser);
//         if (isCreatedUser!) {
//           final userModel = await remoteAuth.getUserFromForestore(
//             userID: currentUser.userID!,
//           );
//           localAuth.addUserToCache(userModel);
//           return Right(userModel);
//         }
//       }
//       return const Right(AuthUser());
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> signInWithPhoneNumber({
//     required BuildContext context,
//     required String phoneNumber,
//   }) async {
//     try {
//       return Right(
//         remoteAuth.signInWithPhoneNumber(
//           context: context,
//           phoneNumber: phoneNumber,
//         ),
//       );
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, AuthUser>> sendSmsCode({
//     required String? smsCode,
//   }) async {
//     try {
//       final currentUser = await remoteAuth.validateOtp(smsCode: smsCode!);

//       final isUserExists = await remoteAuth.checkUserExistsFromForestore(
//         userID: currentUser.userID!,
//       );
//       if (isUserExists) {
//         final userModel = await remoteAuth.getUserFromForestore(
//           userID: currentUser.userID!,
//         );
//         localAuth.addUserToCache(userModel);
//         return Right(userModel);
//       } else {
//         final isCreatedUser =
//             await remoteAuth.createUserToFirestore(user: currentUser);
//         if (isCreatedUser!) {
//           final userModel = await remoteAuth.getUserFromForestore(
//             userID: currentUser.userID!,
//           );
//           localAuth.addUserToCache(userModel);
//           return Right(userModel);
//         }
//       }
//       return const Right(AuthUser());
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, AuthUser>> signInWithEmail(
//       {required String email, required String password}) async {
//     try {
//       final currentUser =
//           await remoteAuth.signInWithEmail(email: email, password: password);
//       final isUserExists = await remoteAuth.checkUserExistsFromForestore(
//         userID: currentUser.userID!,
//       );
//       if (isUserExists) {
//         final userModel = await remoteAuth.getUserFromForestore(
//           userID: currentUser.userID!,
//         );
//         localAuth.addUserToCache(userModel);
//         log('cach ====>>>>>   user saved to cache');
//         return Right(userModel);
//       } else {
//         final isCreatedUser =
//             await remoteAuth.createUserToFirestore(user: currentUser);
//         if (isCreatedUser!) {
//           final userModel = await remoteAuth.getUserFromForestore(
//             userID: currentUser.userID!,
//           );
//           localAuth.addUserToCache(userModel);
//           log('cach ====>>>>>   user saved to cache');
//           return Right(userModel);
//         }
//       }
//       return const Right(AuthUser());
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   // @override
//   // Future<Either<Failure, AuthUser>> signInWithFacebook() async {
//   //   try {
//   //     // final userCredential = await remoteAuth.signInWithFacebook();
//   //     // if (userCredential != null) {
//   //     //   localAuth.addUserToCache(userCredential);
//   //     //   log('cach ====>>>>>   user saved to cache ${userCredential.email}');
//   //     // }
//   //     // return Right(userCredential!);

//   //     final currentUser = await remoteAuth.signInWithFacebook();
//   //     final isUserExists = await remoteAuth.checkUserExistsFromForestore(
//   //       userID: currentUser!.userID!,
//   //     );
//   //     if (isUserExists) {
//   //       final userModel = await remoteAuth.getUserFromForestore(
//   //         userID: currentUser.userID!,
//   //       );
//   //       localAuth.addUserToCache(userModel);
//   //       return Right(userModel);
//   //     } else {
//   //       final isCreatedUser =
//   //           await remoteAuth.createUserToFirestore(user: currentUser);
//   //       if (isCreatedUser) {
//   //         final userModel = await remoteAuth.getUserFromForestore(
//   //           userID: currentUser.userID!,
//   //         );
//   //         localAuth.addUserToCache(userModel);
//   //         return Right(userModel);
//   //       }
//   //     }
//   //     return const Right(AuthUser());
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }

//   @override
//   Future<Either<Failure, bool>> signOut() async {
//     try {
//       await remoteAuth.signOut();
//       await localAuth.clearCache();
//       log('cach =====>>>>>   cach cleared');
//       return const Right(true);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, AuthUser>> signInWithFacebook() {
//     // TODO: implement signInWithFacebook
//     throw UnimplementedError();
//   }

//   // @override
//   // Future<Either<Failure, bool>> signOut() async {
//   //   try {
//   //     await remoteAuth.signOut();
//   //     final isClearlocalUser = await localAuth.clearCache();
//   //     log('cach =====>>>>>   cach cleared');
//   //     return Right(isClearlocalUser!);
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
// }
