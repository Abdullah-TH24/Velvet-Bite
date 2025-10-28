import 'package:velvet_bite/features/home/domain/entities/home_entity.dart';
import 'package:velvet_bite/features/home/data/models/dishes_model.dart';

class HomeModel extends HomeEntity {
  const HomeModel(super.fullName, super.email, super.dishes);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final List<DishesModel> dishesList = (json['dishes'] as List)
        .map((dish) => DishesModel.fromJson(dish))
        .toList();

    return HomeModel(
      json['userInfo']['fullName'],
      json['userInfo']['email'],
      dishesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'dishes': dishes.map((dish) {
        if (dish is DishesModel) {
          return dish.toJson();
        }
        return {};
      }).toList(),
    };
  }
}
