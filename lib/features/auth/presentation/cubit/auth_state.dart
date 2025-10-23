import 'package:equatable/equatable.dart';
import 'package:velvet_bite/features/auth/domain/entities/auth_entity.dart';

abstract class AuthState extends Equatable {
  final bool isPasswordVisible;

  const AuthState({this.isPasswordVisible = false});

  @override
  List<Object?> get props => [isPasswordVisible];
}

class AuthInitial extends AuthState {
  const AuthInitial({super.isPasswordVisible = false});
}

class AuthLoading extends AuthState {
  const AuthLoading({super.isPasswordVisible = false});
}

class AuthSuccess extends AuthState {
  final AuthEntity? user;
  const AuthSuccess(this.user, {super.isPasswordVisible = false});

  @override
  List<Object?> get props => [user, isPasswordVisible];
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message, {super.isPasswordVisible = false});

  @override
  List<Object?> get props => [message, isPasswordVisible];
}
