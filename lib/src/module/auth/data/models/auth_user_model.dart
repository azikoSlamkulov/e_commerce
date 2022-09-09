import 'dart:convert';

import '../../domain/entities/auth_user_entity.dart';

AuthUserModel authFromJson(Map docMap) =>
    AuthUserModel.fromJson(docMap as Map<String, dynamic>);

String authToJson(AuthUserModel data) => json.encode(data.toJson());

//Map<String, dynamic> authToJson(AuthModel data) => AuthModel.toJson();

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    final String? userID,
    final String? name,
    final String? phoneNumber,
    final String? email,
    final String? photoURL,
    final String? role,
  }) : super(
          userID: userID,
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          photoURL: photoURL,
          role: role,
        );

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };

  factory AuthUserModel.fromCacheJson(Map<String, dynamic> json) =>
      AuthUserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toCacheJson() => {
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };
}
