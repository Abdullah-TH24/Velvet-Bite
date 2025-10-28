import 'package:velvet_bite/features/home/domain/contract_repositories/home_respository.dart';

class GetUserInfoAndProductsUseCase {
  final HomeRespository respository;

  GetUserInfoAndProductsUseCase(this.respository);

  call({required String token}) async =>
      await respository.getUserInfoAndProducts(token: token);
}
