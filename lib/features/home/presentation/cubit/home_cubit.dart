import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:velvet_bite/features/home/domain/entities/dishes_entity.dart';
import 'package:velvet_bite/features/home/domain/entities/home_entity.dart';
import 'package:velvet_bite/features/home/domain/use_cases/get_user_info_and_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserInfoAndProductsUseCase getData;
  HomeCubit(this.getData) : super(HomeInitial());

  Future<void> getUserInfoAndProductsUseCase({required String token}) async {
    emit(HomeLoading());
    try {
      final HomeEntity data = await getData.call(token: token);
      List<DishesEntity> specialOffer = [];
      for (var i = 0; i < data.dishes.length; i++) {
        if (data.dishes[i].dishOffer! != 0) {
          specialOffer.add(data.dishes[i]);
        }
      }
      emit(HomeLoaded(data.fullName, data.email, specialOffer, data.dishes));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
