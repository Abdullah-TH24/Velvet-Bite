import 'package:equatable/equatable.dart';
import 'package:velvet_bite/features/dishes/domain/entities/dishes_entity.dart';

class ParentEntity extends Equatable {
  final String fullName;
  final String email;
  final List<DishesEntity> dishes;
  const ParentEntity(this.fullName, this.email, this.dishes);

  @override
  List<Object?> get props => [fullName, email, dishes];
}
