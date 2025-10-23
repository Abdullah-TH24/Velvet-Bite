import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velvet_bite/core/di/injection_container.dart';
import 'package:velvet_bite/core/routes/screens_routes_map.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/splash/data/imply_repositories/splash_repository_impl.dart';
import 'package:velvet_bite/features/splash/domain/use_cases/is_first_run_use_case.dart';
import 'package:velvet_bite/features/splash/domain/use_cases/is_user_logged_in_use_case.dart';
import 'package:velvet_bite/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:velvet_bite/features/splash/presentation/screens/splash_screen.dart';

late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  final repository = SplashRepositoryImpl(prefs);
  final checkFirstRun = IsFirstRunUseCase(repository);
  final checkUserLoggedIn = IsUserLoggedInUseCase(repository);
  await AppDependencies.init();

  runApp(
    MyApp(checkFirstRun: checkFirstRun, checkUserLoggedIn: checkUserLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  final IsFirstRunUseCase checkFirstRun;
  final IsUserLoggedInUseCase checkUserLoggedIn;

  const MyApp({
    super.key,
    required this.checkFirstRun,
    required this.checkUserLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        isFirstRunUseCase: checkFirstRun,
        isUserLoggedInUseCase: checkUserLoggedIn,
      ),
      child: GetMaterialApp(
        initialRoute: '/',
        defaultTransition: Transition.cupertinoDialog,
        transitionDuration: const Duration(seconds: 1),
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          ...pageRoutesMap,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Velvet Bite',
        theme: appTheme,
      ),
    );
  }
}
