part of 'dishes_cubit.dart';

sealed class DishesState extends Equatable {
  const DishesState();

  @override
  List<Object> get props => [];
}

final class DishesInitial extends DishesState {}

final class DishesLoading extends DishesState {}

class DishesLoaded extends DishesState {
  final String fullName;
  final String email;
  final List<DishesEntity> specialOffer;
  final List<DishesEntity> popularFood;
  const DishesLoaded(
    this.fullName,
    this.email,
    this.specialOffer,
    this.popularFood,
  );

  @override
  List<Object> get props => [fullName, email, specialOffer, popularFood];
}

class DishesError extends DishesState {
  final String message;
  const DishesError(this.message);

  @override
  List<Object> get props => [message];
}
