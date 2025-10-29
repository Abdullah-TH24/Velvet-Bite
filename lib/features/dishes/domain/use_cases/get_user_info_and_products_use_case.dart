import 'package:velvet_bite/features/dishes/domain/contract_repositories/dishes_respository.dart';

class GetUserInfoAndProductsUseCase {
  final DishesRespository respository;

  GetUserInfoAndProductsUseCase(this.respository);

  call({required String token}) async =>
      await respository.getUserInfoAndProducts(token: token);
}
