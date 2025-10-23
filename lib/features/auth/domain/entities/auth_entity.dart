import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String email;
  final String fullName;
  final String token;
  const AuthEntity({
    required this.email,
    required this.fullName,
    required this.token,
  });

  @override
  List<Object?> get props => [email, fullName];
}
