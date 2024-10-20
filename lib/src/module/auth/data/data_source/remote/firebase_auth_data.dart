import 'package:e_commerce/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthData {
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
  Future<UserModel?> getCurrentUser() async {
    final userFromServer = await firebaseAuth.getCurrentUser();
    if (userFromServer != null) {
      final userModel = UserModel(
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
      final authUserModel = UserModel(
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
  //     final authUserModel = AuthUserModel(
  //       userID: currentUser.uid,
  //       email: currentUser.email,
  //       name: currentUser.displayName,
  //       phoneNumber: currentUser.phoneNumber,
  //       photoURL: currentUser.photoURL,
  //     );
  //     return authUserModel;
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
      final authUserModel = UserModel(
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
      final authUserModel = UserModel(
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
      photoURL: user.photoURL,
    );
    return await firestore.create(
      docId: currentUser.userID!,
      objectModel: currentUser,
      collectionName: 'users',
    );
  }
}
