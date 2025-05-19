import 'package:go_router/go_router.dart';
import '../presentations/presentation.dart';

class RouterConst {
  static const String splash = 'splash';
  static const String splashGet = 'splashGet';
  static const String onboarding = 'onboarding';
}

class RouterConf {
  static final GoRouter goRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: RouterConst.splash,
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: RouterConst.splashGet,
        path: '/splashGet',
        builder: (context, state) => const SplashGetStartView(),
      ),
      GoRoute(
        name: RouterConst.onboarding,
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
