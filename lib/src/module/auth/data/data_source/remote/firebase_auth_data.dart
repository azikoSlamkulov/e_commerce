import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/remote/firebase/firebase_auth.dart';
import '../../../../../core/data/remote/firebase/firestore.dart';
import '../../models/auth_user_model.dart';

abstract class FirebaseAuthData {
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

  // Sign Out
  Future<bool> signOut();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Аутентификация пользователя без Firestore

class FirebaseAuthDataImpl implements FirebaseAuthData {
  FirebaseAuthDataImpl({required this.firebaseAuth, required this.firestore});

  final FirebaseAuthCore firebaseAuth;
  final FirestoreCore firestore;

  // CurrentUser
  @override
  Future<AuthUserModel?> getCurrentUser() async {
    final userFromServer = await firebaseAuth.getCurrentUser();
    if (userFromServer != null) {
      final userModel = AuthUserModel(
        userID: userFromServer.uid,
        email: userFromServer.email,
        name: userFromServer.displayName,
        phoneNumber: userFromServer.phoneNumber,
        photoURL: userFromServer.photoURL,
      );
      return userModel;
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
      final authUserModel = AuthUserModel(
        userID: currentUser.user!.uid,
        email: currentUser.user!.email,
        name: currentUser.user!.displayName,
        phoneNumber: currentUser.user!.phoneNumber,
        photoURL: currentUser.user!.photoURL,
      );
      return authUserModel;
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
      final authUserModel = AuthUserModel(
        userID: currentUser.user!.uid,
        email: currentUser.user!.email,
        name: currentUser.user!.displayName,
        phoneNumber: currentUser.user!.phoneNumber,
        photoURL: currentUser.user!.photoURL,
      );
      return authUserModel;
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
      final authUserModel = AuthUserModel(
        userID: currentUser.user!.uid,
        email: currentUser.user!.email,
        name: currentUser.user!.displayName,
        phoneNumber: currentUser.user!.phoneNumber,
        photoURL: currentUser.user!.photoURL,
      );
      return authUserModel;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

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
