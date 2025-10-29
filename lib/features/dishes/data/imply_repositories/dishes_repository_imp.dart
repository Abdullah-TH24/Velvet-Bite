import 'package:velvet_bite/features/dishes/data/data_sources/dishes_data_source.dart';
import 'package:velvet_bite/features/dishes/domain/contract_repositories/dishes_respository.dart';

class HomeRepositoryImp implements DishesRespository {
  final DishesDataSource dishesDataSource;
  HomeRepositoryImp(this.dishesDataSource);

  @override
  getUserInfoAndProducts({required String token}) {
    return dishesDataSource.getUserInfoAndProducts(token: token);
  }
}
