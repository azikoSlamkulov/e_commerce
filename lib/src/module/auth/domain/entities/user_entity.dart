import 'package:e_commerce/lib.dart';

class AuthUserEntity extends Equatable {
  final String? userID;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? photoURL;
  final String? role;

  const AuthUserEntity({
    this.userID,
    this.name,
    this.phoneNumber,
    this.email,
    this.photoURL,
    this.role,
  });

  @override
  List<Object?> get props => [
        userID,
        name,
        phoneNumber,
        email,
        photoURL,
        role,
      ];
}
