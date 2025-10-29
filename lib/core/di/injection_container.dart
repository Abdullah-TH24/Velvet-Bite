import 'package:velvet_bite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:velvet_bite/features/auth/data/imply_repositories/auth_repository_imp.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:velvet_bite/features/dishes/data/data_sources/dishes_data_source.dart';
import 'package:velvet_bite/features/dishes/data/imply_repositories/dishes_repository_imp.dart';
import 'package:velvet_bite/features/dishes/domain/use_cases/get_user_info_and_products_use_case.dart';

class AppDependencies {
  static late final SignInUseCase signInUseCase;
  static late final SignUpUseCase signUpUseCase;
  static late final GetUserInfoAndProductsUseCase getUserInfoAndProductsUseCase;

  static Future<void> init() async {
    // ====== AUTH ======
    final authRemoteDataSource = AuthRemoteDataSourceImpl();
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);
    signInUseCase = SignInUseCase(authRepository);
    signUpUseCase = SignUpUseCase(authRepository);

    // ====== HOME ======
    final homeDataSource = DishesDataSourceImp();
    final homeRepository = HomeRepositoryImp(homeDataSource);
    getUserInfoAndProductsUseCase = GetUserInfoAndProductsUseCase(
      homeRepository,
    );
  }
}
