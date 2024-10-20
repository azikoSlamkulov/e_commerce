import 'dart:developer';
// import 'package:e_commerce/src/core/data/remote/firebase/firebase.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

abstract class FirebaseAuthCore {
  // Получить текущего пользователя.
  Future<User?> getCurrentUser();

  // Получить информацию о профиле конкретного поставщика услуг пользователя (google, facebook).
  Future<User?> getProviderProfile();

  // Поменять имя.
  Future<bool> updateDisplayName({
    required String name,
    required User? currentUser,
  });

  // Поменять фото.
  Future<bool> updatePhotoURL({
    required String photoURL,
    required User? currentUser,
  });

  // Поменять почту.
  Future<User?> updateEMail({required String eMail});

  // Поменять пароль от почты.
  Future<User?> updatePassword({required String newPassword});

  // Отправить пользователю электронное письмо с подтверждением.
  Future<User?> sendEmailVerification();

  //  Отправить электронное письмо для сброса пароля.
  Future<User?> sendPasswordResetEmail();

  // Удалить пользователя.
  Future<User?> deleteUser();

  // Регистрация почты.
  Future<UserCredential> signUp({
    required String email,
    required String password,
  });

  // Авторизация с помощью почты и пароля.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  });

  // Авторизация с помощью Google.
  Future<UserCredential> signInWithGoogle();

  // Авторизация с Facebook.
  Future<void> signInWithFacebook();

  // Авторизация с помощью номера телефона. 1) Ввод номер телефона.
  Future<void> signInWithPhoneNumber({
    BuildContext? context,
    required String phoneNumber,
  });

  // Авторизация с помощью номера телефона. 2) Ввод полученнего смс кода.
  Future<UserCredential> validateOtp({required String smsCode});

  // Связать номера телефона. 2) Ввод полученнего смс кода.
  Future<UserCredential?> linkPhoneNumberValidateOtp({required String smsCode});

  Future<UserCredential> signInWithCredential({
    required AuthCredential credential,
  });

  // Повторная аутентификация пользователя.
  Future<UserCredential?> reauthenticateWithCredential({required credential});

  // Связать учетные данные.
  Future<UserCredential?> linkWithCredential({required credential});

  //Выход
  Future<void> signOut();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

class FirebaseAuthCoreImpl implements FirebaseAuthCore {
  FirebaseAuthCoreImpl({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;
  String? _verificationId;
  int? _resendToken;

  // ----------------   Current User Impl  ------------------
  @override
  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;

    // firebaseAuth.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //     log(user.uid);
    //   }
    // });
  }

  //  Чтобы получить информацию о профиле, полученную от поставщиков входа, связанных с пользователем, используйте это providerData свойство.
  @override
  Future<User?> getProviderProfile() {
    // TODO: implement getProviderProfile
    throw UnimplementedError();

    // if (user != null) {
    //   for (final providerProfile in user.providerData) {
    //     // ID of the provider (google.com, apple.cpm, etc.)
    //     final provider = providerProfile.providerId;

    //     // UID specific to the provider
    //     final uid = providerProfile.uid;

    //     // Name, email address, and profile photo URL
    //     final name = providerProfile.displayName;
    //     final emailAddress = providerProfile.email;
    //     final profilePhoto = providerProfile.photoURL;
    //   }
    // }
  }

  // Вы можете обновить основную информацию о профиле пользователя с помощью update методов.
  // Примечание. Чтобы установить адрес электронной почты пользователя, пользователь должен недавно войти в систему. См. Повторная аутентификация пользователя .
  @override
  Future<bool> updateDisplayName({
    required String name,
    required User? currentUser,
  }) async {
    try {
      await currentUser?.updateDisplayName(name);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updatePhotoURL({
    required String photoURL,
    required User? currentUser,
  }) async {
    try {
      await currentUser?.updatePhotoURL(photoURL);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User?> updateEMail({required String eMail}) {
    // TODO: implement updateEMail
    throw UnimplementedError();

    // await currentUser?.updateEmail(eMail);
  }

  @override
  Future<User?> updatePassword({required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();

    // await currentUser?.updatePassword(newPassword);
  }

  // Отправить пользователю электронное письмо с подтверждением.
  @override
  Future<User?> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();

    //await user?.sendEmailVerification();

    // Вы можете настроить шаблон электронной почты, который используется в разделе «Аутентификация» консоли Firebase на странице «Шаблоны электронной почты». См. Шаблоны электронной почты в Справочном центре Firebase.

    // Также можно передать состояние через URL-адрес продолжения , чтобы перенаправить обратно в приложение при отправке письма с подтверждением.

    // Кроме того, вы можете локализовать подтверждающее электронное письмо, обновив код языка в экземпляре Auth перед отправкой электронного письма.

    // await FirebaseAuth.instance.setLanguageCode("fr");
    // await user?.sendEmailVerification();
  }

  //  Отправить электронное письмо для сброса пароля.
  @override
  Future<User?> sendPasswordResetEmail() {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();

    // Вы можете отправить электронное письмо для сброса пароля пользователю с помощью этого sendPasswordResetEmail() метода. Например:

    // await FirebaseAuth.instance
    //    .sendPasswordResetEmail(email: "user@example.com");

    // Вы можете настроить шаблон электронной почты, который используется в разделе «Аутентификация» консоли Firebase на странице «Шаблоны электронной почты». См. Шаблоны электронной почты в Справочном центре Firebase.

    // Также можно передать состояние через URL-адрес продолжения , чтобы перенаправить обратно в приложение при отправке электронного письма для сброса пароля.

    // Кроме того, вы можете локализовать электронное письмо для сброса пароля, обновив код языка в экземпляре Auth перед отправкой электронного письма. Например:

    // await FirebaseAuth.instance.setLanguageCode("fr");

    // Вы также можете отправлять электронные письма для сброса пароля из консоли Firebase.
  }

  @override
  Future<User?> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();

    // Важно: Чтобы установить адрес электронной почты пользователя, пользователь должен недавно входить в систему. См. Повторная аутентификация пользователя.

    //await user?.delete();
  }

  // ----- Sign Up Impl-----
  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
      // if (e.code == 'weak-password') {
      //   throw Exception('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   return throw Exception('The account already exists for that email.');
      // }
    } catch (e) {
      return throw Exception(e.toString());
    }
    //return null;
  }

  // ----- Sign In Impl-----
  @override
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
      // if (e.code == 'user-not-found') {
      //   return throw Exception('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   return throw Exception('Wrong password provided for that user.');
      // }
    }
  }

