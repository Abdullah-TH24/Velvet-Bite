import 'package:shared_preferences/shared_preferences.dart';
import 'package:velvet_bite/features/splash/domain/contract_repositories/splash_contract_repository.dart';

class SplashRepositoryImpl implements SplashContractRepository {
  final SharedPreferences prefs;

  SplashRepositoryImpl(this.prefs);

  @override
  Future<bool> isFirstRun() async {
    final firstRun = prefs.getBool('is_first_run') ?? true;
    return firstRun;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return prefs.getBool('is_logged_in') ?? false;
  }
}
