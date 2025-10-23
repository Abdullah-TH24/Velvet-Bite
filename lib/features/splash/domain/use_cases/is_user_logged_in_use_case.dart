import 'package:velvet_bite/features/splash/domain/contract_repositories/splash_contract_repository.dart';

class IsUserLoggedInUseCase {
  final SplashContractRepository repository;
  IsUserLoggedInUseCase(this.repository);

  Future<bool> call() async => await repository.isUserLoggedIn();
}
