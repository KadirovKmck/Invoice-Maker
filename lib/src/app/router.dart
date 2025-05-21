import 'package:go_router/go_router.dart';
import 'package:invoice_maker/src/presentations/dashboard/view/dashboard_view.dart';
import 'package:invoice_maker/src/presentations/paid_tab_content/view/paid_tab_content_view.dart';

import '../presentations/presentation.dart';

class RouterConst {
  static const String splash = 'splash';
  static const String splashGet = 'splashGet';
  static const String onboarding = 'onboarding';
  static const String saveEmail = 'saveEmail';
  static const String addLogo = 'addLogo';
  static const String auth = 'auth';
  static const String dashboard = 'dashboard';
  static const String paidtabcontent = 'paid_tab_content';
}

class RouterConf {
  static final GoRouter goRouter = GoRouter(
    initialLocation: '/paid_tab_content',
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
      GoRoute(
        name: RouterConst.auth,
        path: '/auth',
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        name: RouterConst.saveEmail,
        path: '/saveEmail',
        builder: (context, state) => const SaveYourEmailView(),
      ),
      GoRoute(
        name: RouterConst.addLogo,
        path: '/addLogo',
        builder: (context, state) => const AddLogoView(),
      ),
      GoRoute(
        name: RouterConst.dashboard,
        path: '/dashboard',
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(
        name: RouterConst.paidtabcontent,
        path: '/paid_tab_content',
        builder: (context, state) => PaidTabContentView(),
      ),
    ],
  );
}
