import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/remote/firebase/firebase_auth.dart';
import '../../../../../core/data/remote/firebase/firestore.dart';
import '../../models/auth_user_model.dart';

abstract class FirebaseAuthWithFirestore {
  // CurrentUser
  Future<AuthUserModel?> getCurrentUser();

  Future<bool> checkUserExistsFromForestore({required String userID});

  Future<AuthUserModel> getUserFromForestore({required String userID});

  Future<bool?> createUserToFirestore({required User user});

  // Sign Up
  Future<AuthUserModel> signUp({
    required String email,
    required String password,
  });

  // Sign In
  Future<AuthUserModel> signInWithEmail({
    required String email,
    required String password,
  });
  Future<AuthUserModel> signInWithGoogle();

  Future<AuthUserModel?> signInWithFacebook();

  Future<void> signInWithPhoneNumber({
    BuildContext? context,
    required String phoneNumber,
  });

  Future<AuthUserModel> validateOtp({required String smsCode});

  // Future<AuthUserModel> signInWithCredential({
  //   required AuthCredential credential,
  // });

  // Sign Out
  Future<bool> signOut();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Аутентификация пользователя с Firestore

class FirebaseAuthImpl implements FirebaseAuthWithFirestore {
  FirebaseAuthImpl({required this.firebaseAuth, required this.firestore});

  final FirebaseAuthCore firebaseAuth;
  final FirestoreCore firestore;

  // CurrentUser
  @override
  Future<AuthUserModel?> getCurrentUser() async {
    final userFromServer = await firebaseAuth.getCurrentUser();
    if (userFromServer != null) {
      final isUserExists =
          await checkUserExistsFromForestore(userID: userFromServer.uid);
      if (isUserExists) {
        final currentUser =
            await getUserFromForestore(userID: userFromServer.uid);
        return currentUser;
      }
    }
    return null;
  }

  // Sign Up
  @override
  Future<AuthUserModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser =
          await firebaseAuth.signUp(email: email, password: password);
      final isUserExists = await checkUserExistsFromForestore(
        userID: currentUser.user!.uid,
      );
      if (!isUserExists) {
        await createUserToFirestore(user: currentUser.user!);
      }
      return await getUserFromForestore(
        userID: currentUser.user!.uid,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      return throw Exception(e.toString());
    }
  }

  // Sign In
  @override
  Future<AuthUserModel> signInWithGoogle() async {
    try {
      final currentUser = await firebaseAuth.signInWithGoogle();
      final isUserExists = await checkUserExistsFromForestore(
        userID: currentUser.user!.uid,
      );
      if (!isUserExists) {
        await createUserToFirestore(user: currentUser.user!);
      }
      return await getUserFromForestore(
        userID: currentUser.user!.uid,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthUserModel> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<AuthUserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser =
          await firebaseAuth.signInWithEmail(email: email, password: password);
      final isUserExists = await checkUserExistsFromForestore(
        userID: currentUser.user!.uid,
      );
      if (!isUserExists) {
        await createUserToFirestore(user: currentUser.user!);
      }
      return await getUserFromForestore(
        userID: currentUser.user!.uid,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signInWithPhoneNumber({
    BuildContext? context,
    String? phoneNumber,
  }) async {
    return firebaseAuth.signInWithPhoneNumber(
      context: context,
      phoneNumber: phoneNumber!,
    );
  }

  @override
  Future<AuthUserModel> validateOtp({
    String? smsCode,
  }) async {
    final currentUser = await firebaseAuth.validateOtp(smsCode: smsCode!);
    final isUserExists = await checkUserExistsFromForestore(
      userID: currentUser.user!.uid,
    );
    if (!isUserExists) {
      await createUserToFirestore(user: currentUser.user!);
    }
    return await getUserFromForestore(
      userID: currentUser.user!.uid,
    );
  }

  // @override
  // Future<AuthUserModel> signInWithCredential({
  //   required AuthCredential credential,
  // }) async {
  //   try {
  //     final userCredential =
  //         await firebaseAuthCore.signInWithCredential(credential: credential);
  //     final userCredentialModel = AuthUserModel(
  //       userID: userCredential.user!.uid,
  //       email: userCredential.user!.email,
  //       name: userCredential.user!.displayName,
  //       phoneNumber: userCredential.user!.phoneNumber,
  //       photoURL: userCredential.user!.photoURL,
  //     );
  //     return userCredentialModel;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Sign Out
  @override
  Future<bool> signOut() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> checkUserExistsFromForestore({required String userID}) async {
    return firestore.checkExists(
      id: userID,
      collectionName: 'users',
    );
  }

  @override
  Future<AuthUserModel> getUserFromForestore({required String userID}) async {
    return firestore.get(
      id: userID,
      collectionName: 'users',
      fromJson: authFromJson,
    );
  }

  @override
  Future<bool> createUserToFirestore({required User user}) async {
    final currentUser = AuthUserModel(
      userID: user.uid,
      email: user.email,
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
    return await firestore.create(
      objectModel: currentUser,
      collectionName: 'users',
    );
  }
}
