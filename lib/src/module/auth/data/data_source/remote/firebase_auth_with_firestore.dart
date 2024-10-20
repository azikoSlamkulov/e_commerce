import 'package:e_commerce/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FirebaseAuthWithFirestore {
  // CurrentUser
  Future<UserModel?> getCurrentUser();

  Future<bool> checkUserExistsFromForestore({required String userID});

  Future<UserModel> getUserFromForestore({required String userID});

  Future<bool?> createUserToFirestore({required User user});

  // Sign Up
  Future<UserModel> signUp({
    required String email,
    required String password,
  });

  // Sign In
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });
  Future<UserModel> signInWithGoogle();

  Future<UserModel?> signInWithFacebook();

  Future<void> signInWithPhoneNumber({
    BuildContext? context,
    required String phoneNumber,
  });

  Future<UserModel> validateOtp({required String smsCode});

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
  Future<UserModel?> getCurrentUser() async {
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
  Future<UserModel> signUp({
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
  // @override
  // Future<AuthUserModel> signInWithGoogle() async {
  //   try {
  //     final currentUser = await firebaseAuth.signInWithGoogle();
  //     final isUserExists = await checkUserExistsFromForestore(
  //       userID: currentUser.uid,
  //     );
  //     if (!isUserExists) {
  //       await createUserToFirestore(user: currentUser);
  //     }
  //     return await getUserFromForestore(
  //       userID: currentUser.uid,
  //     );
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Future<UserModel> signInWithGoogle() async {
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
  Future<UserModel> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmail({
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
  Future<UserModel> validateOtp({
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
    return firestore.checkDocExists(
      docId: userID,
      collectionName: 'users',
    );
  }

  @override
  Future<UserModel> getUserFromForestore({required String userID}) async {
    return firestore.get(
      docId: userID,
      collectionName: 'users',
      fromJson: authFromJson,
    );
  }

  @override
  Future<bool> createUserToFirestore({required User user}) async {
    final currentUser = UserModel(
      userID: user.uid,
      email: user.email,
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      orders: const [],
      shippingAddresses: const [],
      paymentMethods: const [],
      //promocodes: const [],
      reviews: const [],
      photoURL: user.photoURL,
    );
    return await firestore.create(
      docId: currentUser.userID!,
      objectModel: currentUser,
      collectionName: 'users',
    );
  }
}
