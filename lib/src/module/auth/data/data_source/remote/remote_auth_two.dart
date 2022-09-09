// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/data/remote/firebase/firebase_auth.dart';
// import '../../../../core/data/remote/firebase/firestore.dart';
// import '../models/auth_user_model.dart';

// abstract class FirebaseAuthDBTwo {
//   // CurrentUser
//   Future<User?> getCurrentUser();

//   Future<bool> checkUserExistsFromForestore({required String userID});

//   Future<AuthUserModel> getUserFromForestore({required String userID});

//   Future<bool?> createUserToFirestore({required AuthUserModel user});

//   // Sign Up
//   Future<AuthUserModel> signUp({
//     required String email,
//     required String password,
//   });

//   // Sign In
//   Future<AuthUserModel> signInWithEmail({
//     required String email,
//     required String password,
//   });
//   Future<AuthUserModel> signInWithGoogle();

//   Future<AuthUserModel?> signInWithFacebook();

//   Future<void> signInWithPhoneNumber({
//     BuildContext? context,
//     required String phoneNumber,
//   });

//   Future<AuthUserModel> validateOtp({required String smsCode});

//   // Future<AuthUserModel> signInWithCredential({
//   //   required AuthCredential credential,
//   // });

//   // Sign Out
//   Future<bool> signOut();
// }

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// class FirebaseAuthImpl implements FirebaseAuthDBTwo {
//   FirebaseAuthImpl(
//       {required this.firebaseAuthCore, required this.firestoreCore});

//   final FirebaseAuthCore firebaseAuthCore;
//   final FirestoreCore firestoreCore;

//   // CurrentUser
//   @override
//   Future<User?> getCurrentUser() async {
//     return await firebaseAuthCore.getCurrentUser();
//   }

//   //Sign Up
//   @override
//   Future<AuthUserModel> signUp({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final userCredential =
//           await firebaseAuthCore.signUp(email: email, password: password);
//       final authUserModel = AuthUserModel(
//         userID: userCredential.user!.uid,
//         email: userCredential.user!.email,
//         name: userCredential.user!.displayName,
//         phoneNumber: userCredential.user!.phoneNumber,
//         photoURL: userCredential.user!.photoURL,
//       );
//       return authUserModel;
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.toString());
//     } catch (e) {
//       return throw Exception(e.toString());
//     }
//   }

//   // Sign In
//   @override
//   Future<AuthUserModel> signInWithGoogle() async {
//     try {
//       final userCredential = await firebaseAuthCore.signInWithGoogle();
//       final authUserModel = AuthUserModel(
//         userID: userCredential.user!.uid,
//         email: userCredential.user!.email,
//         name: userCredential.user!.displayName,
//         phoneNumber: userCredential.user!.phoneNumber,
//         photoURL: userCredential.user!.photoURL,
//       );
//       return authUserModel;
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   @override
//   Future<AuthUserModel> signInWithFacebook() {
//     // TODO: implement signInWithFacebook
//     throw UnimplementedError();
//   }

//   @override
//   Future<AuthUserModel> signInWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final currentUser = await firebaseAuthCore.signInWithEmail(
//           email: email, password: password);
//       final authUserModel = AuthUserModel(
//         userID: currentUser.user!.uid,
//         email: currentUser.user!.email,
//         name: currentUser.user!.displayName,
//         phoneNumber: currentUser.user!.phoneNumber,
//         photoURL: currentUser.user!.photoURL,
//       );
//       return authUserModel;
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   @override
//   Future<void> signInWithPhoneNumber({
//     BuildContext? context,
//     String? phoneNumber,
//   }) async {
//     return firebaseAuthCore.signInWithPhoneNumber(
//       context: context,
//       phoneNumber: phoneNumber!,
//     );
//   }

//   @override
//   Future<AuthUserModel> validateOtp({
//     String? smsCode,
//   }) async {
//     final currentUser = await firebaseAuthCore.validateOtp(smsCode: smsCode!);
//     final authUserModel = AuthUserModel(
//       userID: currentUser.user!.uid,
//       name: currentUser.user!.displayName,
//       phoneNumber: currentUser.user!.phoneNumber,
//       email: currentUser.user!.email,
//       photoURL: currentUser.user!.photoURL,
//     );
//     return authUserModel;
//   }

//   // @override
//   // Future<AuthUserModel> signInWithCredential({
//   //   required AuthCredential credential,
//   // }) async {
//   //   try {
//   //     final userCredential =
//   //         await firebaseAuthCore.signInWithCredential(credential: credential);
//   //     final userCredentialModel = AuthUserModel(
//   //       userID: userCredential.user!.uid,
//   //       email: userCredential.user!.email,
//   //       name: userCredential.user!.displayName,
//   //       phoneNumber: userCredential.user!.phoneNumber,
//   //       photoURL: userCredential.user!.photoURL,
//   //     );
//   //     return userCredentialModel;
//   //   } on FirebaseAuthException catch (e) {
//   //     throw Exception(e);
//   //   }
//   // }

//   // Sign Out
//   @override
//   Future<bool> signOut() async {
//     try {
//       await firebaseAuthCore.signOut();
//       return true;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> checkUserExistsFromForestore({required String userID}) async {
//     return firestoreCore.checkExists(
//       id: userID,
//       collectionName: 'users',
//     );
//   }

//   @override
//   Future<AuthUserModel> getUserFromForestore({required String userID}) async {
//     return firestoreCore.get(
//       id: userID,
//       collectionName: 'users',
//       fromJson: authFromJson,
//     );
//   }

//   @override
//   Future<bool> createUserToFirestore({required AuthUserModel user}) async {
//     return await firestoreCore.create(
//       objectModel: user,
//       collectionName: 'users',
//     );
//   }
// }
