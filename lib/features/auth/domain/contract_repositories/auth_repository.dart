import 'package:velvet_bite/features/auth/domain/entities/auth_entity.dart';

enum UserType { email, fullName }

abstract class AuthContractRepository {
  Future<AuthEntity> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
  });
  Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
  });
}
