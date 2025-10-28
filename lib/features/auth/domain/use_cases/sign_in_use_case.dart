import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_repository.dart';

class SignInUseCase {
  final AuthContractRepository repository;

  SignInUseCase(this.repository);

  Future call({
    required String emailOrFullName,
    required UserType type,
    required String password,
  }) async {
    return repository.signIn(
      emailOrFullName: emailOrFullName,
      type: type,
      password: password,
    );
  }
}
