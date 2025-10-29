import 'package:velvet_bite/features/dishes/domain/entities/dishes_entity.dart';

class DishesModel extends DishesEntity {
  const DishesModel(
    super.dishId,
    super.dishName,
    super.dishReview,
    super.resturantName,
    super.dishPrice,
    super.dishdescription,
    super.dishOffer,
    super.dishImage,
    super.dishType,
  );

  factory DishesModel.fromJson(Map json) {
    return DishesModel(
      json['did'],
      json['dname'],
      json['dreview'],
      json['rname'],
      json['dprice'],
      json['ddescription'],
      json['doffer'],
      json['dimage'],
      json['dtype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'did': super.dishId,
      'dname': super.dishName,
      'dreview': super.dishReview,
      'rname': super.resturantName,
      'dprice': super.dishPrice,
      'ddescription': super.dishDescription,
      'doffer': super.dishOffer,
      'dimage': super.dishImage,
      'dtype': super.dishType,
    };
  }
}
