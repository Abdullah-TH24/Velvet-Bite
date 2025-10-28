import 'package:equatable/equatable.dart';
import 'package:velvet_bite/features/home/domain/entities/dishes_entity.dart';

class HomeEntity extends Equatable {
  final String fullName;
  final String email;
  final List<DishesEntity> dishes;
  const HomeEntity(this.fullName, this.email, this.dishes);

  @override
  List<Object?> get props => [fullName, email, dishes];
}
