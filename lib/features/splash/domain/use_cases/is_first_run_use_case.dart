import 'package:velvet_bite/features/splash/domain/contract_repositories/splash_contract_repository.dart';

class IsFirstRunUseCase {
  final SplashContractRepository repository;
  IsFirstRunUseCase(this.repository);

  Future<bool> call() async => await repository.isFirstRun();
}
