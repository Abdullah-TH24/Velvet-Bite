import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velvet_bite/features/splash/domain/use_cases/is_first_run_use_case.dart';
import 'package:velvet_bite/features/splash/domain/use_cases/is_user_logged_in_use_case.dart';
import 'package:velvet_bite/features/splash/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsFirstRunUseCase isFirstRunUseCase;
  final IsUserLoggedInUseCase isUserLoggedInUseCase;

  SplashCubit({
    required this.isFirstRunUseCase,
    required this.isUserLoggedInUseCase,
  }) : super(SplashInitial()) {
    _init();
  }

  Future<void> _init() async {
    final firstRun = await isFirstRunUseCase();
    if (firstRun) {
      emit(NavigateToWelcome());
      return;
    }
    final loggedIn = await isUserLoggedInUseCase();
    if (loggedIn) {
      emit(NavigateToHome());
    } else {
      emit(NavigateToWelcomeAuth());
    }
  }
}
