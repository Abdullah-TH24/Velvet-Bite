import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_repository.dart';
import 'package:velvet_bite/features/auth/domain/entities/auth_entity.dart';
import 'package:velvet_bite/features/auth/data/data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthContractRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthEntity> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
  }) {
    return remoteDataSource.signIn(
      emailOrFullName: emailOrFullName,
      type: type,
      password: password,
    );
  }

  @override
  Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
  }) {
    return remoteDataSource.signUp(
      email: email,
      fullName: fullName,
      password: password,
    );
  }
}
