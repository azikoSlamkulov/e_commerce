import 'dart:convert';

import '../../../../../core/data/local/sharedpreferences/local_storage.dart';
import '../../../../../util/app_constants/texts/app_texts.dart';
import '../../models/auth_user_model.dart';

abstract class LocalAuth {
  Future<bool>? addUserToCache(AuthUserModel userModel);
  AuthUserModel? getUserFromCache();
  Future<bool?> clearCache();
}

class AuthSharedPreferencesImpl implements LocalAuth {
  final SharedPreferencesDB authPreferences;
  AuthSharedPreferencesImpl({required this.authPreferences});

  @override
  Future<bool>? addUserToCache(AuthUserModel userModel) async {
    final _userData = json.encode(userModel.toJson());
    return await authPreferences.setString(
        key: AppTexts.authUserToCacheKey, value: _userData)!;
  }

  @override
  AuthUserModel? getUserFromCache() {
    final user = authPreferences.getString(key: AppTexts.authUserToCacheKey);
    if (user == null) {
      return null;
    }
    return AuthUserModel.fromJson(json.decode(user));
  }

  @override
  Future<bool?> clearCache() async {
    return await authPreferences.remove(key: AppTexts.authUserToCacheKey);
  }
}

// class LocalAuthImpl implements LocalAuth {
//   final SharedPreferences preferences;
//   LocalAuthImpl({required this.preferences});

//   @override
//   Future<bool>? addUserToCache(AuthModel authModel) async {
//     final _userData = json.encode(authModel.toJson());
//     return await preferences.setString(AppTexts.userToCacheKey, _userData);
//   }

//   @override
//   AuthModel? getUserFromCache() {
//     final _user = preferences.getString(AppTexts.userToCacheKey);
//     if (_user == null) {
//       return null;
//     }
//     return AuthModel.fromCacheJson(json.decode(_user));
//   }

//   @override
//   Future<bool?> clearCache() async {
//     return await preferences.remove(AppTexts.userToCacheKey);
//   }
//}
