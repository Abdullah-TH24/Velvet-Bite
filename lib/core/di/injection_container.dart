import 'package:velvet_bite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:velvet_bite/features/auth/data/imply_repositories/auth_repository_imp.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_up_use_case.dart';

class AppDependencies {
  static late final SignInUseCase signInUseCase;
  static late final SignUpUseCase signUpUseCase;

  static Future<void> init() async {
    final remoteDataSource = AuthRemoteDataSourceImpl();
    final repository = AuthRepositoryImpl(remoteDataSource);

    signInUseCase = SignInUseCase(repository);
    signUpUseCase = SignUpUseCase(repository);
  }
}
