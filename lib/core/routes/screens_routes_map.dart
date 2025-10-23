import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:velvet_bite/core/di/injection_container.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/features/auth/presentation/screens/sign_in.dart';
import 'package:velvet_bite/features/auth/presentation/screens/sign_up.dart';
import 'package:velvet_bite/features/auth/presentation/screens/welcome_auth.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/screens/slides_screen.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/screens/welcome_screen.dart';

List<GetPage<dynamic>> pageRoutesMap = [
  GetPage(
    name: ScreensRoutesNames.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: ScreensRoutesNames.slidesScreen,
    page: () => const SlidesScreen(),
  ),
  GetPage(
    name: ScreensRoutesNames.welcomeAuthScreen,
    page: () => const WelcomeAuth(),
  ),
  GetPage(
    name: ScreensRoutesNames.signIn,
    page: () => SignIn(
      signInUseCase: AppDependencies.signInUseCase,
      signUpUseCase: AppDependencies.signUpUseCase,
    ),
  ),
  GetPage(
    name: ScreensRoutesNames.signUp,
    page: () => SignUp(
      signInUseCase: AppDependencies.signInUseCase,
      signUpUseCase: AppDependencies.signUpUseCase,
    ),
  ),
];
