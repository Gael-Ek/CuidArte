import 'package:cuidarte/CuidArte/home/presentation/home_screen.dart';
import 'package:cuidarte/domain/const/routes.dart';
import 'package:cuidarte/CuidArte/onboarding/presentation/onboarding_screen.dart';
import 'package:cuidarte/presentation/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.splashScrenn,
  routes: [
    GoRoute(
      path: Routes.splashScrenn,
      builder: (contex, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
  ],
);
