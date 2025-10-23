import 'package:velvet_bite/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.email,
    required super.fullName,
    required super.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      fullName: json['fullName'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': super.email, 'fullName': super.fullName};
  }
}
