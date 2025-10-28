import 'package:equatable/equatable.dart';

class DishesEntity extends Equatable {
  final int? dishId;
  final String? dishName;
  final String? dishReview;
  final String? resturantName;
  final String? dishPrice;
  final String? dishDescription;
  final int? dishOffer;
  final String? dishImage;
  final String? dishType;
  const DishesEntity(
    this.dishId,
    this.dishName,
    this.dishReview,
    this.resturantName,
    this.dishPrice,
    this.dishDescription,
    this.dishOffer,
    this.dishImage,
    this.dishType,
  );

  @override
  List<Object?> get props => [
    dishId,
    dishName,
    dishReview,
    resturantName,
    dishPrice,
    dishDescription,
    dishOffer,
    dishImage,
    dishType,
  ];
}
