import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthContractRepository repository;

  SignUpUseCase(this.repository);

  Future call({
    required String email,
    required String fullName,
    required String password,
  }) async {
    return await repository.signUp(
      email: email,
      fullName: fullName,
      password: password,
    );
  }
}
