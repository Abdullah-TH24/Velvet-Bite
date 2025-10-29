import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:velvet_bite/features/dishes/domain/entities/dishes_entity.dart';
import 'package:velvet_bite/features/dishes/domain/entities/parent_entity.dart';
import 'package:velvet_bite/features/dishes/domain/use_cases/get_user_info_and_products_use_case.dart';

part 'dishes_state.dart';

class DishesCubit extends Cubit<DishesState> {
  final GetUserInfoAndProductsUseCase getData;
  DishesCubit(this.getData) : super(DishesInitial());

  Future<void> getUserInfoAndProductsUseCase({required String token}) async {
    emit(DishesLoading());
    try {
      final ParentEntity data = await getData.call(token: token);
      List<DishesEntity> specialOffer = [];
      for (var i = 0; i < data.dishes.length; i++) {
        if (data.dishes[i].dishOffer! != 0) {
          specialOffer.add(data.dishes[i]);
        }
      }
      emit(DishesLoaded(data.fullName, data.email, specialOffer, data.dishes));
    } catch (e) {
      emit(DishesError(e.toString()));
    }
  }
}