  // @override
  // Future<User> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //     final authCredential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     User? result = firebaseAuth.currentUser;
  //     return result!;
  //     //return await signInWithCredential(credential: authCredential);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await signInWithCredential(credential: authCredential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithPhoneNumber({
    BuildContext? context,
    String? phoneNumber,
  }) async {
    final authPhoneNumber = phoneNumber;
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: authPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) async {
        if (e.code == 'invalid-phone-number') {
          //TODO Сделать Snackbar
          // showTopSnackBar(
          //   context!,
          //   const CustomSnackBar.error(
          //     message: "Предоставленный номер телефона недействителен.",
          //   ),
          //   animationDuration: const Duration(seconds: 3),
          //   reverseAnimationDuration: const Duration(seconds: 1),
          // );
          // await CustomDialog().getDialog(
          //   title: "Ошибка!",
          //   contentText: "Предоставленный номер телефона недействителен.",
          //   isError: true,
          //   onPressed: Get.back,
          // );
        } else if (e.code == 'too-many-requests') {
          // showTopSnackBar(
          //   context!,
          //   const CustomSnackBar.error(
          //     message:
          //         "Мы заблокировали из-за необычной активности. Попробуйте позже.",
          //   ),
          //   animationDuration: const Duration(seconds: 3),
          //   reverseAnimationDuration: const Duration(seconds: 1),
          // );
        } else {
          // showTopSnackBar(
          //   context!,
          //   const CustomSnackBar.error(
          //     message: "Что-то пошло не так. Пожалуйста, попытайтесь еще раз",
          //   ),
          //   animationDuration: const Duration(seconds: 3),
          //   reverseAnimationDuration: const Duration(seconds: 1),
          // );
        }
      },
      codeSent: (String? verificationId, int? resendToken) async {
        _verificationId = verificationId;
        _resendToken = resendToken;
        log('codeSent');
        // showTopSnackBar(
        //   context!,
        //   const CustomSnackBar.info(
        //     message: "Код отправлен. Пожалуйста, проверьте свои сообщения.",
        //   ),
        //   animationDuration: const Duration(seconds: 3),
        //   reverseAnimationDuration: const Duration(seconds: 1),
        // );
      },
      forceResendingToken: _resendToken,
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  @override
  Future<UserCredential> validateOtp({
    required String? smsCode,
  }) async {
    try {
      final authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: smsCode!);
      return await signInWithCredential(credential: authCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserCredential?> linkPhoneNumberValidateOtp({
    required String smsCode,
  }) async {
    try {
      final authCred = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: smsCode);
      final userCredential = await linkWithCredential(credential: authCred);
      return await reauthenticateWithCredential(credential: userCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // linkWithCredential(AuthCredential authCreds) async {
  //   //now link these credentials with the existing user
  //   AuthResult linkauthresult =
  //       await existingUser.linkWithCredential(authCreds);
  // }

  @override
  Future<UserCredential?> linkWithCredential({required credential}) async {
    try {
      final userCredential =
          await firebaseAuth.currentUser?.linkWithCredential(credential);
      return userCredential!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
        // See the API reference for the full list of error codes.
        default:
          print("Unknown error.");
      }
      return null;
    }
  }

  @override
  Future<UserCredential> signInWithCredential({
    required AuthCredential credential,
  }) async {
    try {
      // User? result = firebaseAuth.currentUser;
      return await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // Некоторые действия, связанные с безопасностью, такие как удаление учетной записи , установка основного адреса электронной почты и изменение пароля , требуют, чтобы пользователь недавно вошел в систему. Если вы выполняете одно из этих действий, а пользователь вошел в систему слишком давно, действие завершается ошибкой и выдает FirebaseAuthException код с кодом requires-recent-login. В этом случае повторите аутентификацию пользователя, получив новые учетные данные для входа от пользователя и передав их в reauthenticate. Например:

  // Prompt the user to re-provide their sign-in credentials.
  // Then, use the credentials to reauthenticate:

  //  await user?.reauthenticateWithCredential(credential);

  @override
  Future<UserCredential?> reauthenticateWithCredential(
      {required credential}) async {
    try {
      return await firebaseAuth.currentUser!
          .reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  // ----- Sign Out Impl-----
  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
