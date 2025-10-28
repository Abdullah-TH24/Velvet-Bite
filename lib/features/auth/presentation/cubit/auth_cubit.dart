import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_repository.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthCubit({required this.signInUseCase, required this.signUpUseCase})
    : super(const AuthInitial());

  Future<void> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
    required bool isPasswordVisible,
  }) async {
    emit(AuthLoading(isPasswordVisible: isPasswordVisible));
    try {
      final user = await signInUseCase.call(
        emailOrFullName: emailOrFullName,
        type: type,
        password: password,
      );
      emit(AuthSuccess(user, isPasswordVisible: isPasswordVisible));
    } catch (e) {
      log(e.toString());
      if (e.toString().contains('connection time out')) {
        emit(
          AuthError(
            'Please check your internet connection and try again later',
            isPasswordVisible: isPasswordVisible,
          ),
        );
      } else {
        emit(AuthError(e.toString(), isPasswordVisible: isPasswordVisible));
      }
    }
  }

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
    required bool isPasswordVisible,
  }) async {
    emit(AuthLoading(isPasswordVisible: isPasswordVisible));
    try {
      await signUpUseCase.call(
        email: email,
        fullName: fullName,
        password: password,
      );
      emit(AuthSuccess(null, isPasswordVisible: isPasswordVisible));
    } catch (e) {
      emit(
        AuthError(
          'Please check your internet connection and try again later',
          isPasswordVisible: isPasswordVisible,
        ),
      );
    }
  }

  void reset() {
    emit(const AuthInitial());
  }

  void togglePasswordVisibility() {
    emit(AuthInitial(isPasswordVisible: !state.isPasswordVisible));
  }
}
