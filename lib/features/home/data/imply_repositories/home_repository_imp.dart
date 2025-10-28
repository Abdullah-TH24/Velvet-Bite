import 'package:velvet_bite/features/home/data/data_sources/home_data_source.dart';
import 'package:velvet_bite/features/home/domain/contract_repositories/home_respository.dart';

class HomeRepositoryImp implements HomeRespository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImp(this.homeDataSource);

  @override
  getUserInfoAndProducts({required String token}) {
    return homeDataSource.getUserInfoAndProducts(token: token);
  }
}
