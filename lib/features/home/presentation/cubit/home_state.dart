part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String fullName;
  final String email;
  final List<DishesEntity> specialOffer;
  final List<DishesEntity> popularFood;
  const HomeLoaded(
    this.fullName,
    this.email,
    this.specialOffer,
    this.popularFood,
  );

  @override
  List<Object> get props => [fullName, email, specialOffer, popularFood];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
