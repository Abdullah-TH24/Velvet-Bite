import 'package:velvet_bite/features/dishes/domain/entities/parent_entity.dart';
import 'package:velvet_bite/features/dishes/data/models/dishes_model.dart';

class ParentModel extends ParentEntity {
  const ParentModel(super.fullName, super.email, super.dishes);

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    final List<DishesModel> dishesList = (json['dishes'] as List)
        .map((dish) => DishesModel.fromJson(dish))
        .toList();

    return ParentModel(
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
